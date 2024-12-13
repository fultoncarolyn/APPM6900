// my_model.stan
// STAN Model from getting started
data {
  int N; // number of data points
  real X[N]; // data values
}

parameters {
  real mu; // mean
  real sigma; // standard deviation
}

model {
  X ~ normal(mu, sigma);
}

