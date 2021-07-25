
BTCity_Emissions <- summarySCC_PM25 %>% filter(fips == "24510")
BTfull_data <- BTCity_Emissions %>% 
                  group_by(year) %>% 
                  summarize(Total_Emission = sum(Emissions))

attach(BTfull_data)
year <- as.factor(year)

plot(year,Total_Emission)
