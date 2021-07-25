
setwd("C:/Users/Vivek/Documents/Data Analysis/R Programming/datasciencecoursera/EDA Project/EDA-Project-2")


NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


Source_Classification_Code

library(tidyverse)
attach(NEI)
glimpse(NEI)

NEI$year <- as.factor(NEI$year)
NEI$type <- as.factor(NEI$type)

full_data <- left_join(NEI,SCC,by = "SCC")

coal <-  subset(full_data, EI.Sector == "Fuel Comb - Comm/Institutional - Coal"
               | EI.Sector == "Fuel Comb - Electric Generation - Coal" | EI.Sector == "Fuel Comb - Industrial Boilers, ICEs - Coal")


coal_Summary <- coal %>% group_by(year) %>% summarise(Total_Emission = round(sum(Emissions)/100000,2))

glimpse(coal_Summary)
z <- ggplot(coal_Summary,aes(year,Total_Emission))+ geom_col()
z+ labs(title = "Cumulative PM2.5 due to Coal", 
        xlab = "Year" , 
        ylab = "Total Emission (in 100 thousand)")

z + theme_classic()+ labs(title = "Cumulative PM2.5 due to Coal", xlab = "Year",ylab = "Total Emission (in 100 thousand)")+ theme(text = element_text(family = "serif",size = 14),
          axis.title = element_text(color = "black"),
          axis.title.x = element_text(colour = "black",size = 10),
          axis.title.y = element_text(angle = 90,size = 10),
          axis.text = element_text(family = "serif",size = 8),
          axis.text.x = element_text(angle = 90,color = "red"),
          line = element_line(linetype = 0),
          axis.line = element_line(linetype = 1,color = "gray",lineend = "square"),
          axis.line.x = element_line(linetype = 1,color = "gray",lineend = "square"),
          axis.ticks.x = element_line(linetype = 1,color = "red"),
          axis.ticks.y = element_line(linetype = 1,color = "black"),
          rect = element_rect(fill = "NA",linetype = 1),
          panel.background = element_rect(fill = "light grey"),
          plot.title = element_text(size = rel(1))) 
          
          
      


