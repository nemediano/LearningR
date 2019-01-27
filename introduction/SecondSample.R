#Second sample (Apendix A)
x <- 1:20;  # Make x the secuence form 1 to 20 
w <- 1 + sqrt(x) / 2; # A weight vetor of standar deviations
dummy <- data.frame(x=x, y= x + rnorm(x) * w); # Make a data frame of two columns, x and y, and look at it.
fm <- lm(y ~ x, data = dummy); # Fit a simple linear regression with y to the left of the tilde, we are modelling y dependent on x
summary(fm); #  and look at the analysis. 
fm1 <- lm(y ~ x, data = dummy, weights = 1 / w^2); # Since we know the standard deviations, we can do a weighted regression.
attach(dummy); # Make the columns in the data frame visible as variables.
summary(fm1); # Since we know the standard deviations, we can do a weighted regression.
lrf <- lowess(x, y); # Make a nonparametric local regression function.
plot(x, y); # Standard point plot.
lines(x, lrf$y); # Add in the local regression.
abline(0, 1, lty=3); # The true regression line: (intercept 0, slope 1).
abline(coef(fm)); # Unweighted regression line.
abline(coef(fm1), col = "red") # Weighted regression line.
detach(); #Remove data frame from the search path
plot(fitted(fm), resid(fm),
     xlab="Fitted values",
     ylab="Residuals",
     main="Residuals vs Fitted");
# A standard regression diagnostic plot to check for heteroscedasticity. Can you see it?
qqnorm(resid(fm), main="Residuals Rankit Plot"); 
# A normal scores plot to check for skewness, kurtosis and outliers. (Not very useful here.)
rm(fm, fm1, lrf, x, w, dummy);




