# Katja Seltmann, 2019
# M259 Visualizing Information

#download data from globi using r API
#https://www.globalbioticinteractions.org
#place data in SQLite database
#create simple network with the data

#install packages if you dont have them
install.packages("rglobi")


#load packages
library(rglobi)
library(ggplot2)
library("dplyr")
library("tidyr")
require(igraph)


#look at the different interaction types
get_interaction_types()

#get interactions of bumble bees
bumblebeesInteractions <- get_interactions_by_taxa(sourcetaxon = "bombus")

#how many rows in this dataset
nrow(bumblebeesInteractions)

#create a new dataframe for a network graph (vertex, edges)
bsk <- data.frame(bumblebeesInteractions$source_taxon_name,bumblebeesInteractions$target_taxon_name)

#look at data
head(bsk)

#describe network
bsk.network<-graph.data.frame(bsk, directed=F)

#list the vertices
V(bsk.network)

#list the edges
E(bsk.network)

#plot the graph
plot(bsk.network,vertex.size=5, vertex.label=NA)

#help igraph
help(igraph)



