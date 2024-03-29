% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/AlgoParamsDEVI.R
\name{AlgoParamsDEVI}
\alias{AlgoParamsDEVI}
\title{AlgoParamsDEVI}
\usage{
AlgoParamsDEVI(
  n_params,
  param_names = NULL,
  n_chains = NULL,
  n_iter = 1000,
  init_sd = 0.01,
  init_center = 0,
  n_cores_use = 1,
  step_size = NULL,
  jitter_size = 1e-06,
  parallel_type = "none",
  use_QMC = TRUE,
  purify = NULL,
  quasi_rand_seq = "halton",
  n_samples_ELBO = 10,
  LRVB_correction = TRUE,
  n_samples_LRVB = 25,
  neg_inf = -750,
  thin = 1,
  burnin = 0,
  return_trace = FALSE,
  crossover_rate = 1
)
}
\arguments{
\item{n_params}{number of free parameters estimated}

\item{param_names}{optional vector of parameter names}

\item{n_chains}{number of particle chains used for optimization, 3*n_params is the default value}

\item{n_iter}{number of iterations to run the sampling algorithm, 1000 is default}

\item{init_sd}{positive scalar or n_params-dimensional numeric vector, determines the standard deviation of the Gaussian initialization distribution}

\item{init_center}{scalar or n_params-dimensional numeric vector, determines the mean of the Gaussian initialization distribution}

\item{n_cores_use}{number of cores used when using parallelization.}

\item{step_size}{positive scalar, jump size in DE crossover step, default is 2.38/sqrt(2*n_params).}

\item{jitter_size}{positive scalar, noise is added during crossover step from Uniform(-jitter_size,jitter_size) distribution. 1e-6 is the default value.}

\item{parallel_type}{string specifying parallelization type. 'none','FORK', or 'PSOCK' are valid values. 'none' is default value.}

\item{use_QMC}{logical, if true, a quasi-Monte Carlo estimator is used to estimate ELBO during optimization. default is TRUE.}

\item{purify}{an integer, every 'purify'-th iteration, the Monte Carlo estimator of the ELBO is recalculated. This can help deal with noisy and outlier estimates of the ELBO. Default value is 25. If use_QMC is TRUE, purification is disabled as it is redundant.}

\item{quasi_rand_seq}{type of low discrepancy sequence used for quasi Monte Carlo integration, either 'sobol' or 'halton'. LRVB correction always use QMC. Default is 'sobol'.}

\item{n_samples_ELBO}{number of samples used for the Monte Carlo estimator of the ELBO (the objective function). default is 10.}

\item{LRVB_correction}{logical, if true, LRVB covariance correction (Giordano, Brodderick, & Jordan 2018; Galdo, Bahg, & Turner 2020) is attempted.}

\item{n_samples_LRVB}{number of samples used for LRVB correction. default is 25.}

\item{neg_inf}{if density for a given value of theta is numerically 0 for q, this value is assigned for log density. This helps with numeric stability of algorithm. Default value is -750.}

\item{thin}{positive integer, only every 'thin'-th iteration will be stored. Default value is 1. Increasing thin will reduce the memory required, while running algorithm for longer.}

\item{burnin}{number of initial iterations to discard. Default value is 0.}

\item{return_trace}{logical, if true, function returns particle trajectories. This is helpful for diagnosing convergence or debugging model code. Function will return an iteration/thin $x$ n_chains $x$ n_params array and the estimated ELBO of each particle in a iteration/thin x n_chains array.}

\item{crossover_rate}{number on the interval (0,1]. Determines the probability a parameter on a chain is updated on a given crossover step, sampled from a Bernoulli distribution.}
}
\value{
list of control parameters for the DEVI function
}
\description{
get control parameters for DEVI function
}
