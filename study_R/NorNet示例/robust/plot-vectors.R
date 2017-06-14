source("plotter.R")

name = "Results-wallaby-klaraelven.kau.nornet-2h-1h"

# ====== Load all vectors ===================================================
allResults <- data.frame()

# Using a scalar data table as overview, in order to get the vector file names:
overview <- loadResults(paste(sep="", name, "/passive.flow-ReceivedBitRate.data.bz2"))
vectorFileBases <- levels(factor(overview$VectorFileNameBase))
for(vectorFileBase in vectorFileBases) 
{
   # The interesting file is the passive-side vector output
   vectorFile <- gsub("(.vec.bz2)$", "-passive.vec.bz2", vectorFileBase)

   # Only use the received data statistics, no separation between flows.
   data <- loadResults(vectorFile)
   data <- subset(data, data$FlowID == -1)           # <<-- Sum of all flows!
   data <- subset(data, data$Action == "Received")
   
   # Get the parameters having produced this vector. This is a one-row matrix.
   p1 <- subset(overview, overview$VectorFileNameBase == vectorFileBase)[1,]
   
   # Duplicate the single parameter row to nrow(data) rows:
   parameters <- p1[rep(1, times = nrow(data)), ]
   
   # Now, it is possible to combine the data matrix with the parameter matrix:
   dataWidthParameters <- cbind(data, parameters)

   # Combine everything into the results table:
   allResults <- rbind(allResults, dataWidthParameters)
}
data <- NA   # The output is in "allResults" here!

allResults$Relation <- sprintf("%s -> %s",allResults$FromSite,allResults$ToSite)

# ====== Plot as PDF file ===================================================
pdf(paste(sep="", name, ".pdf"), width=15, height=15, family="Helvetica", pointsize=22)


for(relation in levels(factor(allResults$Relation))) 
{

   allResultsSubset <- subset(allResults, (allResults$Relation == relation))

   title <- paste(sep="", relation)
   
   # NOTE: The 3 clients have their own "relative" time. Using "absolute" time here!!!
   xSet   <- allResultsSubset$RelTime # / 1000000.0
   xTitle <- "Time [s]"

   ySet <- 8 * allResultsSubset$RelBytes / 1000000
   yTitle <- "Mbit/s Received"
   # "Application Payload Throughput [Mbit/s]"

   zSet   <- allResultsSubset$FromProvider
   zTitle <- "From Provider{F}"
   vSet   <- allResultsSubset$ToProvider
   vTitle <- "To Provider{T}"
   wSet   <- c()
   wTitle <- ""


   aSet   <- allResultsSubset$CMT
   aTitle <- "CMT"
   bSet   <- allResultsSubset$CC
   bTitle <- "CC"

   pSet   <- allResultsSubset$Relation
   pTitle <- "Relation{R}"

   xAxisTicks <- seq(0,120,10) 
   yAxisTicks <- seq(0,600,60)
#  xAxisTicks <- getIntegerTicks(xSet)   # Set to c() for automatic setting
#  yAxisTicks <- getIntegerTicks(ySet)   # Set to c() for automatic setting
   dotSet <- 0:18
   legendPos <- c(1,1)

   plotstd6(title,
            pTitle, aTitle, bTitle, xTitle, yTitle, zTitle,
            pSet, aSet, bSet, xSet, ySet, zSet,
            vSet, wSet, vTitle, wTitle,
            xAxisTicks=xAxisTicks,
            yAxisTicks=yAxisTicks,
            dotSet=dotSet,
            type="l",
            colorMode=cmColor,
            hideLegend=FALSE,
            legendPos=legendPos,
            pStart=-1)

}
dev.off()
