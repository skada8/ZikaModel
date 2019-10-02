
<!-- README.md is generated from README.Rmd. Please edit that file -->
ZikaModel
=========

<!-- badges: start -->
[![Travis build status](https://travis-ci.org/mrc-ide/zika-transmission-model.svg?branch=master)](https://travis-ci.org/mrc-ide/zika-transmission-model) <!-- badges: end -->

`ZikaModel` is an R package for running the Zika transmission model developed at Imperial College London using R odin.

The transmission model is a metapopulation model which includes the dynamics of the *Aedes* mosquito vector and the age-stratified human host populations. The model which has a stochastic and a deterministic version, simulates also the impact of seasonality and control strategies, such as the release of Wolbachia-infected mosquitoes and child vaccinationon, on virus dynamics .

For details of the original transmission model please see the [Ferguson et al. 2016 paper](https://science.sciencemag.org/content/353/6297/353) which is the article where the model is published.

Installation
------------

You need to first install the [odin](https://github.com/mrc-ide/odin) R package.

Once odin is installed, you can install the `ZikaModel` package with the following steps:

-   First install `devtools`, if you don't already have it

``` r
install.packages("devtools")
library(devtools)
```

-   Then, in a fresh R session, install the `ZikaModel` package

``` r
devtools::install_github("mrc-ide/ZikaModel")
```

-   Load and attach it

``` r
library(ZikaModel)
```

Running the base model
----------------------

To run the deterministic version of the model, without seasonality and interventions, you can do the following:

``` r
# create a vector of human age groups 
age_init <- c(1, 9, 10, 10, 10, 10, 10, 10, 10, 10, 10)
  
# create a vector of human mortality rates 
deathrt <- c(1e-10, 
             1e-10, 
             1e-10, 
             0.00277068683332695, 
             0.0210680857689784,
             0.026724997685722,
             0.0525354529367476,
             0.0668013582441452,
             0.119271483740379,
             0.279105747097929,
             0.390197266957464)
             
# provide the length of time (in days) that you want to run the model for
time_frame <- 364 * 50

# run the model
model_run <- ZikaModel::run_model(agec = age_init,
                                  death = deathrt,
                                  nn_links,
                                  time = time_frame)

model_run$plot
```

<img src="man/figures/README-unnamed-chunk-5-1.png" width="100%" />

Seasonality
-----------

The model allows to account for the effect of seasonal variations in climatic variables (e.g. temperature and precipitation) on Zika transmission dynamics. In the model, seasonality affects:

-   adult mosquitoes mortality;
-   mosquito larvae carrying capacity;
-   Extrinsic Incubation Period.

A deterministic model which includes the effect of seasonality can be implemented with the following:

``` r
seasonal_model_run <- ZikaModel::run_model(agec = age_init,
                                           death = deathrt,
                                           nn_links,
                                           time = time_frame,
                                           season = TRUE)
seasonal_model_run$plot
```

<img src="man/figures/README-unnamed-chunk-6-1.png" width="100%" />
