\name{predict.dceGMDH}
\alias{predict.dceGMDH}
\title{Predicting Using dce-GMDH Algorithm for Binary Classification}
\description{
  This function predicts values based upon a model trained by \code{dceGMDH}.
}
\usage{
\method{predict}{dceGMDH}(object, x, type = "class", ...)
}

\arguments{
  \item{object}{an object of class \code{"dceGMDH"}, created by \code{dceGMDH}.}
  \item{x}{a matrix containing the new input data.}
  \item{type}{a character string to return predited output. If type = "class", the function returns the predicted classes. If type = "probability", it returns the predicted probabilities. Default is set to "class".}
  \item{\dots}{currently not used.}
}
\value{
  A vector of predicted values of corresponding classes depending on type specified. 
}
\author{
Osman Dag, Erdem Karabulut, Reha Alpar
}
\seealso{
  \code{\link{dceGMDH}}
}
\examples{

library(GMDH2)

library(mlbench)
data(BreastCancer)

data <- BreastCancer

# to obtain complete observations
completeObs <- complete.cases(data)
data <- data[completeObs,]

xdata <- data.matrix(data[,2:10])
ydata <- data[,11]

seed <- 10
set.seed(seed)

no.rows <- length(ydata)

# to split train and test sets
train.indices <- sort(sample(1:no.rows, round(no.rows*0.8,0)))
test.indices <- (1:no.rows)[-train.indices]

x.train <- xdata[train.indices,]
y.train <- ydata[train.indices]

x.test <- xdata[test.indices,]
y.test <- ydata[test.indices]


set.seed(seed)

# to construct model via dce-GMDH algorithm
model <- dceGMDH(x.train, y.train)

# to obtain predicted classes for train set
predict(model, x.train, type = "class")
# to obtain predicted probabilities for train set
predict(model, x.train, type = "probability")


# to obtain predicted classes for test set
predict(model, x.test, type = "class")
# to obtain predicted probabilities for test set
predict(model, x.test, type = "probability")

}

\keyword{functions}
