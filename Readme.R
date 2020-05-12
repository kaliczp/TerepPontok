dxfin <- function(file) {
    raw.text <- scan(file, character(), enc="latin1")
    pont <- which(raw.text == "TEREPPONTOK")
    ## Rétegdefiníció törlése
    pont <- pont[-1]
    ## Koordináták kiszedése
    Y.coo <- raw.text[pont + 2]
    X.coo <- raw.text[pont + 4]
    Z.coo <- raw.text[pont + 6]
    ## Adattábla
    data.frame(Y = Y.coo, X = X.coo, Z = Z.coo)
}
