% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/bayes_gibbs_steps.R
\name{draw_variance_scalar}
\alias{draw_variance_scalar}
\title{Draws a variance from an inverse Wishart distribution.}
\usage{
draw_variance_scalar(Y, nu, s)
}
\arguments{
\item{Y}{dependent variable}

\item{nu}{degrees of freedom, \code{nu>p-1}}

\item{s}{scale matrix, \code{p x p}}
}
\value{
A named vector of drawn parameters.
}
\description{
Draws a variance from an inverse Wishart distribution.
}
\details{
The mean is given by \code{s / (nu+p-1)} for \code{nu>p+1}.
}
\keyword{internal}
