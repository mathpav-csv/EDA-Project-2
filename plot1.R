
Source_Classification_Code

library(tidyverse)

attach(summarySCC_PM25)
glimpse(summarySCC_PM25)

full_data <- summarySCC_PM25 %>% group_by(year) %>% summarize(Total_Emission = sum(Emissions))

plot(factor(full_data$year),full_data$Total_Emission)
ylab = "Total Emissions"

