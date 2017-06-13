# Plot vector results
# Copyright (C) 2016 by Thomas Dreibholz
# Contact: dreibh@simula.no

library(ggplot2)
library(Hmisc)

source("plotter.R")

name <- "hioa-ku"


# Specification of the x-axis sorting order:
allResults <- loadResults("passive.flow-ReceivedBitRate.data.bz2")
#allResults <- loadResults(paste(sep="",name,"/passive.flow-ReceivedBitRate.data.bz2"))
allResults <- subset(allResults,allResults$CMT == 'off')

allResults$IPVersion <- factor(allResults$IPVersion,levels=c("4","6"))

# Colours:
# colorsFiber <- c("orange","salmon")
# colorsADSL  <- c("green","forest green","royal blue","blue")
plotColours <- c("green","lightgreen","royal blue","blue", "orange","salmon","red","yellow","lightgray","lightcyan","lightcyan2","lightcyan3","lightcyan4","orchid","orchid1","orchid2","orchid3","orchid4")
#plotColours <- c("green", "blue")

#for(CC in (cubic reno dctcp bic highspeed htcp hybla illinois lp scalable vegas veno westwood yeah balia lia olia wvegas))
#for(CC in (cubic reno dctcp bic highspeed htcp hybla illinois lp scalable vegas veno westwood yeah balia lia olia wvegas))
#for(CC in('cubic','reno','dctcp','bic','highspeed','htcp','hybla')
#,'illinois','lp','scalable','vegas','veno','westwood','yeah','balia','lia','olia','wvegas'))
#CC count =18
for(ipversion in c(6))
{
allResultsSubset <- subset(allResults,allResults$IPVersion == ipversion)

pdf(paste(sep="", name,"-IPv",ipversion,".pdf"), width=10, height=10, family="Helvetica", pointsize=22)

numberOfRuns <- length(levels(factor(allResultsSubset$TimeStamp)))
title <- paste(sep="", levels(factor(allResults$FromSite)), " -> ", levels(factor(allResults$ToSite)))

xSet <- allResultsSubset$CC
xTitle <- "cc"

ySet <- allResultsSubset$passive.flow.ReceivedBitRate/(1024*1024)
yTitle <- "Application Payload Throughput[Mbit/s]"

zSet <- sprintf("%s-%s",allResultsSubset$FromProvider,allResultsSubset$ToProvider)
zTitle <- "From Provider{F}"

xAxisTicks <- c()
yAxisTicks <- c()
#xAxisTicks <- getIntegerTicks(xSet)   # Set to c() for automatic setting
#yAxisTicks <- getIntegerTicks(ySet)   # Set to c() for automatic setting


hset<-data.frame(CC=xSet,ReceivedBitRate=ySet,Path=zSet)

p <- ggplot(hset,
   aes(x=CC,y=ReceivedBitRate,fill=CC)) +
   scale_fill_manual(values = plotColours)
p <- p + labs(title=title,
         fill=zTitle,
         x=xTitle,
         y=yTitle)
# Theme (see http://docs.ggplot2.org/0.9.2.1/theme.html for options):
p <- p + theme(title           = element_text(size=16),
          axis.title      = element_text(size=16),
          strip.text      = element_text(size=16, face="bold"),
          axis.text.x     = element_text(size=14, angle=45, face="bold", colour="black"),
          axis.text.y     = element_text(size=14, angle=90, hjust=0.5, colour="black"),
          legend.position = "none")
p <- p + facet_grid(~Path) + 
    stat_summary(fun.y=mean, geom='bar', size=3)

# Add confidence intervals:
# NOTE: Needs at least 2 (*two*) runs to work!
if(numberOfRuns >= 2) {
p <- p + stat_summary(fun.data=mean_cl_boot, geom='pointrange', colour="red")
}

# All values as text:
# p <- p + geom_text(aes(label=sprintf("%1.1f", ReceivedBitRate)),
#                    vjust=1.5,colour='blue',position=position_dodge(.9),size=6)
# Only mean value as text:
p <- p + stat_summary(aes(label=round(..y..,2)), fun.y=mean, geom="text",
                 colour='blue', size=6, vjust = -0.5)
     
print(p)
}
dev.off()	
