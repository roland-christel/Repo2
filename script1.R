#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++###
##CODE R                                                                     ###
##                                                                           ###
#                                                                            ###
##                                                                           ###
## Updated: September, 2023                                                  ###
##+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++###

rm(list=ls())

# Packages
if(!require("readxl")){install.packages("readxl")}
if(!require("tidyverse")){install.packages("tidyverse")}
if(!require("ggtext")){install.packages("ggtext")}
if(!require("patchwork")){install.packages("patchwork")}
if(!require("mfx")){install.packages("mfx")}
if(!require("aod")){install.packages("aod")}
if(!require("ROSE")){install.packages("ROSE")}
if(!require("ROS")){install.packages("ROSE")}

# Import Data

data <- read_xlsx("GraftingData.xlsx", sheet = "descrip")
names(data)


# Data wrangling

data <-  data %>%
              mutate_at(c(1:4,6), as.factor)

ws_graf <-  data %>%
                 group_by(water_stress, grafting_success) %>%
                 summarise(N = n()) %>%
                 mutate(percent = N/(sum(N))) %>%
                 filter(grafting_success=="1") %>%
                 dplyr::select(-N) %>%
                 mutate(labels="Water stress")

ws_graf$water_stress <- fct_relevel(ws_graf$water_stress, "Control", "Low", "High")
