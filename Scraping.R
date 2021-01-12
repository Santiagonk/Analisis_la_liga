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

url <- 'https://www.laliga.com/clubes/villarreal-cf/estadisticas'
pagina_web <- read_html(url)

sel_nombre <- '#__next > div.styled__ClubContainer-sc-9wem1u-0.jtossP > div.styled__ClubHeader-sc-9wem1u-1.hAPQqJ > div.styled__Container-asfu3p-0.gpTxyc > div > div.styled__ClubHeaderCompWrap-wi838o-0.ePEocl > div.styled__ClubInfo-wi838o-1.gPESPv > div.styled__ClubInfoText-wi838o-3.hDrGiX > h1'
nombre_equipo <- html_node(pagina_web, sel_nombre)
nombre_equipo <- html_text(nombre_equipo)


sel_partidos_jugados <- '#__next > div.styled__ClubContainer-sc-9wem1u-0.jtossP > div.styled__ClubSectionContent-sc-9wem1u-8.hqgNRs > div:nth-child(1) > div > div > div:nth-child(1) > div > div > div.styled__ShowLoadedContainer-sc-191gwr0-0.kIkKfC.show > div.react-tabs__tab-panel.react-tabs__tab-panel--selected > div > div:nth-child(1) > div.styled__FastStatsCol-sc-1rbio1c-4.ldHwr > div.styled__FastStatsColItem-sc-1rbio1c-6.iJcjeR > div > p.styled__TextRegularStyled-sc-12cic8i-0.iATXqP.styled__TextRegularBlock-sc-1rbio1c-7.fgPoci'
partidos_jugados <- html_node(pagina_web, sel_partidos_jugados)
partidos_jugados <- html_text(partidos_jugados)

sel_partidos_ganados <- '#__next > div.styled__ClubContainer-sc-9wem1u-0.jtossP > div.styled__ClubSectionContent-sc-9wem1u-8.hqgNRs > div:nth-child(1) > div > div > div:nth-child(1) > div > div > div.styled__ShowLoadedContainer-sc-191gwr0-0.kIkKfC.show > div.react-tabs__tab-panel.react-tabs__tab-panel--selected > div > div:nth-child(2) > div.styled__FastStatsCol-sc-1rbio1c-4.gVRGtE > div:nth-child(2) > div > p.styled__TextRegularStyled-sc-12cic8i-0.hZBqHh.styled__TextRegularBlock-sc-1rbio1c-7.fgPoci'
partidos_ganados <- html_node(pagina_web, sel_partidos_ganados)
partidos_ganados <- html_text(partidos_ganados)

sel_partidos_empatados <- '#__next > div.styled__ClubContainer-sc-9wem1u-0.jtossP > div.styled__ClubSectionContent-sc-9wem1u-8.hqgNRs > div:nth-child(1) > div > div > div:nth-child(1) > div > div > div.styled__ShowLoadedContainer-sc-191gwr0-0.kIkKfC.show > div.react-tabs__tab-panel.react-tabs__tab-panel--selected > div > div:nth-child(2) > div.styled__FastStatsCol-sc-1rbio1c-4.bDEJZT > div:nth-child(2) > div > p.styled__TextRegularStyled-sc-12cic8i-0.hZBqHh.styled__TextRegularBlock-sc-1rbio1c-7.fgPoci'
partidos_empatados <- html_node(pagina_web, sel_partidos_empatados)
partidos_empatados <- html_text(partidos_empatados)

sel_goles <- '#__next > div.styled__ClubContainer-sc-9wem1u-0.jtossP > div.styled__ClubSectionContent-sc-9wem1u-8.hqgNRs > div:nth-child(1) > div > div > div:nth-child(1) > div > div > div.styled__ShowLoadedContainer-sc-191gwr0-0.kIkKfC.show > div.react-tabs__tab-panel.react-tabs__tab-panel--selected > div > div.styled__FastStatsRow-sc-1rbio1c-3.kgibDr > div:nth-child(1) > div.styled__FastStatsColItem-sc-1rbio1c-6.cvJneS > div > p.styled__TextRegularStyled-sc-12cic8i-0.bDhMbX.styled__TextRegularBlock-sc-1rbio1c-7.fgPoci'
goles <- html_node(pagina_web, sel_goles)
goles <- html_text(goles)

sel_asistencias <- '#__next > div.styled__ClubContainer-sc-9wem1u-0.jtossP > div.styled__ClubSectionContent-sc-9wem1u-8.hqgNRs > div:nth-child(1) > div > div > div:nth-child(1) > div > div > div.styled__ShowLoadedContainer-sc-191gwr0-0.kIkKfC.show > div.react-tabs__tab-panel.react-tabs__tab-panel--selected > div > div.styled__FastStatsRow-sc-1rbio1c-3.kgibDr > div:nth-child(2) > div.styled__FastStatsColItem-sc-1rbio1c-6.cvJneS > div > p.styled__TextRegularStyled-sc-12cic8i-0.bDhMbX.styled__TextRegularBlock-sc-1rbio1c-7.fgPoci'
asistencias <- html_node(pagina_web, sel_asistencias)
asistencias <- html_text(asistencias)

sel_tarjetas <- '#__next > div.styled__ClubContainer-sc-9wem1u-0.jtossP > div.styled__ClubSectionContent-sc-9wem1u-8.hqgNRs > div:nth-child(1) > div > div > div:nth-child(1) > div > div > div.styled__ShowLoadedContainer-sc-191gwr0-0.kIkKfC.show > div.react-tabs__tab-panel.react-tabs__tab-panel--selected > div > div.styled__FastStatsRow-sc-1rbio1c-3.kgibDr > div:nth-child(3) > div.styled__FastStatsColItem-sc-1rbio1c-6.cvJneS > div > p.styled__TextRegularStyled-sc-12cic8i-0.bDhMbX.styled__TextRegularBlock-sc-1rbio1c-7.fgPoci'
tarjetas <- html_node(pagina_web, sel_tarjetas)
tarjetas <- html_text(tarjetas)
  
sel_penalties <- '#__next > div.styled__ClubContainer-sc-9wem1u-0.jtossP > div.styled__ClubSectionContent-sc-9wem1u-8.hqgNRs > div:nth-child(1) > div > div > div:nth-child(1) > div > div > div.styled__ShowLoadedContainer-sc-191gwr0-0.kIkKfC.show > div.react-tabs__tab-panel.react-tabs__tab-panel--selected > div > div.styled__FastStatsRow-sc-1rbio1c-3.kgibDr > div:nth-child(4) > div.styled__FastStatsColItem-sc-1rbio1c-6.cvJneS > div > p.styled__TextRegularStyled-sc-12cic8i-0.bDhMbX.styled__TextRegularBlock-sc-1rbio1c-7.fgPoci'
penalties <- html_node(pagina_web, sel_penalties)
penalties <- html_text(penalties)