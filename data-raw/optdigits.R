library(dplyr)

testSrc <- paste0('https://archive.ics.uci.edu/ml/machine-learning-databases',
                  '/optdigits/optdigits.tes')
trainSrc <- paste0('https://archive.ics.uci.edu/ml/machine-learning-databases',
                   '/optdigits/optdigits.tra')
outFile <- file.path('data', 'optdigits.rda')

if (!file.exists(outFile)) {
    optdigits <- read.csv(trainSrc, header = FALSE) %>%
        rbind(read.csv(testSrc, header = FALSE)) %>%
        tbl_df()
    names(optdigits)[65] <- 'Class'
    optdigits$Class <- as.factor(optdigits$Class)
    save(optdigits, file = outFile)
}