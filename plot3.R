        
        Library(ggplot2)
        
        ## Read data from data file 
        NEI <- readRDS("./data/summarySCC_PM25.rds")
        
        ## Read the classification file        
        
        SCC <- readRDS("./data/Source_Classification_Code.rds")
        
        marylanddata <- subset(NEI, NEI$fips == "24510")
        
        sumforyear <- aggregate(Emissions ~ year + type, marylanddata, sum)
        
        png("plot3.png", width = 640, height = 480)
        
        g <- ggplot(sumforyear, aes(year, Emissions, color = type))
        g <- g + geom_line() +
                xlab("year") +
                ylab(expression('Total PM'[2.5]*" Emissions")) +
                ggtitle('Total Emissions in Baltimore City, Maryland (fips == "24510") from 1999 to 2008')
        print(g)
        
        dev.off()
        
        
        
        