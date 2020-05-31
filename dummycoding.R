#Dummy coding of rows containing multiple factors separated by space 
lev <- levels(factor(df$variable))
#Split strings within "variable" based on presence of space
#make list "lev" of unique components resulting from previous split
lev <- unique(unlist(strsplit(lev, " ")))
#Amend names in "lev" if desired
#mnames <- gsub(" ", "_", paste("prefix", lev, sep = "_"))
#creat empty matrix with defaul value of "0" with unique "lev" components as columns
result <- matrix(data = "0", nrow = length(df$variable), ncol = length(lev))
variable.as.character <- as.character(df$variable)
for (i in 1:length(lev)) {
  result[grep(lev[i], variable.as.character, fixed = TRUE), i] <- "1"
}
result <- data.frame(result, stringsAsFactors = TRUE)
#to convert factors back to numeric
colnames(result) <- lev #or mnames if you changed column names
as.numeric.factor <- function(x) {as.numeric(levels(x))[x]}
result2 <-as.data.frame(sapply(result, as.numeric.factor))
dumcoded <- cbind(df,result2) 

