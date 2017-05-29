#### Structure-like Population Genetic Analyses ####


#1. Load additional packages and codes necessary before to start population structure analysis
install.packages(c("fields","mapplots"))
source("http://bioconductor.org/biocLite.R")
biocLite("LEA")


#2.Load libraries
library(RColorBrewer)
library(grid)
library(spam)
library(maps)
library(fields)
library(mapplots)
library(LEA)


#3. Load additional functions to import input files from the structure format, and to display
#nice geographic representations of ancestry coefficients with maps
source("http://membres-timc.imag.fr/Olivier.Francois/Conversion.R")
source("http://membres-timc.imag.fr/Olivier.Francois/POPSutilities.R")


#4. Import input files
input.file <- "../data/genotepts.str"


#5. Convert from .str format to .geno, in the function 'struct2geno':
#FORMAT = 1, must be used when markers are encoded using one row of data for each individual
#TESS = T, indicate the include of columns that contains geographic information
struct2geno(file= input.file, TESS= TRUE, diploid= TRUE, FORMAT= 1, extra.row= 0, extra.col= 0, 
            output= "ept_euro.geno")
#This conversion exports automatically the geographic coordinates in a .coord file


#6. Run a population structure analysis that assumes K= 4 clusters
obj.snmf <- snmf("ept_euro.geno", K= 4, alpha= 100, project= "new")
qmatrix <- Q(obj.snmf, K= 4)
#The qmatrix object contains the matrix of ancestry coefficients for each individual and for 
#K= 4 clusters. 


#7. Display the Q-matrix using a barplot representation
barplot(t(qmatrix), col= c("orange","violet","lightgreen","steelblue4"), border= NA, space= 0,
        xlab= "Individuals", ylab= "Admixture coefficients")



#--Display population estimates of admixture by overlaying pie-charts on a geographic map--#

#8. Read the geographic coordinates of samples and create sample identifiers
coord <- read.table("coordinates.coord")
pop <- c(rep(1,15),rep(2,4),rep(3,20),rep(4,15),rep(5,12),rep(6,9),rep(7,12),rep(8,19),rep(9,57),
         rep(10,14),rep(11,5),rep(12,68),rep(13,8),rep(14,16),rep(15,22),rep(16,23),rep(17,11),
         rep(18,11),rep(19,7),rep(20,26),rep(21,8),rep(22,14),rep(23,39),rep(24,48),rep(25,21),
         rep(26,6),rep(27,42),rep(28,25),rep(29,10),rep(30,24),rep(31,30),rep(32,15),rep(33,13),
         rep(34,7),rep(35,11),rep(36,12))


#9. Take the mean values for each population samples to obtaine the population estimates of 
#admixture coefficients
K <- 4
Npop <- length(unique(pop))
qpop <- matrix(NA, ncol = K, nrow = Npop)
coord.pop <- matrix(NA, ncol = 2, nrow = Npop)

for (i in unique(pop)){
  qpop[i,] <- apply(qmatrix[pop == i,], 2, mean)
  coord.pop[i,] <- apply(coord[pop == i,], 2, mean)
  }
#The qpop object contains the admixture coefficients for each population sample.


#10. Geographic map of population admixture proportions
plot(coord, xlab= "Longitude", ylab= "Latitude", type= "n", main= "Population admixture proportions")
map(add = T, col = "grey90", fill = TRUE)

for (i in 1:Npop){
  add.pie(z = qpop[i,], x = coord.pop[i,1], y = coord.pop[i,2], labels = "", radius = 0.5,
          col = c("orange","violet","lightgreen","steelblue4"))
  }


#11. Make a zoom of the populations of the United Kingdom
qpopUK <- qpop[9:36,]
coord.popUK <- coord.pop[9:36,]

plot(coord.popUK, xlab= "Longitude", ylab= "Latitude", type= "n", main= "Population admixture proportions")
map(add = T, col = "grey90", fill = TRUE)
for (i in 1:28){
  add.pie(z = qpopUK[i,], x = coord.popUK[i,1], y = coord.popUK[i,2], labels = "", radius = 0.08,
          col = c("orange","violet","lightgreen","steelblue4"))
  }


#--Compute spatial estimates of admixture coefficients, and represent the spatial predictions on
#a geographic map--#

#12. Download a raster grid of Europe
asc.raster <-"http://membres-timc.imag.fr/Olivier.Francois/RasterMaps/Europe.asc"
grid <- createGridFromAsciiRaster(asc.raster)
constraints <- getConstraintsFromAsciiRaster(asc.raster, cell_value_min=0)


#13. Perform the spatial interpolation of ancestry coefficients
maps(matrix= qmatrix, coord, grid, constraints, method= "max", main= "Ancestry coefficients",
     xlab= "Longitude", ylab= "Latitude", cex= 0.5)
map(add = T, interior = F)
#Using the max option, only the cluster with the maximal local contribution to ancestry is 
#represented at each geographic point of the map.

