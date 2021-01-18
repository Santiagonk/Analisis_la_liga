library(plumber)
r <- plumb("C:/Users/Santiago/Desktop/Cursos/DataScience Path Platzi/Proyectos/Analisis_Liga_Española/App.R")
r$run(port=8000)

#https://localhost:8000/getCluster?Partidosjugados=0.4094473&Partidosganados=0.5071315&Partidosempatados=-1.1208408&Goles=-0.3093098&Asistencias=-0.7524862&Tarjetas=1.2541322&Penalties=-0.2748003&Puntos=0.2497947
