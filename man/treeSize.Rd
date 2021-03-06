% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/other_useful_fns.R
\name{treeSize}
\alias{treeSize}
\title{Returns number of terminal nodes in a tree.}
\usage{
treeSize(model)
}
\arguments{
\item{model}{A model returned by splineTree(). Also works on any rpart object}
}
\value{
The number of terminal nodes in the tree
}
\description{
Returns number of terminal nodes in a tree.
}
\examples{
\dontrun{
split_formula <- ~ HISP + WHITE + BLACK + SEX + HGC_FATHER + HGC_MOTHER + Num_sibs
tree <- splineTree(split_formula, BMI~AGE, 'ID', nlsySample, degree=1,
  df=3, intercept=TRUE, cp=0.006, minNodeSize=20)
}
treeSize(tree)
}
