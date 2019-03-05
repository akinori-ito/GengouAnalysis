library(stringr)

x <- read.table("GenGou.txt",as.is=T,header=F)
x <- x$V1

cl <- c()
for (i in 1:length(x)) {
  s <- strsplit(x[i],"")
  cl <- c(cl,s[[1]])
}
freq <- table(cl)
freq <- sort(freq,decreasing=TRUE)
gnames <- factor(names(freq),labels=names(freq))
gframe <- data.frame(freq)
g <- ggplot(gframe,aes(x=cl,y=Freq))
g <- g+geom_bar(stat="identity")
print(g)

