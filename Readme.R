dxfin <- function(file, layername = "Tereppontok") {
    raw.text <- scan(file, character(), fileEncod = "latin1")
    prepont <- which(raw.text == layername)
    pont <- prepont
    ## Koordináta helyének meghatározása
    kozel <- raw.text[prepont + 2] == "AcDbPoint"
    pont[kozel] <- pont[kozel] + 2
    pont[!kozel] <- pont[!kozel] + 4
    pont <- pont[raw.text[pont] == "AcDbPoint"]
    ## Koordináták kiszedésedxffileso
    Y.coo <- raw.text[pont + 2]
    X.coo <- raw.text[pont + 4]
    Z.coo <- raw.text[pont + 6]
    ## Feliratok kiszedése
    felirat <- which(raw.text == "Tereppontok_Felirat")
    felirat <- felirat[-1]
    kod.txt <- raw.text[felirat + 12]
    ## Sorszám kiszedése
    sorszam <- which(raw.text == "Tereppontok_Sorszám")
    sorszam <- sorszam[-1]
    ssz.txt <- raw.text[sorszam + 12]
    ## Adattábla
    data.frame(SSZ = as.numeric(ssz.txt),
               Y = round(as.numeric(Y.coo), 2),
               X = round(as.numeric(X.coo), 2),
               Z = round(as.numeric(Z.coo), 2),
               K = kod.txt
               )
}
