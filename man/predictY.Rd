% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/tree_evaluation.R
\name{predictY}
\alias{predictY}
\title{Predictions from a spline tree}
\usage{
predictY(model, testData = NULL)
}
\arguments{
\item{model}{A model created with splineTree()}

\item{testData}{The data to return predictions for. If ommitted, uses the training data.}
}
\value{
A vector of predictions with rows corresponding to the testdata.
}
\description{
Returns a vector of predicted responses for the testData. If testData is ommitted,
returns predictions for the training data. This function is most meaningful if model$intercept==TRUE.
}
\examples{
\donttest{
split_formula <- ~HISP + WHITE + BLACK + SEX + Num_sibs + HGC_FATHER + HGC_MOTHER
tree <- splineTree(split_formula, BMI~AGE, idvar = "ID",
   data = nlsySample, degree = 1, df = 3,
   intercept = TRUE, cp = 0.005)
}
plot(predictY(tree), tree$parms$data[[tree$parms$yvar]])
}
