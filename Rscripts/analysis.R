require(igraph)
require(NetIndices)
require(reshape2)
require(ggplot2)
require(devtools)
require(vegan)
require(data.table)

s.ocean <- read.csv("./data/diet.csv")

source("./Rscripts/functions.R")

# get edgelist
el.df <- data.frame(prey = s.ocean$PREY_NAME, pred = s.ocean$PREDATOR_NAME)
# get graph object
SOgraph <- graph.edgelist(unique(as.matrix(el.df[,1:2])))
# get adjacency matrix
SOadjacency <- get.adjacency(SOgraph, sparse = F)

# compute network properties
soprops <- webPROPS(SOgraph)


head(s.ocean)
