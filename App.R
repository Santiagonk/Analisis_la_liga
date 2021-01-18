
#* @param Partidosjugados
#* @param Partidosganados
#* @param Partidosempatados
#* @param Goles
#* @param Asistencias
#* @param Tarjetas
#* @param Penalties
#* @param Puntos
#* @get /getCluster

function(Partidosjugados, Partidosganados, Partidosempatados, Goles, Asistencias, Tarjetas, Penalties, Puntos){
  campos <- as.vector(data[1,])
  mdist <- matrix(0, ncol = 8, nrow=8)
  for(i in 1:8){
    c <- dist(x=c(campos[i], mycluster$centers[,i]))
    b <- as.matrix(c)
    distancia <- b[-1, 1]
    mdist[i, ] <- distancia
  }
  mdist
  
  rownames(mdist) <- c('Partidos Jugados', 'Partidos Ganados','Partidos Empatados','Goles', 'Asistencias', 'Tarjetas', 'Penalties', 'puntos')
  mdist
  
  dist_total <- apply(mdist, 2, sum)
  num_cluster <- which.min(dist_total)
  num_cluster
}
