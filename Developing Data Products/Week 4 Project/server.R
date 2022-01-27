library(shiny)
shinyServer(function(input, output) {
  output$histPlot <- renderPlot({
    x    <- mtcars$mpg  
    bins <- seq(min(x), max(x), length.out = input$bins + 1)
    hist(x, breaks = bins, col = 'green', border = 'black', xlab = "MPG", main = "MPG Dataset")
    if (input$showmeanstd){
      abline(v = mean(x), col = "red", lwd = 2)
      abline(v = c(mean(x) - sd(x), mean(x) + sd(x)), col = "orange", lwd = 3, lty = 2)
    }
  })
  model_lm <- lm(hp~mpg, data = mtcars)
  model_lm_pred <- reactive({
    mpgInput <- input$sliderMPG
    predict(model_lm, newdata = data.frame(mpg = mpgInput))
  })
  output$lmplot <- renderPlot({
    mpgInput <- input$sliderMPG
    plot(mtcars$mpg, mtcars$hp, xlab = "Miles Per Gallon", ylab = "Horsepower", main = "MPG Prediction Model")
    if (input$showmodel){
      abline(model_lm, col = "red", lwd = 2)}
    points(mpgInput, model_lm_pred(), col = "blue", pch = 16, cex = 2)
  })
  output$pred <- renderText({
    model_lm_pred()})
})
