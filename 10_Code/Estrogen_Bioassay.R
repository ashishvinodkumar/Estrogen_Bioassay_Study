rm(list = ls())
library(arm)
library(pROC)
library(e1071)
library(caret)
library(ggplot2)
require(gridExtra)
library(grid)
library(rms)
library(stargazer)
library(lme4)
library(stringr)
require(dplyr)
library(dplyr)
library(lme4)
require(tab)
library(sjPlot)
library(rstudioapi)
current_path = rstudioapi::getActiveDocumentContext()$path 
setwd(dirname(current_path ))
print( getwd() )


### Data Pre-Processing.
assay <- read.table("../00_Data/bioassay.txt",header=T, na.strings = c("NA","."))
assay$lab_f <- factor(assay$lab)
assay$group_f <- factor(assay$group)
assay$protocol_f <- factor(assay$protocol)
assay$log_uterus <- log(assay$uterus)
# Remove missing data.
assay <- na.omit(assay)


summary(assay)


### EDA.
ggplot(assay,aes(uterus)) +
  geom_histogram(aes(y=..density..),color="black",linetype="dashed",
                 fill=rainbow(15),bins=15) + theme(legend.position="none") +
  geom_density(alpha=.25, fill="lightblue") + scale_fill_brewer(palette="Blues") +
  labs(title="Distribution of Uterus weights",y="uterus") + theme_classic()


ggplot(assay,aes(log_uterus)) +
  geom_histogram(aes(y=..density..),color="black",linetype="dashed",
                 fill=rainbow(15),bins=15) + theme(legend.position="none") +
  geom_density(alpha=.25, fill="lightblue") + scale_fill_brewer(palette="Blues") +
  labs(title="Distribution of Uterus weights",y="uterus") + theme_classic()


ggplot(assay,aes(sqrt(uterus))) +
  geom_histogram(aes(y=..density..),color="black",linetype="dashed",
                 fill=rainbow(15),bins=15) + theme(legend.position="none") +
  geom_density(alpha=.25, fill="lightblue") + scale_fill_brewer(palette="Blues") +
  labs(title="Distribution of Uterus weights",y="uterus") + theme_classic()




ggplot(assay,
       aes(x=group_f, y=EE, fill=group_f)) +
  geom_boxplot() +
  labs(title="EE levels by group",
       x="Group",y="EE") + theme_classic() +
  theme(legend.position="none",axis.text.x = element_text(angle = 90))


ggplot(assay,
       aes(x=group_f, y=ZM, fill=group_f)) +
  geom_boxplot() +
  labs(title="ZM levels by group",
       x="Group",y="ZM") + theme_classic() +
  theme(legend.position="none",axis.text.x = element_text(angle = 90))



ggplot(assay,
       aes(x=group_f, y=log_uterus, fill=group_f)) +
  geom_boxplot() +
  labs(title="log_uterus levels by group",
       x="Group",y="log_uterus") + theme_classic() +
  theme(legend.position="none",axis.text.x = element_text(angle = 90))



ggplot(assay,
       aes(x=group_f, y=log_uterus, fill=group_f)) +
  geom_boxplot() +
  labs(title="log_uterus levels by group",
       x="Group",y="log_uterus") + theme_classic() +
  theme(legend.position="none",axis.text.x = element_text(angle = 90))


ggplot(assay,
       aes(x=protocol_f, y=log_uterus, fill=protocol_f)) +
  geom_boxplot() +
  labs(title="log_uterus levels by protocol_f",
       x="protocol_f",y="log_uterus") + theme_classic() +
  theme(legend.position="none",axis.text.x = element_text(angle = 90))


ggplot(assay,
       aes(x=lab_f, y=log_uterus, fill=lab_f)) +
  geom_boxplot() +
  labs(title="log_uterus levels by lab_f",
       x="lab_f",y="log_uterus") + theme_classic() +
  theme(legend.position="none",axis.text.x = element_text(angle = 90))


plot(x=assay$weight, y=assay$log_uterus)

ggplot(assay,
       aes(x=protocol_f, y=weight, fill=protocol_f)) +
  geom_boxplot() +
  labs(title="weight levels by protocol_f",
       x="protocol_f",y="weight") + theme_classic() +
  theme(legend.position="none",axis.text.x = element_text(angle = 90))



ggplot(assay,
       aes(x=protocol_f, y=weight, fill=protocol_f)) +
  geom_boxplot() +
  labs(title="weight vs protocol_f") + theme_classic() +
  theme(legend.position="none",axis.text.x = element_text(angle = 90))



######
# Interactions

ggplot(assay,aes(x=protocol_f, y=log_uterus, fill=protocol_f)) +
  geom_boxplot() + coord_flip() +
  scale_fill_brewer(palette="Reds") +
  labs(title="log uterus vs protocol:lab_f") +
  theme_classic() + theme(legend.position="none") +
  #scale_x_discrete(labels=c(“0” = “No”,“1” = “Yes”)) +
  facet_wrap( ~ lab_f)



ggplot(assay,aes(x=EE, y=log_uterus)) +
  geom_point(alpha = .5,colour="blue4") +
  geom_smooth(method="lm",col="red3") + theme_classic() +
  labs(title="log_uterus vs EE:lab") +
  facet_wrap( ~ lab_f)



ggplot(assay,aes(x=weight, y=log_uterus)) +
  geom_point(alpha = .5,colour="blue4") +
  geom_smooth(method="lm",col="red3") + theme_classic() +
  labs(title="log_uterus vs lab_f:weight") +
  facet_wrap( ~ lab_f)




ggplot(assay,aes(x=weight, y=log_uterus)) +
  geom_point(alpha = .5,colour="blue4") +
  geom_smooth(method="lm",col="red3") + theme_classic() +
  labs(title="log_uterus vs protocol_f:weight") +
  facet_wrap( ~ protocol_f)


ggplot(assay,aes(x=EE, y=log_uterus)) +
  geom_point(alpha = .5,colour="blue4") +
  geom_smooth(method="lm",col="red3") + theme_classic() +
  labs(title="log_uterus vs protocol_f:EE") +
  facet_wrap( ~ protocol_f)


ggplot(assay,aes(x=ZM, y=log_uterus)) +
  geom_point(alpha = .5,colour="blue4") +
  geom_smooth(method="lm",col="red3") + theme_classic() +
  labs(title="log_uterus vs protocol_f:ZM") +
  facet_wrap( ~ protocol_f)



ggplot(assay,aes(x=protocol_f, y=log_uterus, fill=protocol_f)) +
  geom_boxplot() + #coord_flip() +
  scale_fill_brewer(palette="Reds") +
  labs(title="log uterus vs protocol:group_f") +
  theme_classic() + theme(legend.position="none") +
  #scale_x_discrete(labels=c(“0” = “No”,“1” = “Yes”)) +
  facet_wrap( ~ group_f)



#############################
# Model Building
#############################

Model1 <- lmer(log_uterus ~ EE + ZM + weight + protocol_f + (1 | lab_f), data = assay)
summary(Model1)
confint(Model1)

Model2 <- lmer(log_uterus ~ EE + ZM + weight + protocol_f + (1 | lab_f) + weight:protocol_f, data = assay)
summary(Model2)
anova(Model1, Model2)

Model3 <- lmer(log_uterus ~ EE + ZM + weight + protocol_f + (1 | lab_f) + weight:protocol_f + ZM:protocol_f, data = assay)
summary(Model3)
anova(Model2, Model3)


Model4 <- lmer(log_uterus ~ EE + ZM + weight + protocol_f + (1 | lab_f) + 
                 group_f + protocol_f:group_f, data = assay)
summary(Model4)
anova(Model1, Model4)

Model5 <- lmer(log_uterus ~ EE + ZM + weight + protocol_f + (1 | lab_f) + 
                 protocol_f:EE, data = assay)
summary(Model5)
anova(Model1, Model5)


Model6 <- lmer(log_uterus ~ EE + ZM + weight + protocol_f + (1 | lab_f) + 
                 protocol_f:ZM + protocol_f:EE, data = assay)
summary(Model6)
anova(Model5, Model6)


Model7 <- lmer(log_uterus ~ EE + ZM + weight + protocol_f + (1 | lab_f) + 
                 protocol_f:ZM + protocol_f:EE + weight:protocol_f, data = assay)

summary(Model7)
confint(Model7)

anova(Model6, Model7)


base_line_model <- lmer(log_uterus ~ EE + ZM + protocol_f + (1 | lab_f) + 
                          protocol_f:ZM + protocol_f:EE, data = assay)

summary(base_line_model)
confint(base_line_model)



### Assumption Validation
#Linearity
#############################################################
res <- residuals(base_line_model)

ggplot(assay, aes(EE, y=res)) +
  geom_point(alpha = .5,colour="blue3") +
  geom_line(y=0, col="red3") +
  geom_smooth(method = "lm", col = "red3") +
  xlab("EE") +
  ylab("Residuals") +
  labs(caption="Residual vs EE") +
  theme(plot.caption = element_text(hjust = 0.5, size = 20)) +
  facet_wrap(~lab_f,ncol = 5)
ggplot(assay, aes(ZM, y=res)) +
  geom_point(alpha = .5,colour="blue3") +
  geom_line(y=0, col="red3") +
  geom_smooth(method = "lm", col = "red3") +
  xlab("ZM") +
  ylab("Residuals") +
  labs(caption="Residual vs ZM") +
  theme(plot.caption = element_text(hjust = 0.5, size = 20))
+ facet_wrap(~lab,ncol = 5)
#Independence and Equality of Variance
###########################################################
pred <- predict(base_line_model)
pred_res <- data.frame(pred, res)
ggplot(pred_res, aes(pred, y=res)) +
  geom_point(alpha = .5,colour="blue3") +
  #geom_line(y = 0, col = "red3") +
  geom_smooth(method="lm",col="red3") +
  xlab("Fitted values") +
  ylab("Residuals") +
  labs(caption="Residuals vs Fitted values") +
  theme(plot.caption = element_text(hjust = 0.5, size = 20))

#Normality
###########################################################
std_res <- (res - mean(res)) / sd(res)
std_res_df <- data.frame(std_res)
qplot(sample = std_res, data = std_res_df, color=I("blue3"), alpha=.5) +
  geom_abline(intercept = 0, slope = 1, col="red3") +
  xlab("Theoretical Quantiles") +
  ylab("Standardized Residuals") +
  labs(caption="Normal Q-Q") +
  theme(plot.caption = element_text(hjust = 0.5, size = 20), legend.position = "none")





#####
# Questions

# 1. Is the uterotrophic bioassay successful at identifying estrogenic effects of EE and 
# anti-estrogenic effects of ZM. That is, after controlling for predictors and random effects, 
# does uterus weight exhibit an increasing dose response trend for EE and a decreasing dose 
# response trend for ZM?

EE <- exp(0.153882)
# 1.166353 = 1 unit increase results in 16% increase in log_uterus.
# 95% confidence interval = exp(0.14468918,  0.163074050) = (1.15568, 1.177124)
ZM <- exp(-0.204417) 
# 0.8151224 = 1 unit increase results in 18.5% decrease in log_uterus.
# 95% confidence interval = exp(-0.29602189, -0.112817027) = (0.7437711, 0.8933141)


# 2. Does the dose response vary across labs? If so, are there certain labs that appear to be 
# outliers?

dotplot(ranef(base_line_model, condVar=TRUE))


# 3. Do the protocols differ in their sensitivity to detecting EE and ZM effects? If so, is 
# there one protocol that can be recommended?
summary(base_line_model)
confint(base_line_model)

# Protocol B for ZM = exp(-0.631612)
# Protocol A for EE = exp(0)