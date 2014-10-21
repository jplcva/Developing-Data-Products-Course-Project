---
title       : Developing Data Products Course Project
subtitle    : Random Distributions
author      : jplcva
job         : Data Science Specialization
logo        : jplcva.png
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : [bootstrap, quiz, shiny, interactive]
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---

## Concept

1. Develop a Shiny application hosted on [ShinyApps.io](https://www.shinyapps.io/) from RStudio
2. Publish the Shiny application on [ShinyApps.io Account](https://jplcva.shinyapps.io/Developing-Data-Products-Course-Project/)
3. Illustrate random distributions using a subset of R random generating numbers functions
4. Allow data entry of parameters from the user interface to select the distribution
5. Retrieve generated plots and summaries from the server

--- .class #id 


## User Interface

The user interface where data input is required, is composed of 5 widgets:

* **Choose distribution**: 12 different R random generating numbers distribution functions.
* **Number of observations**: the number of numbers to sample.
* **Set seed**: specify whether a seed value to be entered in the next field.
* `<seed value>`: the seed value.
* **Apply**: enter the required values, before hitting `Apply` to get the results.

<div class="row-fluid">
  <div class="span4">
    <form class="well">
      <label class="control-label" for="rDist">Choose distribution</label>
      <select id="rDist"><option value="Bernouilli" selected>Bernouilli</option>
<option value="Binomial">Binomial</option>
<option value="Chi-Squared">Chi-Squared</option>
<option value="Exponential">Exponential</option>
<option value="Geometric">Geometric</option>
<option value="Logistic">Logistic</option>
<option value="Log Normal">Log Normal</option>
<option value="Negative Binomial">Negative Binomial</option>
<option value="Normal">Normal</option>
<option value="Poisson">Poisson</option>
<option value="Student t">Student t</option>
<option value="Uniform">Uniform</option></select>
      <script type="application/json" data-for="rDist" data-nonempty="">{}</script>
      <label for="nObs">Number of observations:</label>
      <input id="nObs" type="number" value="1000" min="1" max="1e+05" step="1"/>
      <label class="checkbox" for="setSeed">
        <input id="setSeed" type="checkbox"/>
        <span>Set seed</span>
      </label>
      <label for="seed"></label>
      <input id="seed" type="number" value="0"/>
      <button id="applyButton" type="button" class="btn action-button">Apply</button>
    </form>
  </div>
  <div class="span8">
    <div class="tabbable tabs-above">
      <ul class="nav nav-tabs shiny-tab-input" id="tabset">
        <li class="active">
          <a href="#tab-4485-1" data-toggle="tab">Plot</a>
        </li>
        <li>
          <a href="#tab-4485-2" data-toggle="tab">Summary</a>
        </li>
        <li>
          <a href="#tab-4485-3" data-toggle="tab">Model</a>
        </li>
        <li>
          <a href="#tab-4485-4" data-toggle="tab">About</a>
        </li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane active" id="tab-4485-1"></div>
        <div class="tab-pane" id="tab-4485-2"></div>
        <div class="tab-pane" id="tab-4485-3"></div>
        <div class="tab-pane" id="tab-4485-4"></div>
      </div>
    </div>
  </div>
</div>

--- .class #id


## Server

<table>
 <thead>
  <tr>
   <th style="text-align:left;"> Distribution </th>
   <th style="text-align:left;"> R Call </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> Bernouilli </td>
   <td style="text-align:left;"> rbinom(n = nObs, size = 1, prob = prob) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Binomial </td>
   <td style="text-align:left;"> rbinom(n = nObs, size = size, prob = prob) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Chi-Squared </td>
   <td style="text-align:left;"> rchisq(n = nObs, df = df) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Exponential </td>
   <td style="text-align:left;"> rexp(n = nObs) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Geometric </td>
   <td style="text-align:left;"> rgeom(n = nObs, prob = prob) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Logistic </td>
   <td style="text-align:left;"> rlogis(n = nObs) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Log Normal </td>
   <td style="text-align:left;"> rlnorm(n = nObs) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Negative Binomial </td>
   <td style="text-align:left;"> rnbinom(n = nObs, size = size, prob = prob) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Normal </td>
   <td style="text-align:left;"> rnorm(n = nObs, mean = mean, sd = sd) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Poisson </td>
   <td style="text-align:left;"> rpois(n = nObs, lambda = lambda) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Student t </td>
   <td style="text-align:left;"> rt(n = nObs, df = df) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Uniform </td>
   <td style="text-align:left;"> runif(n = nObs) </td>
  </tr>
</tbody>
</table>

--- .class #id


## Example

<img src="assets/fig/unnamed-chunk-3-1.png" title="plot of chunk unnamed-chunk-3" alt="plot of chunk unnamed-chunk-3" style="display: block; margin: auto;" />
