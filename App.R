
#* @param Partidosjugados
#* @param PartidosEmpatados
#* @param Peso
#* @param Volumen
#* @param Potencia
#* @param alto
#* @param ancho
#* @param profundidad
#* @get /getCluster

function(precio, opiniones, peso, volumen, potencia, alto, ancho, profundidad){
  campos <- as.vector(data[1,])
  mdist <- matrix(0, ncol = 8, nrow=8)
  for(i in 1:8){
    c <- dist(x=c(campos[i], mycluster$centers[,i]))
    b <- as.matrix(c)
    distancia <- b[-1, 1]
    mdist[i, ] <- distancia
  }
  mdist
  
  rownames(mdist) <- c('Precio', 'Opiniones', 'Peso', 'Volumen','Potencia', 'alto', 'ancho', 'profundidad')
  mdist
  
  dist_total <- apply(mdist, 2, sum)
  num_cluster <- which.min(dist_total)
  num_cluster
}
