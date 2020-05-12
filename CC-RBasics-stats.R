# Coding Club Workshop 1 - R Basics
# Learning how to import and explore data, and make graphs about Edinburgh's biodiversity
# Written by Gergana Daskalova 06/11/2016 University of Edinburgh

# Lessons for Ann

#Import edidiv dataset

edidiv <- read.csv("/Users/ann/github/CC-RBasics/edidiv.csv")

# Check data

head(edidiv)                # Displays the first few rows

tail(edidiv)                # Displays the last rows

str(edidiv)                 # Tells you whether the variables are continuous, integers, categorical or characters

#Calculate species richness

Beetle <- filter(edidiv, taxonGroup == "Beetle")
# The first argument of the function is the data frame, the second argument is the condition you want to filter on. Because we only want the beetles here, we say: the variable taxonGroup MUST BE EXACTLY (==) Beetle - drop everything else from the dataset. (R is case-sensitive so it's important to watch your spelling! "beetle" or "Beetles" would not have worked here.)

Bird <- filter(edidiv, taxonGroup == "Bird")   # We do the same with birds. It's very similar to filtering in Excel if you are used to it.
# You can create the objects for the remaining taxa. If you need to remind yourself of the names and spellings, type summary(edidiv$taxonGroup)

Butterfly <- filter(edidiv, taxonGroup == "Butterfly") 
Dragnonfly <- filter(edidiv, taxonGroup == "Dragonfly")
Flowering.Plants <- filter(edidiv, taxonGroup == "Flowering.Plants")
Fungus <- filter(edidiv, taxonGroup == "Fungus")
Hymenopteran <- filter(edidiv, taxonGroup == "Hymenopteran")
Lichen <- filter(edidiv, taxonGroup == "Lichen")
Liverwort <- filter(edidiv, taxonGroup == "Liverwort")
Mammal <- filter(edidiv, taxonGroup == "Mammal")
Mollusc <- filter(edidiv, taxonGroup == "Mollusc")

a <- length(unique(Beetle$taxonName))
b <- length(unique(Bird$taxonName))
# You can choose whatever names you want for your objects, here I used a, b, c, d... for the sake of brevity.

c <- length(unique(Butterfly$taxonName))
d <- length(unique(Dragnonfly$taxonName))
e <- length(unique(Flowering.Plants$taxonName)) 
f <- length(unique(Fungus$taxonName))

g <- length(unique(Hymenopteran$taxonName))
h <- length(unique(Lichen$taxonName))
i <- length(unique(Liverwort$taxonName))
j <- length(unique(Mammal$taxonName))
k <- length(unique(Mollusc$taxonName))

biodiv <- c(a,b,c,d,e,f,g,h,i,j,k)

names(biodiv) <- c("Beetle","Bird","Butterfly", "Dragonfly","Flowering.Plants", "Fungus","Hymenopteran",
                   "Lichen", "Liverwort", "Mammal", "Mollusc")

barplot(biodiv)

help(barplot)     # For help with the barplot() function
help(par)         # For help with plotting in general

barplot(biodiv, xlab="Taxa", ylab = "number of species", ylim = c(0,600), las = 2)

barplot(biodiv, xlab="Taxa", ylab = "number of species", ylim = c(0,600), las = 1, cex.names = 0.25, 
                cex.axis = 1.0, cex.lab = 1.5)


#First graphing challenge from Session 1. 

wing <- read.csv("/Users/ann/github/CC-RBasics/data/wingspan.csv")

#sort by species

wing_sort <- wing[order(wing$Av_species),]

Eagle <- filter(wing_sort, Av_species == "eagle") 
Hummingbird <- filter(wing_sort, Av_species == "hummingbird")
Kingfisher <- filter(wing_sort, Av_species == "kingfisher") 
Sparrow <- filter(wing_sort, Av_species == "sparrow")

xeagle <- mean(Eagle$Wingspan)
xhumming <- mean(Hummingbird$Wingspan)
xking <- mean(Kingfisher$Wingspan)
xsparrow <- mean(Sparrow$Wingspan)

avgspan <- c(xeagle, xhumming, xking, xsparrow)

names(avgspan) <- c("Eagle", "Hummer", "King", "Sparrow")

barplot(avgspan)

barplot(avgspan, xlab="Bird", ylab = "Average Wing Span", ylim = c(0,200), las = 2)









