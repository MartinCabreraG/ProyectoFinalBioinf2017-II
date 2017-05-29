#### Discriminant analysis of principal components (DAPC) ####

#1. Load libraries
library(ade4)
library(adegenet)
library(poppr)

#2. Load the data set
Eptpop <- read.genalex("../data/genotepts.csv", sep= ";")
Eptpop

#3. Run DAPC analysis
dapc.Eptpop <- dapc(Eptpop, var.contrib = TRUE, scale = FALSE, n.pca = 40, n.da = nPop(Eptpop) - 1)
dapc.Eptpop

#4. Plot de results of DAPC
scatter(dapc.Eptpop, cell = 0, pch = 18:23, cstar = 0, mstree = TRUE, lwd = 2, lty = 2)


#### AMOVA ####

# 1. Explore stratification of data set
table(strata(Eptpop, ~Pop))

# 2. Run the AMOVA analysis
Eptamova <- poppr.amova(Eptpop, ~Pop, correction = "quasieuclid")
Eptamova

#3. Save results
write.table(Eptamova$componentsofcovariance, sep = " ", file= "../out/results4/amovacov.txt")


#### Gst ####

#1. Load library
library(mmod)

#2. Use Hendrick's standardized Gst to assess population structure among populations
Gst<- Gst_Hedrick(Eptpop)
Gst

#3. Save results
write.table(Gst, sep = " ", file= "../out/results4/gst.txt")


#### Genetic Distance ####

#1. Load libraries
library(ape)
library(magrittr)

#2.Take ten random samples and calculate Provesti's distance, which will return the fraction of the 
#number of differences between samples
set.seed(10)
ten_samples <- sample(nInd(Eptpop), 10)
mic10       <- Eptpop[ten_samples]
(micdist    <- provesti.dist(mic10))
#This represents the pairwise distances between these 10 samples

#3. Use the previous distance matrix to create a neighbor-joining tree
theTree <- micdist %>% 
  nj() %>%    # calculate neighbor-joining tree
  ladderize() # organize branches by clade
plot(theTree)
add.scale.bar(length = 0.05) # add a scale bar showing 5% difference
#Must be identified the population cluster correspondingly to each sample

#4. A tree is a hypothesis and one way of generating support is to bootstrap loci
set.seed(999)
aboot(mic10, dist = provesti.dist, sample = 200, tree = "nj", cutoff = 50, quiet = TRUE)

