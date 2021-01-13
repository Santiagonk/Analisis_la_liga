View(LaLiga)
str(LaLiga)

#Partidos Jugados
LaLiga$`Partidos Jugados` <- as.numeric(LaLiga$`Partidos Jugados`)

#Partidos Ganados
LaLiga$`Partidos Ganados`<- as.numeric(LaLiga$`Partidos Ganados`)

#Partidos Empatados
LaLiga$`Partidos Empatados` <- as.numeric(LaLiga$`Partidos Empatados`)

#Goles 
LaLiga$Goles <- as.numeric(LaLiga$Goles)

#Asistencias
LaLiga$Asistencias <- as.numeric(LaLiga$Asistencias)

#Tarjeta
LaLiga$Tarjetas <- as.numeric(LaLiga$Tarjetas)

#Penalties
LaLiga$Penalties <- as.numeric(LaLiga$Penalties)

str(LaLiga)

puntos <- LaLiga$`Partidos Ganados`*3 + LaLiga$`Partidos Empatados`
puntos <- as.data.frame(puntos)

LaLiga_Limpio <- cbind(LaLiga, puntos)
View(LaLiga_Limpio)