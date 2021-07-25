library(tidyverse)
library(ggplot2)


attach(summarySCC_PM25)
year <- as.factor(year)


data <- summarySCC_PM25 %>% 
        filter(fips == "24510") %>% 
        group_by(year,type) %>%
        summarize(Total_Emission = sum(Emissions))

glimpse(data)
data$year <- as.factor(data$year)
data$type <- as.factor(data$type)

ggplot(data,aes(year,Total_Emission,fill = type)) + geom_bar(stat = "identity")+ facet_wrap(~type)
