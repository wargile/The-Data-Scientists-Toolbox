# TODO: Add comment
# 
# Author: pacha
###############################################################################

# grafico de los datos
attach(mtcars)
plot(wt, mpg, main="regresion peso vehiculo/kms por litro",
		xlab="peso del vehiculo (ton)", ylab="kms por litro", pch=19) 

# grafica de la función de regresion
abline(lm(mpg~wt), col="red") # regression line (y~x)
lines(lowess(wt,mpg), col="blue") # lowess line (x,y) 