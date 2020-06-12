dxffiles <- dir(pattern = "dxf")
dxffiles <- dxffiles[c(1,3:10,2)]
numcorr <- c(2:(-6),3)
for(ttfile in 1:length(dxffiles)) {
    ttdxf <- dxfin(file = dxffiles[ttfile])
    ## Sorsz
    Line.ssz <- ttdxf[,"K"] == "AP"
    ttdxf[Line.ssz,1] <- sort(sample(1:9,2))*10
    ttssznum <- numcorr[ttfile]
    Line.sp <- ttdxf[,"K"] == "SP"
    ttdxf[Line.sp, 1] <- ttdxf[Line.sp, 1] - ttssznum * 100
    Line.sp <- ttdxf[,"K"] == "B" | ttdxf[,"K"] == "T"
    ttdxf[Line.sp, 1] <- ttdxf[Line.sp,1] - ttssznum * 1000
    ## Magasság
    ttdxf[,4] <- round(ttdxf[,4] +
                       runif(nrow(ttdxf), -0.32, 0.32) +
                       (ttfile - 1) * 15, 2)
    ttnewfilen <- unlist(strsplit(dxffiles[ttfile], "[.]"))
    write.table(ttdxf[1:9,], paste0(ttnewfilen[1], "AP.EXP"), sep=",", col.names = FALSE, row.names = F, quot = F, eol = "\r\n")
    write.table(ttdxf[10:91,], paste0(ttnewfilen[1], "RP.EXP"), sep=",", col.names = FALSE, row.names = F, quot = F, eol = "\r\n")
}
