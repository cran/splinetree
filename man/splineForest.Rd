% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/splineForest.R
\name{splineForest}
\alias{splineForest}
\title{Build a spline random forest.}
\usage{
splineForest(splitFormula, tformula, idvar, data, knots = NULL,
  df = NULL, degree = 3, intercept = FALSE, nGrid = 7,
  gridPoints = NULL, ntree = 50, prob = 0.3, cp = 0.001,
  minNodeSize = 1, bootstrap = FALSE)
}
\arguments{
\item{splitFormula}{Formula specifying the longitudinal response variable and the time-constant variables that will be used for splitting in the tree.}

\item{tformula}{Formula specifying the longitudinal response variable and the variable that acts as the time variable.}

\item{idvar}{The name of the variable that serves as the ID variable for grouping observations. Must be in quotes}

\item{data}{dataframe that contains all variables specified in the formulas- in long format.}

\item{knots}{Specified locations for internal knots in the spline basis. Defaults to NULL, which corresponds to no internal knots.}

\item{df}{Degrees of freedom of the spline basis. If this is specified but the knots parameter is NULL, then the appropriate number of internal knots
will be added at quantiles of the training data. If both df and knots are unspecified, the spline basis will have no internal knots.}

\item{degree}{Specifies degree of spline basis used in the tree.}

\item{intercept}{Specifies whether or not the splitting process will consider the intercept coefficient of the spline projections.
Defaults to FALSE, which means that the tree will split based on trajectory shape, ignoring response level.}

\item{nGrid}{Number of grid points to evaluate projection sum of squares at. If gridPoints is not supplied, then this is the
number of grid points that will be automatically placed at quantiles of the time variable. The default is 7.}

\item{gridPoints}{Optional. A vector of numbers that will be used as the grid on which to evaluate the projection
sum of squares. Should fall roughly within the range of the time variable.}

\item{ntree}{Number of trees in the forest.}

\item{prob}{Probability of selecting a variable to included as a candidate for each split.}

\item{cp}{Complexity parameter passed to the rpart building process. Default is the rpart default of 0.01}

\item{minNodeSize}{Minimum number of observational units that can be in a terminal node. Controls tree size and helps avoid overfitting.
Default is 10.}

\item{bootstrap}{Boolean specifying whether bootstrap sampling should be used when choosing data to
use for each tree. When set to FALSE (the default), sampling without replacement is used and 63.5% of the data
is used for each tree. When set to TRUE, a bootstrap sample is used for each tree.}
}
\value{
A spline forest model, which is a named list with 15 components.
The list stores a list of trees (in model$Trees), along with information about the
spline basis used (model$intercept, model$innerKnots, model$boundaryKnots, etc.), and information about which datapoints were
used to build each tree (model$oob_indices and model$index). Note that each element in model$Trees is an rpart object but
it is not the same as a model returned from splineTree() because it does not store all relevant information in model$parms.
}
\description{
Builds an ensemble of regression trees for longitudinal or functional data using the spline projection method. The resulting model
contains a list of spline trees along with some additional information. All parameters are used in the same way that they are used in
the splineTree() function. The additional parameter ntree specifies how many trees should be in the ensemble, and prob controls the
probability of selecting a given variable for split consideration at a node. This method may take several minutes to run- saving the forest after
building it is recommended.
}
\details{
The ensemble method is highly similar to the random forest methodology of Breiman (2001). Each tree in the ensemble is fit to a random sample
of 63.5% of the data (sampled without replacement). At each node of each tree, only a subset of the split variables are considered candidates for the split. In our methodology,
the subset of variables considered at each node is determined by a random process. The prob parameter specifies the probability that a given variable
will be selected at a certain node. Because the method is based on probability, the same number of variables are not considered for splitting at each node
(as in the randomForest package). Note that if prob is small and the number of variables in the splitFormula is also small, there is a high probability that
no variables will be considered for splitting at a certain node, which is problematic. The fewer total variables there are, the larger prob should be to
ensure good results.
}
\examples{
\donttest{
nlsySubset <- nlsySample[nlsySample$ID \%in\% sample(unique(nlsySample$ID), 400),]
splitForm <-~HISP+WHITE+BLACK+HGC_MOTHER+HGC_FATHER+SEX+Num_sibs
sampleForest <- splineForest(splitForm, BMI~AGE, 'ID', nlsySubset, degree=1, cp=0.005, ntree=10)
}
}
