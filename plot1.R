
setwd("C:/Users/Vivek/Documents/Data Analysis/R Programming/datasciencecoursera/EDA Project/EDA-Project-2")


NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


Source_Classification_Code

library(tidyverse)
attach(NEI)
glimpse(NEI)

NEI$year <- as.factor(NEI$year)
NEI$type <- as.factor(NEI$type)

full_data <- NEI %>% 
             group_by(year) %>% 
             summarize(Total_Emission = round(sum(Emissions)/1000000,2))

attach(full_data)
glimpse(full_data)

barplot(Total_Emission,names = year,xlab = "Year",ylab = "Total Emission (in millions)",col = "gray", main = "Plot1")


