#### Locus stats, heterozygosity, HWE ####

#--Locus summary statistics--#

#1. Load libraries
library(ade4)
library(adegenet)
library(poppr)
library(magrittr)
library(ape)
library(pegas)
library(lattice)

#2. Load the data set
Eptpop <- read.genalex("../data/genotepts.csv", sep= ";")
Eptpop

#3. Determine the number, diversity, expected heterozygosity, and evenness of the alleles at each locus
locus_table(Eptpop)

#4. See if the different alleles exist in all populations of this data set
for (i in c("CH","FR","GG","IT","PL1","PL2","PL3","SL","UK01","UK02","UK03","UK04","UK05","UK06",
            "UK07","UK08","UK09","UK10","UK11","UK12","UK13","UK14","UK15","UK16","UK17","UK18",
            "UK19","UK20","UK21","UK22","UK23","UK24","UK25","UK26","UK27","UK28")){
print(paste("Summary Results for", i))
loci_in_pop <- locus_table(Eptpop, pop= i)
print(loci_in_pop)
}
#It is observed that in 10 of the 36 populations an allele is fixed. 
#Fixed alleles (EF1, B22, Mu4389) agree to be those with lower parameter values. However, it was 
#decided not to remove the fixed locus from the subsequent analyzes because there were few populations
#that presented them (5, 2, 3, respectively).

#5. Know how many loci we have
nLoc(Eptpop)


#--Hardy-Weinberg equilibrium--#

#6. Determine if our populations are in Hardy-Weinberg equilibrium. Establish 1000 permutations
(Epthwe.full <- hw.test(Eptpop, B = 1000))

#7. Now calculate HWE statistic for each population
(Ept.pop <- seppop(Eptpop) %>% lapply(hw.test, B = 0))

#Visualization of population-wise p-values
#8. Create a matrix that contains populations in columns and loci in rows, and take the third column
#with all rows of the matrices per sample generated in the previous step
(Epthwe.mat <- sapply(Ept.pop, "[", i = TRUE, j = 3))

#9. Define an alpha value and set everything above that value to 1, to visually detect candidate loci 
#where we might reject the Ho of HWE
alpha  <- 0.05
newmat <- Epthwe.mat
newmat[newmat > alpha] <- 1

#10. Create a simple heatmap 
levelplot(t(newmat), xlab= "Populations", ylab= "Locus")
#All loci shown in pink are loci suspected of not being in HWE with p=<0.05.

#11. Save results
write.table(Epthwe.full, sep = " ", file= "../out/results2/HWEfull.txt")
write.table(Ept.pop, sep = " ", file= "../out/results2/HWEforPop.txt")

