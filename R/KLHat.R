#' KLHat
#' @description returns a monte carlo or quasi-monte carlo estimate of KL divergence up to a constant (negative ELBO).
#' @param lambda samples of theta from approximating distribution Q
#' @param LogPostLike  log posterior likelihood function
#' @param S number of samples to use for the approximation
#' @param control_pars list of algo control parameters
#' @param ... additional parameters for LogPostLike
#' @noRd
KLHat=function(lambda,LogPostLike,control_pars,S,...){
  # monte carlo approximation KL divergence up to a constant

  out=0 #initalize output vector

  # sample from q
  theta_mat <- QSample(use_lambda=lambda,control_pars,S)

  # calc mean differences in log densities for theta_mat
  q_log_density=QLog(theta_mat,use_lambda = lambda,control_pars,S)
  post_log_density=mean(apply(matrix(theta_mat,ncol=control_pars$n_pars_model,byrow = T),MARGIN = 1,FUN=LogPostLike,...))
  out <- q_log_density-post_log_density


  return(out)
}