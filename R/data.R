#' Baseline socioeconomic information and BMI of 100 individuals.
#'
#' A dataset containing the body mass index (BMI) and baseline
#' socioeconomic information of 100 individuals from the National
#' Longitudinal Survey of Youth 1979 (NLSY), a freely available longitudinal dataset.
#' The 1000 individuals were drawn randomly from among all NLSY respondents with at least 10
#' non-missing height/weight responses spread out over at least 20 years.
#' This dataset is used in the package vignettes and code examples. Only a small
#' subset of the variables available from the NLSY are included here.
#' See https://www.bls.gov/nls/nlsy79.htm for more
#'
#' @format A data frame with 16126 rows and 34 columns.
#' \describe{
#'   \item{ID}{Unique identifier for each NLSY respondent}
#'   \item{SEX}{Respondent's sex. 1 denotes male, 2 denotes female.}
#'   \item{AGE}{Respondent's age}
#'   \item{BLACK}{Indicator for whether or not respondent's identified as Black}
#'   \item{BMI}{Respondent's body mass index - calculated from reported height and weight}
#'   \item{HGC_FATHER}{Highest grade completed by respondent's father}
#'   \item{HGC_MOTHER}{Highest grade completed by respondent's mother}
#'   \item{HISP}{Indicator for whether or not respondent's race identified as Hispanic}
#'   \item{Num_sibs}{Number of siblings of respondent}
#'   \item{WHITE}{Indicator for whether or not respondent identified as white.}
#'   \item{HGC}{Highest grade completed by respondent}
#'   \item{Age_first_smoke}{Age that respondent reported first using tobacco. If they reported never using tobacco, recorded as 100.}
#'   \item{Age_first_alc}{Age that respondent reported first drinking alcohol. If they reported never drinking alcohol, recorded as 100.}
#'   \item{RACE}{Race, as recorded by NLSY. 1 denotes Hispanic, 2 denotes Black, 3 denotes White.}
#' }
#' @source \url{https://www.bls.gov/nls/nlsy79.htm}
#' @keywords internal
"nlsySample"


#' Sample tree used in examples
#' @keywords internal
"tree"


#' Sample forest used in vignettes
#' @keywords internal
"forest"

#' Sample importance used in vignettes
#' @keywords internal
"importance"
