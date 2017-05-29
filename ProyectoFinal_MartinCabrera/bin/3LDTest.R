#### Linkage disequilibrium ####

#--The Index of Association (IA)--#

#1. Load libraries
library(magrittr)
library(adegenet)
library(ade4)
library(poppr)

#2. Load the data set
Eptpop <- read.genalex("../data/genotepts.csv", sep= ";")
Eptpop


#3. Create table with final results of the test
LDTresults<-c("roost","Ia", "p.Ia", "rbarD","p.rD")

#4. Run Linkage Disequilibrium Test for each population
for (i in c("CH","FR","GG","IT","PL1","PL2","PL3","SL","UK01","UK02","UK03","UK04","UK05","UK06",
            "UK07","UK08","UK09","UK10","UK11","UK12","UK13","UK14","UK15","UK16","UK17","UK18",
            "UK19","UK20","UK21","UK22","UK23","UK24","UK25","UK26","UK27","UK28")){
  
  # For reproducibility
  set.seed(10)
  
  print(paste("DL results for", i))
  
  # Linkage Disequilibrium Test
  Sub_pop <- popsub(Eptpop, i)
  ia_pop <- ia(Sub_pop, sample = 999)

  # Get info for a table  
  Ia<-round(ia_pop[1], 4)
  p.Ia<-round(ia_pop[2], 4)
  rbarD<-round(ia_pop[3], 4)
  p.rD<-round(ia_pop[4], 4)
  
  # Put results in a table
  roost <-paste(i)
  LDTresults<-rbind(LDTresults, c(roost, Ia, p.Ia, rbarD, p.rD))
}


#--Pairwise rbarraD over all loci--#

#Calculate IA and rbarD over all pairs of loci for each population
#5. Create table with final results of ranges
range_pair<- c(1:45)

#6. Run comparisons between loci for each population
for (i in c("CH","FR","GG","IT","PL1","PL2","PL3","SL","UK01","UK02","UK03","UK04","UK05","UK06",
            "UK07","UK08","UK09","UK10","UK11","UK12","UK13","UK14","UK15","UK16","UK17","UK18",
            "UK19","UK20","UK21","UK22","UK23","UK24","UK25","UK26","UK27","UK28")){
  
  print(paste("Pairwise rbarD over all loci results for", i))
  
  # Pairwise rbarD over all loci
  Sub_pop <- popsub(Eptpop, i)
  Sub_pop_pair <- pair.ia(Sub_pop)
  
  # Get info for a table 
  pairIa<-round(Sub_pop_pair[,1],3)
  pairbarD<-round(Sub_pop_pair[,2],3)
  
  # Put results in a table
  range_pair<- cbind(range_pair, pairIa)
  range_pair<- cbind(range_pair, pairbarD)
}

#7. Clean the obtained ranges set for calculate a total range
rangepair2<- range_pair[,2:73]
rangepair2[rangepair2 == Inf] <- NaN
rangepair2[rangepair2 == -Inf] <- NaN

#8.Calculate a total range
plotrange <- range(rangepair2, na.rm = TRUE)
plotrange

#9.Plot the output of pair.ia
for (i in c("CH","FR","GG","IT","PL1","PL2","PL3","SL","UK01","UK02","UK03","UK04","UK05","UK06",
            "UK07","UK08","UK09","UK10","UK11","UK12","UK13","UK14","UK15","UK16","UK17","UK18",
            "UK19","UK20","UK21","UK22","UK23","UK24","UK25","UK26","UK27","UK28")){
  
  print(paste("Plot the outputof pair.ia for", i))
  
  Sub_pop <- popsub(Eptpop, i)
  Sub_pop_pair <- pair.ia(Sub_pop)
  plot(Sub_pop_pair, limits= plotrange)
}

#10. Save results
write.table(LDTresults, sep = " ", file= "../out/results3/LDTResults.txt")

