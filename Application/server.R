library(ggplot2)
library(shiny)

title <- ""

genDistHist <- function(rDist, nObs, setSeed, seed) {
        if (setSeed == TRUE) {
                set.seed(seed)
        }
        else {
                set.seed(NULL)
        }
        if (rDist == "Bernouilli") {
                prob = round(runif(1), 2)
                x <- rbinom(n = nObs, size = 1, prob = prob)
                title <<- paste(rDist, "distribution with", nObs,
                                "observations and probability", prob)
        } else if (rDist == "Binomial") {
                size <- round(runif(1, min = 1, max = 10), 0)
                prob = round(runif(1), 2)
                x <- rbinom(n = nObs, size = size, prob = prob)
                title <<- paste(rDist, "distribution with", nObs,
                                "observations,", size, "trials and probability", prob)
        } else if (rDist == "Chi-Squared") {
                df <- round(runif(1, min = 1, max = nObs), 0)
                x <- rchisq(n = nObs, df = df)
                title <<- paste(rDist, "distribution with", nObs,
                                "observations and", df, "degrees of freedom")
        } else if (rDist == "Exponential") {
                x <- rexp(n = nObs)
                title <<- paste(rDist, "distribution with", nObs,
                                "observations")
        } else if (rDist == "Geometric") {
                prob = round(runif(1), 2)
                x <- rgeom(n = nObs, prob = prob)
                title <<- paste(rDist, "distribution with", nObs,
                                "observations and probability", prob)
        } else if (rDist == "Logistic") {
                x <- rlogis(n = nObs)
                title <<- paste(rDist, "distribution with", nObs,
                                "observations")
        } else if (rDist == "Log Normal") {
                x <- rlnorm(n = nObs)
                title <<- paste(rDist, "distribution with", nObs,
                                "observations")
        } else if (rDist == "Negative Binomial") {
                size <- round(runif(1, min = 1, max = 10), 0)
                prob = round(runif(1), 2)
                x <- rnbinom(n = nObs, size = size, prob = prob)
                title <<- paste(rDist, "distribution with", nObs,
                                "observations,", size, "trials and probability", prob)
        } else if (rDist == "Normal") {
                mean <- round(runif(1, min = -1 * nObs, max = nObs), 2)
                sd <- round(runif(1, min = 1, max = 10), 2)
                x <- rnorm(n = nObs, mean = mean, sd = sd)
                title <<- paste(rDist, "distribution with", nObs,
                                "observations, mean", mean, "and sd", sd)
        } else if (rDist == "Poisson") {
                lambda <- round(runif(1, min = 1, max = nObs), 0)
                x <- rpois(n = nObs, lambda = lambda)
                title <<- paste(rDist, "distribution with", nObs,
                                "observations and lambda", lambda)
        } else if (rDist == "Student t") {
                df <- round(runif(1, min = 1, max = nObs), 0)
                x <- rt(n = nObs, df = df)
                title <<- paste(rDist, "distribution with", nObs,
                                "observations and", df, "degrees of freedom")
        } else if (rDist == "Uniform") {
                x <- runif(n = nObs)
                title <<- paste(rDist, "distribution with", nObs,
                                "observations")
        }
        x
}

plotDistHist <- function(x) {
        data <- as.data.frame(x)
        g <- ggplot(data, aes(x = x)) +
                geom_histogram(aes(y = ..density.., fill = ..density..),
                               binwidth = max(0.1, diff(range(x)) / (30 * log10(length(x))))) +
                geom_density(colour = "orangered") +
                geom_vline(xintercept = mean(data$x), colour = "orangered", linetype = "solid") +
                ggtitle(title) +
                theme_bw()
        g
}

plotScatterWithModel <- function(rDist, x) {
        index <- 1:length(x)
        data <- as.data.frame(index)
        data <- cbind(data, x)
        g <- ggplot(data, aes(index, x)) +
                geom_point(col = "orangered") +
                stat_smooth(method = "auto") +
                ggtitle(paste("Scatter plot for", rDist, "distribution with fitted model")) +
                theme_bw()
        g
}

shinyServer(function(input, output) {
        data <- reactive({
                input$applyButton
                isolate(return(genDistHist(input$rDist, input$nObs, input$setSeed, input$seed)))
        })
        output$distHist <- renderPlot({
                plotDistHist(data())
        })
        output$summary <- renderPrint({
                summary(data())
        })
        output$scatterWithModel <- renderPlot({
                suppressMessages(plotScatterWithModel(input$rDist, data()))
        })
})
