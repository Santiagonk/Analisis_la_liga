library(xml2)
library(rvest)
library(selectr)
library(stringr)
library(jsonlite)
library(dplyr)
url <- 'https://www.laliga.com/laliga-santander/clubes'
webpage <- read_html(url)
class(webpage)
selector <- 'a >h2'
nodo <- html_nodes(webpage, selector)
class(nodo)
texto <- html_text(nodo)
texto <- str_to_lower(texto)
texto <- gsub(' ','-',texto)
texto <- gsub('á','a',texto)
texto <- gsub('é','e',texto)
texto
#selector <- 'a'
#nodo <- html_nodes(webpage, selector)
#nodo_link <- html_attr(nodo, 'href')
#nodo_link
pag <- 'https://www.laliga.com/clubes/fc-barcelona'
pag <- str_replace(pag, '/fc-barcelona', paste0('/',texto))
pag[3] <- "https://www.laliga.com/clubes/c-a-osasuna"
pag[5] <- "https://www.laliga.com/clubes/d-alaves"  
pag[6] <- "https://www.laliga.com/clubes/elche-c-f"
pag[15] <- "https://www.laliga.com/clubes/r-valladolid-cf"
pag <- paste0(pag,'/estadisticas')
pag

url <- 'https://www.laliga.com/clubes/athletic-club/estadisticas'

get_Equipo <- function(url){
  pagina_web <- read_html(url)
  
  nombre_equipo <- str_replace(url, 'https://www.laliga.com/clubes/', '')
  nombre_equipo <- gsub('/estadisticas','',nombre_equipo)
  nombre_equipo <- gsub('-',' ',nombre_equipo)
  
  
  
  sel_partidos_jugados <- '#__next > div.styled__ClubContainer-sc-9wem1u-0.kyDoqW > div.styled__ClubSectionContent-sc-9wem1u-8.kKwSoN > div:nth-child(1) > div > div > div:nth-child(1) > div > div > div.styled__ShowLoadedContainer-sc-191gwr0-0.jtmrdv.show > div.react-tabs__tab-panel.react-tabs__tab-panel--selected > div > div:nth-child(1) > div.styled__FastStatsCol-sc-1rbio1c-4.iKkjK > div.styled__FastStatsColItem-sc-1rbio1c-6.dQgKjw > div > p.styled__TextRegularStyled-sc-12cic8i-0.lkSSUa.styled__TextRegularBlock-sc-1rbio1c-7.gZjTkz'
  partidos_jugados <- html_node(pagina_web, sel_partidos_jugados)
  partidos_jugados <- html_text(partidos_jugados)
  
  sel_partidos_ganados <- '#__next > div.styled__ClubContainer-sc-9wem1u-0.kyDoqW > div.styled__ClubSectionContent-sc-9wem1u-8.kKwSoN > div:nth-child(1) > div > div > div:nth-child(1) > div > div > div.styled__ShowLoadedContainer-sc-191gwr0-0.jtmrdv.show > div.react-tabs__tab-panel.react-tabs__tab-panel--selected > div > div:nth-child(2) > div.styled__FastStatsCol-sc-1rbio1c-4.fUuTxF > div:nth-child(2) > div > p.styled__TextRegularStyled-sc-12cic8i-0.gPHzQc.styled__TextRegularBlock-sc-1rbio1c-7.gZjTkz'
  partidos_ganados <- html_node(pagina_web, sel_partidos_ganados)
  partidos_ganados <- html_text(partidos_ganados)
  
  sel_partidos_empatados <- '#__next > div.styled__ClubContainer-sc-9wem1u-0.kyDoqW > div.styled__ClubSectionContent-sc-9wem1u-8.kKwSoN > div:nth-child(1) > div > div > div:nth-child(1) > div > div > div.styled__ShowLoadedContainer-sc-191gwr0-0.jtmrdv.show > div.react-tabs__tab-panel.react-tabs__tab-panel--selected > div > div:nth-child(2) > div.styled__FastStatsCol-sc-1rbio1c-4.ptmWy > div:nth-child(2) > div > p.styled__TextRegularStyled-sc-12cic8i-0.gPHzQc.styled__TextRegularBlock-sc-1rbio1c-7.gZjTkz'
  partidos_empatados <- html_node(pagina_web, sel_partidos_empatados)
  partidos_empatados <- html_text(partidos_empatados)
  
  sel_goles <- '#__next > div.styled__ClubContainer-sc-9wem1u-0.kyDoqW > div.styled__ClubSectionContent-sc-9wem1u-8.kKwSoN > div:nth-child(1) > div > div > div:nth-child(1) > div > div > div.styled__ShowLoadedContainer-sc-191gwr0-0.jtmrdv.show > div.react-tabs__tab-panel.react-tabs__tab-panel--selected > div > div.styled__FastStatsRow-sc-1rbio1c-3.jxCKwS > div:nth-child(1) > div.styled__FastStatsColItem-sc-1rbio1c-6.hMUkjz > div > p.styled__TextRegularStyled-sc-12cic8i-0.mzknG.styled__TextRegularBlock-sc-1rbio1c-7.gZjTkz'
  goles <- html_node(pagina_web, sel_goles)
  goles <- html_text(goles)
  
  sel_asistencias <- '#__next > div.styled__ClubContainer-sc-9wem1u-0.kyDoqW > div.styled__ClubSectionContent-sc-9wem1u-8.kKwSoN > div:nth-child(1) > div > div > div:nth-child(1) > div > div > div.styled__ShowLoadedContainer-sc-191gwr0-0.jtmrdv.show > div.react-tabs__tab-panel.react-tabs__tab-panel--selected > div > div.styled__FastStatsRow-sc-1rbio1c-3.jxCKwS > div:nth-child(2) > div.styled__FastStatsColItem-sc-1rbio1c-6.hMUkjz > div > p.styled__TextRegularStyled-sc-12cic8i-0.mzknG.styled__TextRegularBlock-sc-1rbio1c-7.gZjTkz'
  asistencias <- html_node(pagina_web, sel_asistencias)
  asistencias <- html_text(asistencias)
  
  sel_tarjetas <- '#__next > div.styled__ClubContainer-sc-9wem1u-0.kyDoqW > div.styled__ClubSectionContent-sc-9wem1u-8.kKwSoN > div:nth-child(1) > div > div > div:nth-child(1) > div > div > div.styled__ShowLoadedContainer-sc-191gwr0-0.jtmrdv.show > div.react-tabs__tab-panel.react-tabs__tab-panel--selected > div > div.styled__FastStatsRow-sc-1rbio1c-3.jxCKwS > div:nth-child(3) > div.styled__FastStatsColItem-sc-1rbio1c-6.hMUkjz > div > p.styled__TextRegularStyled-sc-12cic8i-0.mzknG.styled__TextRegularBlock-sc-1rbio1c-7.gZjTkz'
  tarjetas <- html_node(pagina_web, sel_tarjetas)
  tarjetas <- html_text(tarjetas)
  
  sel_penalties <- '#__next > div.styled__ClubContainer-sc-9wem1u-0.kyDoqW > div.styled__ClubSectionContent-sc-9wem1u-8.kKwSoN > div:nth-child(1) > div > div > div:nth-child(1) > div > div > div.styled__ShowLoadedContainer-sc-191gwr0-0.jtmrdv.show > div.react-tabs__tab-panel.react-tabs__tab-panel--selected > div > div.styled__FastStatsRow-sc-1rbio1c-3.jxCKwS > div:nth-child(4) > div.styled__FastStatsColItem-sc-1rbio1c-6.hMUkjz > div > p.styled__TextRegularStyled-sc-12cic8i-0.mzknG.styled__TextRegularBlock-sc-1rbio1c-7.gZjTkz'
  penalties <- html_node(pagina_web, sel_penalties)
  penalties <- html_text(penalties)
  
  
  equipo <- c(nombre_equipo, partidos_jugados, partidos_ganados, partidos_empatados, goles, asistencias, tarjetas, penalties)
}
pag[1]
resw <- get_Equipo(pag[1])
resw
resultado_datos <- sapply(pag, get_Equipo)
View(resultado_datos)
class(resultado_datos)
dim(resultado_datos)
res<- t(resultado_datos)
View(res)
LaLiga <-as.data.frame(res)
colnames(LaLiga) <- c('Nombre Equipo', 'Partidos Jugados', 'Partidos Ganados','Partidos Empatados','Goles', 'Asistencias', 'Tarjetas', 'Penalties')
rownames(LaLiga) <- c(1:20)
View(LaLiga)
