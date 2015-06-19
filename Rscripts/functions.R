webPROPS <- function(graph){
  adj <- get.adjacency(graph, sparse = F)
  gind <- GenInd(adj)
  diam <- diameter(graph)
  avpath <- average.path.length(graph)
  cluster <- transitivity(graph)
  cannibals <- sum(diag(adj))
  
  degrees <- degree(graph, mode = "all")
  indegrees <- degree(graph, mode = "in")
  outdegrees <- degree(graph, mode = "out")
  
  numBas <- length(indegrees[which(indegrees == 0)])
  numTop <- length(outdegrees[which(outdegrees == 0)])
  basal <- (numBas/gind$N) * 100
  top <- (numTop/gind$N) * 100
  int <- ((gind$N - (numBas + numTop))/gind$N) * 100
  
  web.props <- data.frame(N = gind$N, L = gind$Ltot, LD = gind$LD, C = gind$C, D = diam,
                          AvgPath = avpath, ClCoef = cluster, Can = cannibals, Bas = basal, Top = top, Int = int)
  return(web.props)
}