# this program imports a csv file (copied from a pdf) about occupation classifications, and transforms it to a merge-able csv file
# occ_2010.csv is manually copied from page 31 - 41 of IndOccDD2014.pdf


install.packages("tidyverse")
library(tidyverse)
library(stringr)

occ2010 <- read.csv("D:\\Users\\CWang\\Documents\\data\\r_bites\\occupation_code\\raw_occ_2010.csv", header =  FALSE)

occ <- as.vector(occ2010$V1)

occ <- occ[!grepl("IndOcc", occ)]

veryshort <- occ[1:54]

num1 <- as.numeric(veryshort[seq(1, length(veryshort), 3)])
name1 <- veryshort[seq(2, length(veryshort), 3)]

short <- occ[55:167]
long <- occ[168:length(occ)]

newshort <- subset(short, str_length(short) > 2)
newlong <- subset(long, str_length(long) > 3)

newvar <- c(newshort, newlong)

name2 <- newvar[seq(2, length(newvar), 2)]
num2 <- as.numeric(newvar[seq(1, length(newvar), 2)])

number2010 <- c(num1, num2)
name2010 <- c(name1, name2)

occlibrary <- data.frame(number2010, name2010)

write.csv(occlibrary, "D:\\Users\\CWang\\Documents\\data\\r_bites\\occupation_code\\occlibrary2010.csv", row.names = FALSE)



