#Load libraries 
library(readxl)
library(openxlsx)
library(xlsx)
library(tidyverse)

#Load Voter Registry Data 
Voter_Registry <- read_excel("~/Documents/Spring2021/Visual Analytics/SomethingFishy/DC1-data/Voter Registry/Voter Registry.xls")
View(Voter_Registry)

#Filter by data 8-Apr-34
Datefishy <- filter(Voter_Registry, DOB %in% c('8-Apr-34'))

#Voter Party Distribution
ggplot(Voter_Registry, aes(x = PARTY, fill = POB)) + 
  geom_bar() +
  labs( 
    title = "Political Party of Voters",
    x = "Political Party",
    y = "Count") +
  theme(axis.text.x = element_text(angle = 45))

#Person born in Switzerland 
swissy <- filter(Voter_Registry, POB %in% c('SWITZERLAND'))