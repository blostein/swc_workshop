#AUTHOR: fab
#this is how you comment 
#always comment
#forshoyo
#This is a script that I wrote
download.file("https://raw.githubusercontent.com/swcarpentry/r-novice-gapminder/gh-pages/_episodes_rmd/data/gapminder-FiveYearData.csv", destfile = "gapminder-FiveYearData.csv")
gapminder <- read.csv("gapminder-FiveYearData.csv")
#the following are good ways to summarize/understand your dataframe
head(gapminder)
tail(gapminder)
colnames(gapminder)
#think of each column in a dataframe as being a separate vector, and each column value at the same row will correspond to same observation
str(gapminder)
nrow(gapminder)
ncol(gapminder)
dim(gapminder)
summary(gapminder)
View(gapminder)
#subsetting data: dataframe as a "vector of vectors"
#gapminder[row,column]
gapminder[1,] #first row
gapminder[566,]
gapminder[,3] #column three
gapminder[,"pop"] # same thing more human friendly
gapminder[6,c("country", "year", "pop")]
#get single column
gapminder$lifeExp
#create a variable "is long life expectancy"
islong_lifeexpectancy <- gapminder$lifeExp>80
head(islong_lifeexpectancy)
gapminder[islong_lifeexpectancy,]
#in 20007 what were the life expectencies of the countries in africa
thing<- gapminder$continent=="Africa" & gapminder$year==2007
Africa_2007<-gapminder[thing,c("country", "lifeExp")]
mean(gapminder[thing, c("lifeExp")])
o <- order(Africa_2007$lifeExp)
Africa_2007[o,]

#making a plot
ggplot(data = gapminder, aes(x = year, y = lifeExp, color = continent)) + geom_point()+facet_grid(.~continent)
#save plot
ggsave(filename="year_vs_lifeExp_perContinent.png", width=5, height=4, units="in")
