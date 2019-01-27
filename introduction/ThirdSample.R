# Get the path to the data file
filepath <- system.file("data", "morley.tab" , package="datasets"); 
#file.show(filepath) # Optional show the contents of the file
# Read in the Michelson data as a data frame, and look at it.
mm <- read.table(filepath);
# Change Expt and Run into factors.
mm$Expt <- factor(mm$Expt);
mm$Run <- factor(mm$Run);
# Make the data frame visible at position 3 (the default)
attach(mm);
# Compare the five experiments with simple boxplots.
plot(Expt, Speed, main="Speed of Light Data", xlab="Experiment No.");
# Analyze as a randomized block, with ‘runs’ and ‘experiments’ as factors.
fm <- aov(Speed ~ Run + Expt, data=mm);
summary(fm);
# Fit the sub-model omitting ‘runs’, and compare using a formal analysis of variance.
fm0 <- update(fm, . ~ . - Run);
anova(fm0, fm)
# Clean up before moving
detach()
rm(fm, fm0, mm)


