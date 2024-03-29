% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ss_model.R
\name{define_ssmodel}
\alias{define_ssmodel}
\title{State space model}
\usage{
define_ssmodel(settings, data)
}
\arguments{
\item{settings}{list with model setting, in the format returned by the
function \code{initialize_settings}}

\item{data}{list with at least two named components: \code{tsm} is a multiple
time series object that contains all observation series, \code{weights}
is a named list of time series with (nominal) weights, the list names
correspond to the different groups, i.e., \code{group1, group2, subgroup1},
if present in the model}
}
\value{
A state space model object of class \code{ss_model}, which consists
of an object returned by the function \code{SSModel} of
the package \code{KFAS} and in addition a list item called \code{names}
which contains information on the parameters to be estimated.
}
\description{
Defines a state space model for the provided settings and data.
}
\details{
\code{data} is preferably the output of funtion \code{prepare_data}.
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
}
