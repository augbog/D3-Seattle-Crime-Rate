

beat.KML2<-readOGR("doc.kml", "SPD_BEATS_WGS84") #open the KML in a text editor to find the layer name (in this case "SPD_BEATS_WGS84")
svg(filename = "allCrime.svg", width = 7, height = 10)
#yaxt/xaxt/bty to get rid of plot axes
require(scales)
plot(cleanedData$Latitude~-cleanedData$Longitude, ylim=c(47.47,47.73), xlim=c(-122.43,-122.23), 
     pch=20, xlab="", ylab="", xaxt = 'n', yaxt = 'n', bty = 'n', col= alpha("black", .1))
plot(beat.KML2, border="black", add=T)
dev.off()

svg(filename = "violentCrime.svg", width = 7, height = 10)
plot(cleanedData$Latitude[which(generalized.crime.type == "violent crime")]~-cleanedData$Longitude[which(generalized.crime.type == "violent crime")], 
     pch = 20, ylim=c(47.47,47.73), xlim=c(-122.43,-122.23),
     xlab="", ylab="", xaxt = 'n', yaxt = 'n', bty = 'n', col=alpha("red", .1))
plot(beat.KML2, border="black", add=T)
dev.off()