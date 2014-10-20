library(shiny)

shinyUI(pageWithSidebar(
        headerPanel(h2("Random Distributions")),
        sidebarPanel(
                selectInput(inputId = "rDist", label = "Choose distribution",
                            choices = c("Bernouilli",
                                        "Binomial",
                                        "Chi-Squared",
                                        "Exponential",
                                        "Geometric",
                                        "Logistic",
                                        "Log Normal",
                                        "Negative Binomial",
                                        "Normal",
                                        "Poisson",
                                        "Student t",
                                        "Uniform")),
                numericInput(inputId = "nObs", label = "Number of observations:",
                             value = 1000, min = 1, max = 100000, step = 1),
                checkboxInput(inputId = "setSeed", label = "Set seed", value = FALSE),
                numericInput(inputId = "seed", label = "", value = 0),
                actionButton(inputId = "applyButton", label = "Apply")
        ),
        mainPanel(
                tabsetPanel(id = "tabset", type = "tabs", selected = NULL,
                            tabPanel("Plot", plotOutput("distHist")),
                            tabPanel("Summary", verbatimTextOutput("summary")),
                            tabPanel("Model", plotOutput("scatterWithModel"))
                )
        )
))
