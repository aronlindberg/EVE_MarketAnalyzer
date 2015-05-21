library(data.table)
# install.packages(c("data.table", "quantmod"))
library(data.table)
library(quantmod)
library(jsonlite)
item_title = "Obelisk"
item_id = "29668"
region_id = "10000002"
query_addr = paste0("http://public-crest.eveonline.com/market/",region_id,"/types/",item_id,"/history/")
market.json <- fromJSON(readLines(query_addr))
market.data.json <- data.table(market.json$items)
market.data <- market.data.json[,list(Date = as.Date(date),
                                      Volume= volume,
                                      High  = highPrice,
                                      Low   = lowPrice,
                                      Close =avgPrice[-1],
                                      Open  = avgPrice)]
n <- nrow(market.data)
market.data <- market.data[1:n-1,]
low_flag  = quantile(market.data$Low,.25)/5 # these are very high cutoffs
high_flag = quantile(market.data$High,.75)*5
market.data$Low[market.data$Low<=low_flag] <-min(market.data$Open,market.data$Close)
market.data$High[market.data$High>=high_flag] <-max(market.data$Open,market.data$Close)
market.data.ts <- xts(market.data[,-1,with=F], order.by=market.data[,Date], period=7)
chartSeries(market.data.ts,
            name = item_title,
            TA = "addBBands(15,2);addVo();addMACD(5,15,5);addRSI();addLines(h=30, on=4);addLines(h=70, on=4)",
            subset = "last 12 weeks")