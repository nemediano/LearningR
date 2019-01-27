#Create 50 samples between -PI and PI
x <- seq(-pi, pi, len=50);
# x is a vector of 50 equally spaced values in −π ≤ x ≤ π. y is the same.
y <- x;
# f is a square matrix, with rows and columns indexed by x and y respectively, of
# values of the function cos(y)/(1 + x 2 ).
f <- outer(x, y, function(x, y) cos(y)/(1 + x^2));
# Save the plotting parameters and set the plotting region to “square”.
oldpar <- par(no.readonly = TRUE);
par(pty="s")
# Make a contour map of f; add in more lines for more detail.
contour(x, y, f)
contour(x, y, f, nlevels=15, add=TRUE)
# fa is the “asymmetric part” of f . (t() is transpose).
fa <- (f-t(f))/2;
#  Make a contour plot, . . .
contour(x, y, fa, nlevels=15)
# . . . and restore the old graphics parameters.
par(oldpar)
# Make some high density image plots, (of which you can get hardcopies if you wish),
image(x, y, f)
image(x, y, fa)
# clean up before moving
objects(); rm(x, y, f, fa, oldpar)







