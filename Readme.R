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
    ## Adattábla
    data.frame(Y = Y.coo, X = X.coo, Z = Z.coo, K = kod.txt)
}
