# TODO: Add comment
# 
# Author: pacha
###############################################################################


library("lavaan")
library("semPlot")

# Example 5.8 from mplus user guide:
Data <- read.table("http://www.statmodel.com/usersguide/chap5/ex5.8.dat")
names(Data) <- c(paste("y", 1:6, sep = ""), paste("x", 1:3, sep = ""))

# Model:
model.Lavaan <- "f1 =~ y1 + y2 + y3\nf2 =~ y4 + y5 + y6\nf1 + f2 ~ x1 + x2 + x3 "

# Run Lavaan:
library("lavaan")
fit <- lavaan:::cfa(model.Lavaan, data = Data, std.lv = TRUE)

# Plot path diagram:
semPaths(fit, "std", edge.label.cex = 0.5, curvePivot = TRUE)

