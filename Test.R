dxffiles <- dir(pattern = "dxf")
for(ttfile in 1:length(dxffiles)) {
    ttdxf <- dxfin(file = dxffiles[ttfile])
    ## Sorsz
    ttdxf[1:2,1] <- sort(sample(1:9,2))*10
    ttssznum <- sample(0:3,1)
    ttdxf[3:9,1] <- ttdxf[3:9,1] - ttssznum * 100
    ttdxf[10:91,1] <- ttdxf[10:91,1] - ttssznum * 1000
    ## Magasság
    ttdxf[,4] <- round(ttdxf[,4] +
                       runif(nrow(ttdxf), -0.32, 0.32) +
                       (ttfile - 1) * 15, 2)
    ttnewfilen <- unlist(strsplit(dxffiles[ttfile], "[.]"))
    write.table(ttdxf, paste0(ttnewfilen[1], ".EXP"), sep=",", col.names = FALSE, row.names = F, quot = F, eol = "\r\n")
}
