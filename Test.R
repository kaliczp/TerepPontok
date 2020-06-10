dxffiles <- dir(pattern = "dxf")
for(ttfile in dxffiles) {
    ttdxf <- dxfin(file = ttfile)
    ## Sorsz
    ttdxf[1:2,1] <- sort(sample(1:9,2))*10
    ttssznum <- sample(0:3,1)
    ttdxf[3:9,1] <- ttdxf[3:9,1] - ttssznum * 100
    ttdxf[10:91,1] <- ttdxf[10:91,1] - ttssznum * 1000
    ## Magasság
    ttdxf[,4] <- round(ttdxf[,4] + rnorm(nrow(ttdxf), sd=.02) + sample(1:10,1)*10,2)
    ttnewfilen <- unlist(strsplit(ttfile, "[.]"))
    write.table(ttdxf, paste0(ttnewfilen[1], ".EXP"), sep=",", col.names = FALSE, row.names = F, quot = F, eol = "\r\n")
}
