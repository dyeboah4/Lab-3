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
