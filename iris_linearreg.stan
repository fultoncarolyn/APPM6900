// iris_linearreg.stan
// Linear regression w Stan

data {
  int<lower=0> N; // number of data points
  vector[N] x; // covariates (independent)
  vector[N] y; // variates (dependent)
}

parameters {
  real alpha; // linear intercept
  real beta; // linear slope
  real<lower=0> sigma; // scatter
}

model {
  // Introduce priors
  alpha ~ normal(0,10);
  beta ~ normal(0,10);
  sigma ~ normal(0,1);
  
  // linear regression
  y ~ normal(alpha + beta * x, sigma); // likelihood funct
}

// Added after initial plots
// Simulated data for refit

generated quantities {
  vector[N] y_sim; // sim from posterior
  
  for(i in 1:N)
    y_sim[i] = normal_rng(alpha + beta *x[i], sigma);
}

