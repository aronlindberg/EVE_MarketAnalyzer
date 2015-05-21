setwd("/Users/Aron/Downloads/")
library(RCurl)
# Loading the database
export PATH=$PATH:/usr/local/mysql/bin
wget https://www.fuzzwork.co.uk/dump/mysql56-proteus-1.0-109795.tbz2

mysql -u root -p
mysql> create user 'zkb'@'localhost' identified by 'zkb';
mysql> create database zkb;
mysql> GRANT ALL PRIVILEGES ON zkb.* to zkb@'localhost';
mysql> flush privileges;
# Exit MySQL prompt
mysql -u zkb -p zkb
# Then add the tables using the commands in each table from Lockefox's Github
# Also need to add all the tables from the SDE

library(DBI)
library(RMySQL)


m <- dbDriver("MySQL");

con <- dbConnect(m, user='zkb', password='zkb', host='localhost', dbname='sde');

id_res <- dbSendQuery(con, "SELECT * FROM sde.invTypes;")

id_list <- fetch(id_res, n = -1)

# 0. Connect to the database
# 1. Execute dplyr or data.table queries. Let's skip SQL and go directly with data.table, since the data will be big.
# 2. Visualize queries using ggvis


# To get the kills we query the API:
# 1. Set up API query using httr or RCurl
# 2. Use jsonlite or similar to convert to an R object
# 3. Construct a social network to see how flies with whom in Aideron

library(jsonlite)
library(RCurl) # maybe use `httr` instead?

data <- fromJSON(getURL("https://zkillboard.com/api/corporation/1894214152/page/1/", verbose = T, encoding="gzip"))
str(data, max.level=1)

# Store factions, regions, and systems as variables so that easy queries can be formulated
# Implement a way to aggregate multiple pages
# Implement a way to filter by date

# Social Network analysis
data$attackers[[1]]$characterName
data$attackers[[1]]$characterID
# use combn() to create networks