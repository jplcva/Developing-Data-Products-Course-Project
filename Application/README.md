Developing-Data-Products-Course-Project
=======================================

### Introduction

This is the shiny application for the Course Project for Developing Data Products on Coursera. This simple application consists of 2 files, the `server.R` for the data processing and `ui.R` for the user interface. Its purpose is to illustrate random distributions using the R random generating numbers functions.

---

### User Interface

The user interface where data input is required, is composed of 5 widgets described hereafter:

* **Choose distribution**: a shiny `Select box` allowing to choose between 12 different R random generating numbers distribution functions.
* **Number of observations**: a shiny `Numeric input` allowing to enter the number of numbers to sample, This number is initialized to 1,000 and accepts values between 1 and 100,000, with an increment of 1.
* **Set seed**: a shiny `Single checkbox` allowing to specify whether a seed value to be entered in the next field is to be taken into account in the random generating process.
* `<seed value>`: a shiny `Numeric input` without label, associated to the shiny `Single checkbox`, allowing to enter the seed value. This value is initialized to 0, is incremented by 1 with no lower or upper limits.
* **Apply**: a shiny `Action button` allowing to restrict the reactivity of the page, in order for the user to enter the required values for the random distribution to be generated, before hitting `Apply`to get the results.

---


### Server Calculations

The available random distributions functions are:

1. **Bernouilli**: a call to `rbinom()` is done with `n` given observations, `size = 1` and `prob`a randomly generated probability between `0` and `1`.
2. **Binomial**: a call to `rbinom()` is done with `n` given observations, and random `size` between `1` and `10`, and `prob`a randomly generated probability between `0` and `1`.
3. **Chi-Squared**: a call to `rchisq()` is done with `n` given observations, and `df` degrees of freedom randomly generated between `0` and `n` observations.
4. **Exponential**: a call to `rexp()` is done with `n` given observations.
5. **Geometric**: a call to `rgeom()` is done with `n` given observations, and `prob`a randomly generated probability between `0` and `1`.
6. **Logistic**: a call to `rlogis()` is done with `n` given observations.
7. **Log Normal**: a call to `rlnorm()` is done with `n` given observations.
8. **Negative Binomial**: a call to `rnbinom()` is done with `n` given observations, and random `size` between `1` and `10`, and `prob`a randomly generated probability between `0` and `1`.
9. **Normal**: a call to `rnorm()` is done with `n`observations, a randomly generated `mean` between `-n` and `n`, and random `sd` between `1` and `10`.
10. **Poisson**: a call to `rpois()` is done with `n` given observations, and rate `lambda` randomly generated between `0` and `n` observations.
11. **Student t**: a call to `rt()` is done with `n` given observations, and `df` degrees of freedom randomly generated between `0` and `n` observations.
12. **Uniform**: a call to `runif()` is done with `n` given observations.

---


### Results

The generated results are displayed on the right side of the shiny form, in a tabset panel constituted of 3 tab panels:

* **Plot**: This tab panel shows the `ggplot2` histogram of the randomly generated numbers. The graph's title displays the parameters used for the numbers' generation.
* **Summary**: This tab panel shows the summary of the generated data sample, with a call to `summary()`.
* **Model**: This tab panel shows a `ggplot2` scatter plot of the randomly generated numbers according to their index on X-axis, and value on the Y-axis. The plot includes a smoother with a call to `stat_smooth()` and the `method` parameter set to `auto`, in order to fit a generalized additive model (GAM) to the data.
