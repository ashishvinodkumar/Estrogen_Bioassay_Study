# Estrogen_Bioassay_Study

[Report](https://github.com/ashishvinodkumar/Estrogen_Bioassay_Study/blob/main/30_Reports/Final%20Report.pdf)

[Presentation](https://github.com/ashishvinodkumar/Estrogen_Bioassay_Study/tree/main/40_Presentation)

# Introduction
Estrogens are a group of hormones produced in both the female ovaries and male testes, with larger amounts made in females than in males. They are particularly influential during puberty, menstruation, and pregnancy, but they also help regulate the growth of bones, skin, and other organs and tissues. In general, they have a strong effect of endocrine function by disrupting these functions.

Over the past 10 years, many synthetic compounds and plant products present in the environment have been found to affect hormonal functions in various ways. Those that have estrogenic activity have been labeled as environmental estrogens. There is increasing concern that chemicals in the environment referred to as environmental estrogens may be causing adverse effects through endocrine disruption. Hence, there is a need for new approaches for screening chemicals for endocrine disrupting effects.

The rat uterotrophic bioassay provides one approach for identifying agonists or antagonists of estrogen. An estrogen antagonist is a compound that blocks the binding of estrogen and so blocks the action of estrogen. An estrogen agonist is a compound that enhances the action of estrogen. Rats in this study are either immature or have their ovaries removed and therefore do not produce estrogen.

The point of the study is to use the rats as an assay to test the effect of estrogen agonists and antagonists on a particular hormonal response, the weight of the uterus. This is done by varying the amount of the agonist or antagonist give to the rat. The response is the weight of the uterus, with uterus weight expected to exhibit an increasing dose response trend for chemicals acting as estrogen agonists and with estrogen antagonists acting to block such estrogen effects. It is expected that the uterus gets heavier with the increase of estrogen agonist dose.

The basic design randomizes female rats to treatment groups, with groups consisting of a control group and several groups having increasing doses of the test agent. An international multi-laboratory study was conducted to compare the results of the rat uterotrophic bioassay using a known estrogen agonist (EE) and a known estrogen antagonist (ZM). The main goal of the study was to assess whether the results were consistent across the laboratories.

# Questions to be answered:
> Is the uterotrophic bioassay successful at identifying estrogenic effects of EE and anti-estrogenic effects of ZM. That is, after controlling for predictors and random effects, does uterus weight exhibit an increasing dose response trend for EE and a decreasing dose response trend for ZM?


> Does the dose response vary across labs? If so, are there certain labs that appear to be outliers?


> Do the protocols differ in their sensitivity to detecting EE and ZM effects? If so, is there one protocol that can be recommended?

# Codebook
<p align="center">
<img src="https://user-images.githubusercontent.com/26104722/124193396-bc0e4980-da94-11eb-941e-41093d9b1504.png">
</p>

# Model Selection
<p align="center">
<img src="https://user-images.githubusercontent.com/26104722/124193395-bc0e4980-da94-11eb-90e6-a47b25ad69df.png">
</p>

# Model Result
According to the below regression table, our analysis sought to answer 3 inference questions about the effects of estrogenic agonist and antagonist on uterus weight. Specifically, we were asked to assess the effects of EE (agonist) and ZM (antagonist) on uterus weight. We found that EE was associated with a significant positive effect on uterus weight. EE has a positive coefficient of 0.15, resulting in an exponentiated point estimate of 1.16 and a 95% confidence interval of (1.16, 1.18). Thus, with a 1 unit increase in EE the uterus weight increased on average by 16%. Similarly, ZM was associated with a significant negative effect on uterus weight. ZM has a negative coefficient of -0.20, resulting in an exponentiated point estimate of 0.81 and a 95% confidence interval of (0.74, 0.89). Thus, with a 1 unit increase in EE, the uterus weight decreases on average by 18.5%. 

<p align="center">
<img src="https://user-images.githubusercontent.com/26104722/124193393-bb75b300-da94-11eb-9509-ab4d415a1283.png">
</p>

Furthermore, we found that dose responses vary across labs. Looking at the dot-plot below, there are around 4 labs on two ends of the plot that do not contain 0 in the 95% confidence interval. These labs distinctively vary from the mean labs towards the center. As a result, this shows that the dose response results measured, does vary across the labs.

<p align="center">
<img src="https://user-images.githubusercontent.com/26104722/124193392-bb75b300-da94-11eb-8e01-1bb08d25dcaf.png" width="600" height="600">
</p>

Besides, we found that protocols differ in their sensitivity to detecting EE and ZM effects. Looking at the interaction between EE & protocol, we identified Protocol A, the baseline, to be the most sensitive. Protocol B, C, and D, all have a negative effect on uterus weight compared to the baseline Protocol A. Similarly, we looked at the interaction between ZM & protocol, we identified Protocol B to be the most sensitive. Protocol B has the largest negative slope compared to the other protocols. As a result, Protocol B is the most sensitive protocol for ZM, compared to the baseline Protocol A.

# Conclusion
This report tested the hypothesis made by estrogen agonists and antagonists researchers by using a multilevel regression model. The empirical results echoed the expectation of the researchers showing that logged uterus weight indicated an increasing dose response trend for EE, and a decreasing dose response trend for ZM. However, we would argue that there are limitations that would affect our study. First, the response variable was not completely normally distributed which would inevitably affect the model explanatory power. Secondly, checking for model assumptions raised concerns regarding normality and linearity. However, there was insufficient data to further improve the model. To conclude, this analysis only serves as a preliminary insight into the questions and there remains room for improvement.
