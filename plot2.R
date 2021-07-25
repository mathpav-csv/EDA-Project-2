
BTCity_Emissions <- NIE %>% filter(fips == "24510")
BTfull_data <- BTCity_Emissions %>% 
                  group_by(year) %>% 
                  summarize(Total_Emission = round(sum(Emissions)/1000,2))

attach(BTfull_data)
year <- as.factor(year)

barplot(Total_Emission,names = year,xlab = "Year",ylab = "Total Emission (in 1000's)",col = "pink", main = "Plot2")
