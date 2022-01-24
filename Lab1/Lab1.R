#Wariant 5
#a
a <- 14 * cos(pi)
b <- 2 * a
min(a, b)

#b
help(log10)

#c
c <- c(900:1150)
mean(c)

#d
??log

#e
setwd("C:/Git/APU/Lab1")
a <- "lodówka turystyczna"
a
save(a, file = "a.RData")
remove(a)
a
load("a.RData")
a

#f
install.packages("gridExtra")

help(package=("gridExtra"))
library("gridExtra")
setwd("C:/Git/APU/Lab1")
sleep = read.csv("sleep.csv", na.strings = "")
sleep = sleep[seq(1,10),]
grid.table(sleep)

#g
a <- seq(1500,1400,-5)
a

#h
a <- seq(25,5)
b <- seq(50,70)
c <- c(b,a)
c

#i
nazwa = c("RAVEN ELT002N 12/230V","RAVEN ELT001N 12/230V (szaro-zielony)", "Yeticool BX30", "Yeticool BX40", "Sencor SCM 3224BL", "Yeticool CX10", "Sencor SCM 4233BL", "Yeticool BNX52", "Sencor SCM 3125", "MPM MPM-35-CBM-09Y", "Yeticool TX95", "Yeticool BNX42", "Yeticool TX36", "Yeticool TX56", "Yeticool T66")
pojemnosc = c(24.7, 30, 27.9, 28, 25.7, 28.4, 29, 29.1, 29.1, 30, 29.5, 29.9, 29.5, 28.4, 27.6)
waga = c(4.20, 5.24, 5.5, 5.7, 5.7, 4.3, 4.6, 5.7, 4.1, 4.7, 4.1, 4.6, 5.6, 4.1, 6)
cena = c(226.83, 259.35, 269.2, 294.4, 299.5, 248.1, 278.5, 290, 280.9, 286.5, 230.5, 248.9, 289.8, 217.1, 294.1)
liczba_opinii = c(29, 53, 49, 42, 33, 58, 43, 21, 40, 21, 26, 27, 46, 58, 55)
ramka = data.frame(nazwa, pojemnosc, waga, cena, liczba_opinii)
srednia = mean(ramka[, "cena"],2)
srednia

#j
lodowka = data.frame(nazwa="RAVEN ELT123", pojemnosc=29, waga=5.5, cena=289.99, liczba_opinii=11)
ramka = rbind(ramka, lodowka)
ramka
srednia = mean(ramka[, "cena"],2)
srednia

#k
ocena = c("2", "4.5", "2.5", "5", "4.5", "3.5", "3", "1", "4", "2", "4.5", "3", "3.5", "4", "2.5", "3.5")
ramka = cbind(ramka, ocena)
ocena_avg_cena = with(ramka, tapply(cena, ocena, mean))
ocena_avg_cena

#l
lodowka1 = data.frame(nazwa="Yeticool BX50", pojemnosc=28, waga=5.5, cena=289.99, liczba_opinii=12, ocena="4")
lodowka2 = data.frame(nazwa="Yeticool TX95", pojemnosc=25, waga=5.1, cena=319.99, liczba_opinii=32, ocena="2")
lodowka3 = data.frame(nazwa="Severin KB 2923", pojemnosc=22, waga=4.7, cena=239.99, liczba_opinii=14, ocena="1.5")
lodowka4 = data.frame(nazwa="Severin LB 3923", pojemnosc=34, waga=6, cena=344.99, liczba_opinii=6, ocena="3.5")
ramka = rbind(ramka, lodowka1)
ramka = rbind(ramka, lodowka2)
ramka = rbind(ramka, lodowka3)
ramka = rbind(ramka, lodowka4)
install.packages("plotrix")
library(plotrix)
ilosc = table(ramka$ocena)
barplot(ilosc, main = "Ilosc lodówek turystycznych", ylim = c(0,10), xlab = "Ocena", ylab = "Ilosc")

#m
udzial = table(ramka$ocena) / length(ramka$ocena)
pie(udzial)

#n
ramka$status_opinii = ""
ramka$status_opinii <- cut(ramka$liczba_opinii, c(-Inf,0,50,100,Inf), c("nie ma","mniej niz 50 opinii", "50-100 opinii", "wiecej 100 opinii"))
udzial_procent = table(ramka$status_opinii) / length(ramka$status_opinii)
pie(udzial_procent)
ramka

#o
for (row in 1:nrow(ramka)) {
  nazwa <- ramka[row, "nazwa"]
  ocena  <- ramka[row, "ocena"]
  liczba_opinii  <- ramka[row, "liczba_opinii"]
  print(paste(nazwa,"ma ocene klientów", ocena, "bo ma liczbe opinii", liczba_opinii))
}

#p
setwd("C:/Git/APU/Lab1")
write.csv(ramka, 'ramka.csv')
ramka1 = read.csv('ramka.csv')
ramka1
