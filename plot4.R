        
        library(ggplot2)
        ## Read data from data file 
        NEI <- readRDS("./data/summarySCC_PM25.rds")
        
        ## Read the classification file        
        
        SCC <- readRDS("./data/Source_Classification_Code.rds")
        
        ##Merge the two data frames by SCC
        NEISCC <- merge(NEI, SCC, by = "SCC")
        
        ##Get the rows which are caused by coal
        coalMatches <- grepl("coal", NEISCC$Short.Name, ignore.case = TRUE)
        ## Get rows which are caused by coal
        subsetCoal <- NEISCC[coalMatches,]
        
        aggregateforyear <- aggregate(Emissions ~ year, subsetCoal, sum)
        
        png("plot4.png", width=640, height=480)
        g <- ggplot(aggregateforyear, aes(factor(year), Emissions))
        g <- g + geom_bar(stat="identity") +
                xlab("year") +
                ylab(expression('Total PM'[2.5]*" Emissions")) +
                ggtitle('Total Emissions from coal sources from 1999 to 2008')
        print(g)
        dev.off()
        