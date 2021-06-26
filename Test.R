nevek <- scan("nevek.csv", "character", sep = "\n")
nevek <- gsub(" ", "_", nevek)
dxffiles <- dir(pattern = "dxf")
dxffiles <- dxffiles[c(1,3:10,2)]
numcorr <- c(2:(-6),2)
for(ttfile in 1:length(dxffiles)) {
    ttdxf <- dxfin(file = dxffiles[ttfile])
    ## Sorsz
    Line.ap <- ttdxf[,"K"] == "AP"
    ttdxf[Line.ap,1] <- sort(sample(1:9,2))*10
    ttssznum <- numcorr[ttfile]
    Line.sp <- ttdxf[,"K"] == "SP"
    ttdxf[Line.sp, 1] <- ttdxf[Line.sp, 1] - ttssznum * 100
    Line.t <- ttdxf[,"K"] == "B" | ttdxf[,"K"] == "T"
    ttdxf[Line.t, 1] <- ttdxf[Line.t,1] - (ttssznum - 2) * 1000 + 1
    ## Magasság
    ttdxf[,4] <- round(ttdxf[,4] +
                       runif(nrow(ttdxf), -0.32, 0.32) +
                       (ttfile - 1) * 15, 2)
    ttnewfilen <- unlist(strsplit(dxffiles[ttfile], "[.]"))
    ttnewfilen <- paste(ttnewfilen, nevek[ttfile], sep = "_")
    write.table(ttdxf[Line.ap | Line.sp,], paste0(ttnewfilen[1], "_AP.EXP"), sep=",", col.names = FALSE, row.names = F, quot = F, eol = "\r\n")
    write.table(ttdxf[Line.t,], paste0(ttnewfilen[1], "_RP.EXP"), sep=",", col.names = FALSE, row.names = F, quot = F, eol = "\r\n")
}
