#Probability Distributions#

##To show Binomial Distribution approaches Poisson as n takes large values
library(fpp2)
library(dplyr)
library(ggplot2)
library(gridExtra)

#Draw three Random Samples of Size 200 with p=0.025 from Binomial Distribution
set.seed(5)
random_sample_binom_1=rbinom(200,200,0.025)
random_sample_binom_1
random_sample_binom_2=rbinom(500,200,0.025)
random_sample_binom_2
random_sample_binom_3=rbinom(1000,200,0.025)
random_sample_binom_3
random_sample_poi=rpois(1000,5)
random_sample_poi

#Prepare Frequency Distribution Tables
frq_dist_table_binom_1=table(random_sample_binom_1)
frq_dist_table_binom_1
frq_dist_table_binom_2=table(random_sample_binom_2)
frq_dist_table_binom_2
frq_dist_table_binom_3=table(random_sample_binom_3)
frq_dist_table_binom_3
frq_dist_table_poi=table(random_sample_poi)
frq_dist_table_poi

#Draw Histograms for each Random Sample in different colour.
par(mfrow=c(2,2))
hist(random_sample_binom_1,col=10, main = 'Histogram for Random Sample 200', xlab = 'Class Intervals')
hist(random_sample_binom_2,col=20, main = 'Histogram for Random Sample 500', xlab = 'Class Intervals')
hist(random_sample_binom_3,col=30, main = 'Histogram for Random Sample 1000', xlab = 'Class Intervals')
hist(random_sample_poi,col=40, main='Histogram for Poisson Distribution',xlab = 'Class Intervals')

##To observe Sampling Distribution of Sample Mean from Normal Distribution
set.seed(46)
norm = replicate(1000, rnorm(100,6,3), simplify=FALSE)
sample_mean = sapply(norm,mean)
sample_mean
m<-mean(sample_mean)
m
std<-sqrt(var(sample_mean))
std
hist(sample_mean, xlab="x-variable", ylim=c(0, 2),main="Histogram of Standardised Sample Means",col=4)
hist(sample_mean, xlab="x-variable", ylim=c(0, 2),main="Normal Curve over Histogram",col=4)
curve(dnorm(x, mean=m, sd=std),col="darkblue", lwd=2, add=TRUE, yaxt="n")