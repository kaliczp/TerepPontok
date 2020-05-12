dxffiles <- dir(pattern = "dxf")
for(ttfile in dxffiles) {
    ttdxf <- dxfin(file = ttfile)
    ttnewfilen <- unlist(strsplit(ttfile, "[.]"))
    write.table(ttdxf, paste0(ttnewfilen[1], ".csv"), sep=",", col.names = FALSE, row.names = F, quot = F)
}
