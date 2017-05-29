#### Discriminant analysis of principal components (DAPC) ####

#1. Load libraries
library(adegenet)

#2. Load the data set
Eptpop <- read.genalex("GenotiposEptser.csv", sep= ";")
Eptpop


dapc.Eptpop <- dapc(Eptpop, var.contrib = TRUE, scale = FALSE, n.pca = 40, n.da = nPop(Eptpop) - 1)
scatter(dapc.Eptpop, cell = 0, pch = 18:23, cstar = 0, mstree = TRUE, lwd = 2, lty = 2)

set.seed(4)
contrib <- loadingplot(dapc.Eptpop$var.contr, axis = 1, thres = 0.07, lab.jitter = 1)


data("H3N2")
pop(H3N2) <- H3N2$other$epid
dapc.H3N2 <- dapc(H3N2, var.contrib = TRUE, scale = FALSE, n.pca = NULL, n.da = nPop(H3N2) - 1)
scatter(dapc.H3N2, cell = 0, pch = 18:23, cstar = 0, mstree = TRUE, lwd = 2, lty = 2)
set.seed(4)
contrib <- loadingplot(dapc.H3N2$var.contr, axis = 2, thres = 0.07, lab.jitter = 1)

########################

table(strata(Eptpop, ~Pop))

Eptamova <- poppr.amova(Eptpop, ~Pop, correction = "quasieuclid")
Eptamova


Eptsignif   <- randtest(Eptamova, nrepet = 999)



##########################

library(poppr)
Eptpop <- read.genalex("GenotiposEptser.csv", sep= ";")
Eptpop

set.seed(999)
Eptx <- xvalDapc(tab(Eptpop, NA.method = "mean"), pop(Eptpop))

set.seed(999)
system.time(Eptx <- xvalDapc(tab(Eptpop, NA.method = "mean"), pop(Eptpop), 
                              n.pca = 35:45, n.rep = 1000, 
                              parallel = "snow", ncpus = 4L))
names(Eptx)
Eptx[-1]

scatter(Eptx$DAPC, cex = 1, legend = T, clabel = FALSE, posi.leg = "bottomleft", scree.pca = TRUE, 
        posi.pca = "topright", cleg = 0.4, xax = 1, yax = 2, inset.solid = 1)



---------------
  #Gst
  Gst_Hedrick(Eptpop)

#Distancia genética
library(ape)
set.seed(10)
ten_samples <- sample(nInd(Eptpop), 10)
mic10       <- Eptpop[ten_samples]
(micdist    <- provesti.dist(mic10))

theTree <- micdist %>% 
  nj() %>%    # calculate neighbor-joining tree
  ladderize() # organize branches by clade
plot(theTree)
add.scale.bar(length = 0.05)

set.seed(999)
aboot(mic10, dist = provesti.dist, sample = 200, tree = "nj", cutoff = 50, quiet = TRUE)
