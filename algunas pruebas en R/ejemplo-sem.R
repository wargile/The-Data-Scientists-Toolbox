# TODO: Add comment
# 
# Author: pacha
###############################################################################

library(sem)
data(Klein)
Klein
Klein$P.lag <- c(NA, Klein$P[-22])
Klein$X.lag <- c(NA, Klein$X[-22])
Klein[1:3,]
Klein.eqn1 <- tsls(C ~ P + P.lag + I(Wp + Wg),
		instruments=~ G + T + Wg + I(Year - 1931) + K.lag + P.lag + X.lag,
		data=Klein)
Klein.eqn2 <- tsls(I ~ P + P.lag + K.lag,
		instruments=~ G + T + Wg + I(Year - 1931) + K.lag + P.lag + X.lag,
		data=Klein)
Klein.eqn3 <- tsls(Wp ~ X + X.lag + I(Year - 1931),
		instruments=~ G + T + Wg + I(Year - 1931) + K.lag + P.lag + X.lag,
		data=Klein)
summary(Klein.eqn1)
summary(Klein.eqn2)
summary(Klein.eqn3)
sqrt(diag(vcov(Klein.eqn1)*17/21))
sqrt(diag(vcov(Klein.eqn2)*17/21))
sqrt(diag(vcov(Klein.eqn3)*17/21))