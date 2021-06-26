UnifCode <- function(x) {
    ## Fieldpoint code
    fieldcode <- x[, "K"] == "T"
    x[fieldcode, "K"]  <- "t"
    ## Boose point code
    fieldcode <- x[, "K"] == "B"
    x[fieldcode, "K"]  <- "sv"
    x
}
