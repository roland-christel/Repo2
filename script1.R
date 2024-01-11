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

# Import Data

data <- read_xlsx("GraftingData.xlsx", sheet = "descrip")
names(data)
