library(plumber)
r <- plumb("C:/Users/Santiago/Desktop/Cursos/DataScience Path Platzi/22. Curso Profesional de Ciencia de Datos/AspiradoresPb.R")
r$run(port=8000)

#https://localhost:8000/getCluster?