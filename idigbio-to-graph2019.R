# Katja Seltmann, 2019
# M259 Visualizing Information

#download data from iDigBio using r API
#https://www.idigbio.org/portal
#create simple graph with the data

#install packages if you dont have them
install.packages("devtools")
install.packages("ridigbio")
install.packages("tidyr")

#load packages
library(devtools)
library(ridigbio)
library(ggplot2)
library("dplyr")
library("tidyr")

#set working directory
setwd("~/Documents/r-api-examples")

#get a 5000 records of specimens in the genus bombus (bumblebees) and create a data frame
bombus <- idig_search_records(rq=list(genus="bombus"), limit=5000)

#group by country and count the country
bombus %>%
  group_by(country)

bombus <- add_count(bombus, country)


#look at the first few rows of dataframe bombus
head(bombus)
View(bombus)

#graph the data using ggplot
theme_set(theme_classic())
g <- ggplot(bombus, aes(country))
g + geom_density(aes(fill=factor(log10(n))), alpha=0.8) + 
  labs(title="bumble bee diversity in different countries", 
       subtitle="",
       caption="",
       x="kinds of bumble bees",
       fill="") +
  theme(axis.text.x=element_blank(),
        axis.ticks.x=element_blank()) +
  theme(legend.position="none")


x##helpful information below about the api
## information below about the idigbio api and ridigbio
#https://github.com/iDigBio/ridigbio

#returns all searchable fields
idig_meta_fields()
idig_view_records()

#find all functions in idigbio package
lsp <- function(package, all.names = FALSE, pattern) 
{
  package <- deparse(substitute(package))
  ls(
    pos = paste("package", package, sep = ":"), 
    all.names = all.names, 
    pattern = pattern
  )
}

lsp(ridigbio)



