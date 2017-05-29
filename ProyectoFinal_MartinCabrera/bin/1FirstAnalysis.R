#### First Analysis ####

#--The genotype accumulation curve--#

#1. Load libraries
library(magrittr)
library(adegenet)
library(ade4)
library(poppr)
library(mmod)
library(treemap)

#2. Load the data set
Eptpop <- read.genalex("../data/genotepts.csv", sep= ";")
Eptpop

#3. Plot the genotype accumulation curve
gacc<- genotype_curve(Eptpop, sample= 1000, quiet= T)
#We can see that the data reached the plateau with 10 loci


#--Allele frequencies and missing data--#

#Look for missing data, rare alleles and overall quality of data
#4. Produce a summary table with number, diversity and heterozygosity of the alleles per locus
(sumtab<- locus_table(Eptpop))

#5. Assess the percentage of missing data
info_table(Eptpop, type = "missing", plot = TRUE)


#--Genotypic diversity--#

#6. Produce a basic summary table for population genetic analyses
summgen <- poppr(Eptpop)
summgen

#7. Calculate MLG (number of multilocus genotypes) for each population
P.tab <- mlg.table(Eptpop)

#8. Save results
write.table(sumtab, sep = " ", file= "../out/results1/summLocusTable.txt")
write.table(summgen, sep = " ", file= "../out/results1/summGeneticAnalyses.txt")
