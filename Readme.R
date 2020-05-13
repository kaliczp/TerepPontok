dxfin <- function(file) {
    raw.text <- scan(file, character(), enc="latin1")
    pont <- which(raw.text == "TEREPPONTOK")
    ## Rétegdefiníció törlése
    pont <- pont[-1]
    ## Koordináták kiszedése
    Y.coo <- raw.text[pont + 2]
    X.coo <- raw.text[pont + 4]
    Z.coo <- raw.text[pont + 6]
    ## Feliratok kiszedése
    felirat <- which(raw.text == "TEREPPONTOK_FELIRAT")
    felirat <- felirat[-1]
    kod.txt <- raw.text[felirat + 10]
    ## Sorszám kiszedése
    sorszam <- which(raw.text == "TEREPPONTOK_SORSZÁM")
    sorszam <- sorszam[-1]
    ssz.txt <- raw.text[sorszam + 10]
    ## Adattábla
    data.frame(SSZ = as.numeric(ssz.txt),
               Y = round(as.numeric(Y.coo), 2),
               X = round(as.numeric(X.coo), 2),
               Z = round(as.numeric(Z.coo), 2),
               K = kod.txt
               )
}
