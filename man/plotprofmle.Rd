\name{plotprofmle}

\alias{plotprofmle}

\title{Plot of log-likelihood profiles at original scale}

\description{
  Given a likelihood profile of a model (object of the class \code{profile.mle}
  or \code{profile.mle2}), plots the relative log-likelihood profiles and the
  plausibility intervals for each one of the (or selected ones) parameters of a model.
}

\usage{
plotprofmle(profobj, nseg=20, ratio=log(8), which=1:length(profobj@profile),
                        ask = prod(par("mfcol")) < length(which) && dev.interactive(), 
                        col.line="blue", varname, \dots)
}

\arguments{

  \item{profobj}{
    list of profile data; object of class \code{profile.mle} or
    \code{profile.mle2}.
  }

  \item{nseg}{
    positive integer; number of segments used by \code{spline} to
    interpolate the line of log-likelihood profile
  }

  \item{ratio}{
    real positive or NULL; log-likelihood ratio that defines the likelihood
    interval to be shown in the plot.
  }

  \item{which}{
    vector of positive integers; if a subset of profiles is required,
    the indexes of the mle's in \code{profobj} to be plotted.
  }
  
  \item{ask}{
    logical; if \code{TRUE}, the user is _ask_ed before each plot, see par(ask=.)
  }

  \item{col.line}{
    name; line color for the plausibility interval.
  }

  \item{varname}{
    vector of names; labels for the x-axis. If NULL defaults the names of
    mle's in \code{profobj}.  
  }

  \item{\dots}{further arguments to be passed to \code{plot}.}
}

\details{
  Log-likelihood profile plots are the basic diagnostic for model
  fitting by maximum likelihood methods. The profiles show the minimum of the log-likelihood function
  for a given value of a focal parameter, near the maximum likelihood
  estimate (mle) of this parameter. Profile objects in R (classes \code{profile.mle} and \code{profile.mle2})
  return transformed values of the likelihood function, which are based
  on the deviance (=minus twice log-likelihood). These
  values are called 'z' and are the signed square-root of the deviance  difference from the minimum deviance. As samples get
  larger, z-profiles tends to be symmetrical V-shaped, and are used to calculate
  confidence intervals using an approximation to the Chi-square
  distribution (see details in Bolker (2008) and in the \pkg{bbmle} vignette
  (\code{vignette('mle2',package='bbmle')}).

  In its original form (e.g. Edwards 1972), likelihood profiles do not
  use z-transformed values, and can be interpreted directly, even if they are
  asymmetric. At the scale of the log-likelihood function, all
  values of the parameters that result in a negative log-likelihood
  less or equal to a given value k are exp(k) times as plausible as
  the mle. Hence, exp(k) is a likelihood ratio, and delimits a plausibility interval (or likelihood
  interval) for the mle's. Function \code{plotprofmle} plots profiles of the
  negative log-likelihood functions, along with the limits of
  likelihood interval for a given log-likelihood \code{ratio}.
}

\references{
  Bolker, B. 2008. \emph{Ecological Models and Data in R}. Princeton:
  Princeton University Press.
  
  Edwards, A.W.F. 1972. \emph{Likelihood -- An Account of the
  Statistical Concept of Likelihood and its Application to Scientific
  Inference}. New York: Cambridge University Press.
  
  Royall, R.M. 2000. \emph{Statistical Evidence: A Likelihood Paradigm}. London: Chapman and Hall.
}

\seealso{
  \code{profile.mle.class}, \code{mle}, \code{mle-class} from
  \pkg{stats}; \code{profile.mle2.class}, \code{mle2}, \code{mle2-class}
  from \pkg{bbmle} package.
}

\examples{
birds.pln <- fitsad(birds, "poilog")
birds.pln.p <- profile(birds.pln)
par(mfrow=c(1,2))
plotprofmle(birds.pln.p)
par(mfrow=c(1,1))
}

\author{
  \enc{João}{Joao} L.F. Batista, \enc{André}{Andre} Chalom M. Oliveira,
  Paulo I. Prado \email{prado@ib.usp.br}
}

\encoding{UTF-8}
