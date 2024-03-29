% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/bayes_estimation.R
\name{estimate_ssmodel}
\alias{estimate_ssmodel}
\title{Bayesian estimation via Gibbs sampling}
\usage{
estimate_ssmodel(
  model,
  settings,
  data,
  prior = initialize_prior(model),
  R = 10000,
  burnin = 0.5,
  thin = 1,
  HPDIprob = 0.68,
  fit = NULL
)
}
\arguments{
\item{model}{state space model object, returned by the function
\code{define_ssmodel}}

\item{settings}{list with model setting, in the format returned by the
function \code{initialize_settings}}

\item{data}{list with at least two named components: \code{tsm} is a multiple
time series object that contains all observation series, \code{weights}
is a named list of time series with (nominal) weights, the list names
correspond to the different groups, i.e., \code{group1, group2, subgroup1},
if present in the model}

\item{prior}{list of matrices, each list item corresponds to one endogenous
variable. See \code{initialize_prior}}

\item{R}{number of draws, the default is \code{10000}}

\item{burnin}{share of draws as burnin period, the default is \code{0.5}}

\item{thin}{thinning parameter defining how many draws are discarded.
\code{1} means no draw is discarded, \code{2} means each second draw is
kept, and so on}

\item{HPDIprob}{probability of highest posterior density interval, the
default is \code{HPDIprob = 0.68}}

\item{fit}{already fitted object of class \code{ss_fit}, to continue drawing,
see details}
}
\value{
An object of class \code{ss_fit}.
}
\description{
Estimates the parameters and states of a multi-dimensional
state space model by Bayesian methods using a Gibbs sampling procedure.
}
\details{
If \code{fit} is supplied, the function will continue drawing
\code{R} additional repetitions. In this case, all input variables except
for \code{fit} and \code{R} are ignored.
}
\examples{
data("data_ch")
settings <- initialize_settings()
data <- prepate_data(
  settings = settings,
  tsl = data_ch$tsl,
  tsl_n = data_ch$tsl_n
)
model <- define_ssmodel(
  settings = settings, 
  data = data
)
prior <- initialize_prior(
  model = model, 
  settings = settings
) 
\donttest{
fit <- estimate_ssmodel(
  model = model, 
  settings = settings, 
  data = data,
  prior = prior,
  R = 100
)
}
}
