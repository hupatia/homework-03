#############################
#Házi feladat 3             #
#Programozás I.             #
#2016/17. II. félév         #
#Kelemen Kinga              #
#2017-03-22                 #
#############################

#II. feladat
#1. feladat
#Eloszor létrehozom a megfelelo hosszuságu vektorokat.
set.seed(22)
hossz_A <- vector(length=sample(10:20, 1))
hossz_B <- vector(length=sample(10:20, 1))
hossz_C <- vector(length=sample(10:20, 1))
hossz_D <- vector(length=sample(10:20, 1))
hossz_E <- vector(length=sample(10:20, 1))

#A megfelelo hosszuságu vektorokat feltoltom számokkal az egyenletes eloszlásból.
A <- runif(length(hossz_A),1,2)
B <- runif(length(hossz_B),1,2)
C <- runif(length(hossz_C),1,2)
D <- runif(length(hossz_D),1,2)
E <- runif(length(hossz_E),1,2)

#Elkészítem a listát.
My_list <- list(A, B, C, D, E)

#2. feladat
My_list2 <- vector()
for (i in 1:length(My_list)) {
  My_list2[i] <- length(My_list[[i]])
}
My_list2

#3. feladat
lapply(My_list, function(x) length(x))

#4. feladat
sapply(My_list, function(x) length(x))

#III. feladat
#1. feladat
data(chickwts)
head(chickwts)

#2. feladat
data_chicken <- aggregate(chickwts$weight, by = list(feed = chickwts$feed), mean)

#3. feladat
target <- sort(data_chicken$x)
data_chicken[match(target, data_chicken$x),]

#IV. feladat
#1. feladat
#Első variáció, amikor simán az rnorm függyvényt használom és ott próbálom beállítani a szórást
#De az ellenőrzésnél nem pontosan azok a szórások jönnek ki, nagy mintánál persze konvergálna a megadott szóráshoz
M <- matrix(0, 50, 10)
for (i in 1:50)
{
  M[i, ] <- rnorm(10, sd=i)
}
M
#Második variáció, amikor rákényszerítem még jobban, hogy pontosan az a szórás legyen
# Ehhez írtam egy függvényt a homework-03-funcions.R fájlban fixrnorm néven
source("src/homework-03-functions.R")
M <- matrix(0, 50, 10)
for (i in 1:50)
{
  M[i, ] <- fixrnorm(10, s=i)
}
M
#2. feladat
M_sd <- NA
for (i in 1:nrow(M)) {
  M_sd[i] <- sd(M[i, ])
}
M_sd

#3. feladat
apply(M,1,sd)

#4. feladat
#Eloszor 0 és 1 közé normalizálom.
range = max(M) - min(M)
M = (M - min(M)) / range
M

#Majd -1 és 1 közé.
range2 = 1 - (-1)
M = (M * range2) + (-1)
M
#Sorok átlaga.
apply(M,1,mean)

#V. feladat
#1.feladat
install.packages("fivethirtyeight")
library(fivethirtyeight)
data(comic_characters)

#2. feladat
uj_name <- strsplit(comic_characters$name, " (", fixed=TRUE)
comic_characters$name <- lapply(uj_name, function(x) x[1])

head(comic_characters$name)

#3. feladat
# megoldás a homework-03-functions.R-ben

source("src/homework-03-functions.R")

#4. feladat
get_gender("Thor")
get_gender("Katherine Pryde")
get_gender("Loki Laufeyson")