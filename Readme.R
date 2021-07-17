dxfin <- function(file, layername = "Tereppontok") {
    raw.text <- scan(file, character(), fileEncod = "latin1")
    pont <- which(raw.text == layername)
    ## Rétegdefiníció törlése
    pont <- pont[-c(1,2)]
    ## Koordináták kiszedésedxffileso
    Y.coo <- raw.text[pont + 4]
    X.coo <- raw.text[pont + 6]
    Z.coo <- raw.text[pont + 8]
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
