        library(ggplot2)
        ## Read data from data file 
        NEI <- readRDS("./data/summarySCC_PM25.rds")
        
        ## Read the classification file        
        
        SCC <- readRDS("./data/Source_Classification_Code.rds")
        
        ## Get rows which are caused by coal
        subsetVehicle <- subset(NEI, (NEI$fips == "24510" & NEI$type == "ON-ROAD"))
        
        aggregateforyear <- aggregate(Emissions ~ year, subsetVehicle, sum)
        
        png("plot5.png", width=640, height=480)
        g <- ggplot(aggregateforyear, aes(factor(year), Emissions))
        g <- g + geom_bar(stat="identity") +
                xlab("year") +
                ylab(expression('Total PM'[2.5]*" Emissions")) +
                ggtitle('Total Emissions from vehicle from 1999 to 2008')
        print(g)
        dev.off()
