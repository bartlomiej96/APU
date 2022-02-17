install.packages("randomForest")
install.packages("e1071")
install.packages("party")
install.packages("mlr")
install.packages("rFerns")

library(randomForest)
library(rpart.plot)
library(party)
library(mlr)
library(rFerns)


setwd("C:/Git/APU/Lab4_2")
lodowki_turystyczne=read.csv("ramka.csv")
lodowki_turystyczne$nazwa = factor(lodowki_turystyczne$nazwa)
lodowki_turystyczne$ocena = factor(lodowki_turystyczne$ocena)

summarizeColumns(lodowki_turystyczne)

rdesc = makeResampleDesc("CV", iters = 10)

task = makeClassifTask(id = deparse(substitute(lodowki_turystyczne)), lodowki_turystyczne, "ocena",
                       weights = NULL, blocking = NULL, coordinates = NULL,
                       positive = NA_character_, fixup.data = "warn", check.data = TRUE)
lrns <- makeLearners(c("rpart", "C50", "ctree", "naiveBayes", "randomForest"), type = "classif")


bmr <- benchmark(learners = lrns, tasks = task, rdesc, models = TRUE, measures = list(acc, ber))
p = getBMRPredictions(bmr)
plotBMRSummary(bmr)
