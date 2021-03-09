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
print(Datefishy)

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
print(swissy)

#Load Phone Log data 
Phone_log <- read_excel("DC1-data/City Hall Phone Log/Conference Room Phone Log.xls")
View(Phone_log)

#remove first 23 rows and last 3 columns 
Phone_log <- Phone_log[-c(1:24),(1:4)]

#rename column headers 
names(Phone_log)[1] <- "DATE" 
names(Phone_log)[2] <- "TIME" 
names(Phone_log)[3] <- "NUMBERCALLED" 
names(Phone_log)[4] <- "TYPE" 

str(Phone_log)

#Filter the international number
international <- Phone_log %>%
  filter(str_detect(NUMBERCALLED,'41 0'))

#Filter numbers other than 509 area code 
outsider_call <- Phone_log %>%
  filter(str_detect(NUMBERCALLED,'509', negate = TRUE))

#Visualization of outside call 
ggplot(outsider_call, aes(x=NUMBERCALLED, fill=TYPE)) + 
  geom_bar() +
  labs( 
    title = "Phone Calls Made to non-Alderwood Numbers",
    x = "Phone Number",
    y = "Count") +
  theme(axis.text.x = element_text(angle = 45))
