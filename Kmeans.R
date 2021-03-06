data <- LaLiga_Limpio
write.csv(data,'data.csv',row.names = FALSE)
data <- data[,-1]
data <-scale(data)


#Inicio de Cluster con cluster de prueba
mycluster <- kmeans(data, 3, nstart = 5, iter.max = 30)
View(mycluster)

mycluster$iter
mycluster$size
mycluster$centers
mycluster$withinss

wss <- (nrow(data-1)) * sum(apply(data, 2, var))
for(i in 1:10) wss[i] <- sum(kmeans(data, centers = i)$withinss)
wss
plot(1:10, wss, type='b', xlab='Numero clusters', ylab = 'withinss groups')

mycluster <- kmeans(data, 4, nstart= 5, iter.max = 30)
library(fmsb)

par(mfrow=c(2,2))

dat <- as.data.frame(t(mycluster$centers[1,]))
dat
dat <- rbind(rep(5, 10), rep(-1.5,10), dat)
dat
radarchart(dat)
dat <- as.data.frame(t(mycluster$centers[2,]))
dat
dat <- rbind(rep(5, 10), rep(-1.5,10), dat)
dat
radarchart(dat)
dat <- as.data.frame(t(mycluster$centers[3,]))
dat
dat <- rbind(rep(5, 10), rep(-1.5,10), dat)
dat
radarchart(dat)
dat <- as.data.frame(t(mycluster$centers[4,]))
dat
dat <- rbind(rep(5, 10), rep(-1.5,10), dat)
dat
radarchart(dat)
