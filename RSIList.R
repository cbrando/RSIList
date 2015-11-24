# *******************************************************
# * RSI List                                            *
# * Calculates the RSI for a list Symbols in a csv file *
# *                                                     *
# *******************************************************

library("TTR")
library("reshape2")

sl<-read.csv("symlist.csv")
#sl<-head(sl,2)

start<-"20000101"
end<-"20251231"
inv<-data.frame(1:10)
for(i in sl$Symbol) {
  y<-getYahooData(i, start, end, freq = "daily", type = "price",
               adjust = TRUE, quiet = FALSE)
  rsi<-tail(RSI(y$Close, n = 14),10)
  inv[i]<-rsi
}
inv<-inv[,order(inv[10,])]
