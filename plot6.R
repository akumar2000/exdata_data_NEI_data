        library(ggplot2)
        ## Read data from data file 
        NEI <- readRDS("./data/summarySCC_PM25.rds")
        
        ## Read the classification file        
        
        SCC <- readRDS("./data/Source_Classification_Code.rds")
        
        ## Get rows which are caused by coal
        subsetVehicleBal <- subset(NEI, (NEI$fips == "24510" & NEI$type == "ON-ROAD"))
        
        subsetVehicleLA <- subset(NEI, (NEI$fips == "06037" & NEI$type == "ON-ROAD"))
        
        
        aggregateforyearBAL <- aggregate(Emissions ~ year, subsetVehicleBal, sum)
        aggregateforyearLA <- aggregate(Emissions ~ year, subsetVehicleLA, sum)
        
        
        
        png("plot6.png", width=880, height=480)
        
        par(mfrow = c(1,2))
        
        barplot(height=aggregateforyearBAL$Emissions, names.arg=aggregateforyearBAL$year, xlab="years", ylab=expression('total PM'[2.5]*' emission'),main=expression('Total PM'[2.5]*' emissions at various years'))
        barplot(height=aggregateforyearLA$Emissions, names.arg=aggregateforyearLA$year, xlab="years", ylab=expression('total PM'[2.5]*' emission'),main=expression('Total PM'[2.5]*' emissions at various years'))
        
##    g <- ggplot(aggregateforyearBAL, aes(factor(year), Emissions))
    ##    g <- g + geom_bar(stat="identity") +
    ##            xlab("year") +
    ##            ylab(expression('Total PM'[2.5]*" Emissions")) +
     #           ggtitle('Total Emissions from BAL vehicle sources from 1999 to 2008')
        
        
    ##    g <- ggplot(aggregateforyearLA, aes(factor(year), Emissions))
    ##    g <- g + geom_bar(stat="identity") +
    ##            xlab("year") +
    ##            ylab(expression('Total PM'[2.5]*" Emissions")) +
     ##           ggtitle('Total Emissions from LA vehicle from 1999 to 2008')
    ##    print(g)
        dev.off()

        