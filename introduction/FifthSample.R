# R can do complex arithmetic, also.
th <- seq(-pi, pi, len=100);
# 1i is used for the complex number i.
z <- exp(1i*th);
# Plotting complex arguments means plot imaginary versus real parts. This should be a circle.
par(pty="s")
plot(z, type="l")
# Suppose we want to sample points within the unit circle. One method would be to
# take complex numbers with standard normal real and imaginary parts . . .
w <- rnorm(100) + rnorm(100)*1i;
# and to map any outside the circle onto their reciprocal.
w <- ifelse(Mod(w) > 1, 1/w, w);
# All points are inside the unit circle, but the distribution is not uniform.
plot(w, xlim=c(-1,1), ylim=c(-1,1), pch="+",xlab="x", ylab="y")
lines(z) 
# The second method uses the uniform distribution. The points should now look more
# evenly spaced over the disc.
w <- sqrt(runif(100))*exp(2*pi*runif(100)*1i);
plot(w, xlim=c(-1,1), ylim=c(-1,1), pch="+", xlab="x", ylab="y")
lines(z)
# Clean up again
rm(th, w, z);




