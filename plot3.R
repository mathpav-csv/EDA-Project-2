library(tidyverse)
library(ggplot2)


attach(summarySCC_PM25)
year <- as.factor(year)


data <- NEI %>% 
        filter(fips == "24510") %>% 
        group_by(year,type) %>%
        summarize(Total_Emission = round(sum(Emissions)/1000,2))

glimpse(data)
data$year <- as.factor(data$year)
data$type <- as.factor(data$type)

z <- ggplot(data,aes(year,Total_Emission,fill = type)) + geom_bar(stat = "identity")+ facet_wrap(~type)

z + theme(text = element_text(family = "serif",size = 10), 
          panel.grid = element_blank(),
          panel.background = element_rect(colour = "gray"))

library(ggthemes)

z+theme_fivethirtyeight()          
