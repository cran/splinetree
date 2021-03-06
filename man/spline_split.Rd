% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/custom_rpart_fns.R
\name{spline_split}
\alias{spline_split}
\title{Custom rpart split function.}
\usage{
spline_split(y, wt, x, parms = NULL, continuous)
}
\arguments{
\item{y}{The responses at this node}

\item{wt}{Used to weight observations differently. Required by rpart, but not supported by splinetree, so its value will always be NULL.}

\item{x}{The data for a particular covariate}

\item{parms}{rpart's custom split functionality allows optional parameters to be passed through the splitting functions.
In the splinetree package, the parms parameter is used to hold a list of length 1 or 2 containing either just a spline basis matrix (for a tree), or
a spline basis matrix and the probability that a variable will be selected at a split (for a random forest).}

\item{continuous}{Value is handled internally by rpart - tells us if this covariate is continuous (TRUE) or categorical (FALSE).}
}
\value{
A list with two components, goodness and direction, describing the goodness of fit and direction for each possible split for this covariate.
The goodness component holds the utility of the split (projected sum of squares) for each possible split.
If the continuous parameter is TRUE, goodness and direction each have length n-1, here n is the length of x.
The ith value of goodness describes utility of splitting observations 1 to i from i + 1 to n.
The values of direction will be \eqn{-1} and \eqn{+1}, where \eqn{-1} suggests that values with y < cutpoint be sent to the left side of the tree,
and a value of +1 that values with y cutpoint be sent to the right. This is not really an important choice,
it only matters for tree reading conventions.
If the continuous parameter is FALSE, then the predictor variable x is categorical with
k classes and there are potentially almost 2k different ways to split the node.
When invoking custom split functions, rpart assumes that a reasonable approximation can be
computed by first ordering the groups by their
first principal component of the average y vector and then using the
usual splitting rule on this ordered variable.
In this case, the direction vector has k values giving the ordering of the groups, and the goodness vector
has k-1 values giving the utility of the splits.
}
\description{
The split function is required for the custom rpart functionality. This function is called once per covariate per node during the tree construction,
and is responsible for choosing the covariate and threshold for the best split point. This implements the split function suggested by Yu and Lambert.
When the covariate is categorical, this code uses a shortcut for computational efficiency. Instead of trying
every possible combination of categories as a potential split point, the categories are ordered using the first principal component of the average spline coefficient vector.
}
\keyword{internal}
