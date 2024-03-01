load("BRFSS2022_rev.RData")
brfss22$Age_midpt <- fct_recode(brfss22$X_AGEG5YR, "21" = "Age 18 to 24",
                                "27" = "Age 25 to 29", "32" = "Age 30 to 34",
                                "37" = "Age 35 to 39", "42" = "Age 40 to 44",
                                "47" = "Age 45 to 49", "52" = "Age 50 to 54",
                                "57" = "Age 55 to 59", "62" = "Age 60 to 64",
                                "67" = "Age 65 to 69", "72" = "Age 70 to 74",
                                "77" = "Age 75 to 79", "82" = "Age 80 or older",
                                NULL = "Dont know/Refused/Missing")
brfss22$Age_midpt <- as.numeric(levels(brfss22$Age_midpt))[brfss22$Age_midpt]
p_tri_marital <- ggplot(data = brfss_tristate,
                                 mapping = aes(x = Age_midpt,
                                                   y = X_BMI5,
                                                   color = MARITAL,  fill = MARITAL)) 
p_tri_marital + geom_smooth()
brfss_tristate$MARSIMPLE <- fct_recode(brfss_tristate$MARITAL,"Married"="Married",
                                       "DWS"="Divorced","DWS"="Separated","DWS"="Widowed",
                                       "Never married"="Never married",
                                       "Married"="A member of an unmarried couple",
                                     NULL = "Refused") 
p_tri_marital <- ggplot(data = brfss_tristate,
                        mapping = aes(x = Age_midpt,
                                      y = X_BMI5,
                                      color = MARSIMPLE,  fill = MARSIMPLE)) 

p_tri_marital + geom_smooth() 
For the lab I wanted to look at BMI and age and its connecion to marriage status. To make the graph easier to read I combined 'divorced' 'seperated' and 'widowed' into one catergory called 'DWS' 
After running the data and creating a graph for it we can see that for all three groups (DWS, Married, and Never Married) their BMI increases at around age 40 and decreases at around age
  60. We can predict that around that time people become more sedentary and with age it becomes harder to stay active so they put on some weigh. After 20 years however we can preduict that
age starts to cause most people to lose weight. It is intresting though that the 'never married' population has the highest BMI numbers when compared to the other two groups. Is it possible that 
'unmarried' people are more sedentary and live more unhealhty lifestyles than 'married' or 'DWS' individuals. It is also intresting that the 'married' group has the lowest BMI over time 
one would predict that people settle more when they are married so dont mind if they put on a few pounds while 'never married' or 'DWS' people are actively looking for a partner so they 
  try to stay as fit as possible to attract one. There is not enough data here to know for certain why these relationships exist but I will say that the data subverted my prediction. 
