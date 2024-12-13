// schoolmodel.stan
data {
  int<lower=0> J; // number of schools
  vector[J] y; // observed treatment effect
  vector<lower=0>[J] sigma; // uncertainty of y
}

parameters {
  vector[J] theta; // true treatment effect
  real mu; // pop treatment effect
  real<lower=0> tau; // pop scale
}

model {
  // hyper priors
  mu ~ normal(0,5);
  tau ~cauchy(0,5);
  
  theta ~normal(mu,tau);
  
  //likelihood funct 
  y ~ normal(theta, sigma);
}

