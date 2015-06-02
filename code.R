library(ggplot2)
library(plyr)
data(mtcars)
head(mtcars)
?mtcars
ggplot(data=mtcars, aes(x=am, y=mpg)) +
        geom_boxplot(aes(group=am, color=factor(am))) #, notch=T)

ls1 <- lm(mpg~am, data=mtcars)
summary(ls1)
ls2 <- lm(mpg~am + gear,data=mtcars)
summary(ls2)

carsM <- subset(mtcars, subset=am==1, select=mpg)
carsA <- subset(mtcars, subset=am==0, select=mpg)
t.test(carsM, carsA)
ggplot(data=NULL, aes(x=am, y=resid(ls))) +
        geom_violin() +

ggplot(data=NULL, aes(x=am, y=resid(ls))) +
        geom_violin(aes(group=factor(am))) +
        geom_point(aes(color=factor(gear)), size=3)

ggplot(data=mtcars, aes(x=am, y=mpg)) +
        geom_boxplot(aes(fill=factor(am))) +
        scale_fill_grey(start = 0.5, end = 0.8) +
        geom_point(aes(color=factor(gear), size=3))


cor(am, resid(ls))
attach(mtcars)
cor(am, mpg)
cor(am, mpg)^2
apply(mtcars[c("mpg","am")],2, summary)
ls
ddply(mtcars, "am", function(x) mean(x$mpg))
predict(ls, newdata=data.frame(am=0), interval = "confidence")

library(caret)
head
!(names(mtcars) %in% "mpg")
featurePlot(x=mtcars[,!(names(mtcars) == "mpg")], y=mtcars[,"mpg"])

lsPartial <- lm(mpg~am+wt+qsec, data=mtcars)
summary(lsPartial)

require(MASS)
lsTotal <- lm(mpg~., data=mtcars)
summary(lsTotal)
mean(resid(lsTotal))
lsTotalStep <- stepAIC(lsTotal, trace=F)
summary(lsTotalStep)
mean(resid(lsTotalStep))
predict(lsPartial, newdata=data.frame(am=1, wt=0, qsec=0), interval="confidence")
predict(lsPartial, newdata=data.frame(am=1, wt=0, qsec=0), interval="prediction")

# goodness of fit

(rmse <- sqrt(mean(lsPartial$resid^2)))
summary(lsPartial)
R2(lsPartial$fit, mtcars$mpg)
RMSE(lsPartial$fit, mtcars$mpg)

# Diagnostics
library(car)
fit <- lm(mpg~am+wt+qsec, data=mtcars)
outlierTest(fit)
qqPlot(fit, main="QQ Plot") # good
leveragePlots(fit)
av.Plots(fit)
cutoff <- 4/((nrow(mtcars)-length(fit$coefficients)-2)) 
plot(fit, which=4, cook.levels=cutoff)
influencePlot(fit, id.method="identify", main="Influence Plot", sub="Circle size is proportial to Cook's Distance" )
qqPlot(ls, main="QQ Plot")
library(MASS)
sresid <- studres(fit) 
hist(sresid, freq=FALSE, 
     main="Distribution of Studentized Residuals")
hist(resid(ls))
ncvTest(ls)
spreadLevelPlot(fit)
vif(fit)
sqrt(vif(fit)) > 2
crPlots(fit)
durbinWatsonTest(fit)
library(gvlma)
gvmodel <- gvlma(fit) 
summary(gvmodel)
summary(gvlma(ls))
