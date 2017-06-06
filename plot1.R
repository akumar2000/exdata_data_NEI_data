        ## Read data from data file 
        NEI <- readRDS("./data/summarySCC_PM25.rds")
        
        ## Read the classification file        
        
        SCC <- readRDS("./data/Source_Classification_Code.rds")

        sumforyear <- aggregate(Emissions ~ year, NEI, sum)

        png('plot1.png')
        
        barplot(height=sumforyear$Emissions, names.arg=sumforyear$year, xlab="years", ylab=expression('total PM'[2.5]*' emission'),main=expression('Total PM'[2.5]*' emissions at various years'))
        
        dev.off()
        