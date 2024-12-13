// schoolmodel.stan
data {
  int<lower=0> J; // number of schools
  vector[J] y; // observed treatment effect
  vector<lower=0>[J] sigma; // uncertainty of y
}

parameters {
  real mu; // pop treatment effect
  real<lower=0> tau; // pop scale
  vector[J] eta; // unscaled deviation from mu by school
}

transformed parameters {
  vector[J] theta; // true treatment effect
  theta = mu + tau * eta;
}

model {
  // hyper priors
  mu ~ normal(0,5);
  tau ~cauchy(0,5);
  eta ~ normal(0,1);
  
  //likelihood funct 
  y ~ normal(theta, sigma);
}

