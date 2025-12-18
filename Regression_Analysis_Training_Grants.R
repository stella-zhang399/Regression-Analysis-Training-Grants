# Clear the memory
rm(list=ls())

# Load libraries
library(wooldridge)
library(plm)
library(lmtest)
library(sandwich)

# Load the Wooldridge job training dataset
data(jtrain)

# Inspect the data
head(jtrain)
summary(jtrain)
View(jtrain)

# Define the Panel Data Structure
pdata <- pdata.frame(jtrain, index = c("fcode", "year"))

# Run the Fixed Effects (Within) Model
fe_model <- plm(hrsemp ~ grant + lemploy + lsales, 
                data = pdata, 
                model = "within")

# Review the standard summary
summary(fe_model)

# Implement Robust Inference
coeftest(fe_model, vcov = vcovHC(fe_model, type = "HC0", cluster = "group"))

## Visualization
library(ggplot2)
library(dplyr)

# Trend Analysis: Mean Training Hours by Grant Status
jtrain_summary <- jtrain %>%
  group_by(year, grant) %>%
  summarise(mean_hrsemp = mean(hrsemp, na.rm = TRUE),.groups = 'drop') %>%
  mutate(grant = factor(grant, levels = c(0, 1), labels = c("No Grant", "Grant Received")))

# Plot the trends over time
ggplot(jtrain_summary, aes(x = year, y = mean_hrsemp, color = grant, group = grant)) +
  geom_line(linewidth = 1.2) +
  geom_point(size = 3) +
  labs(title = "Mean Training Hours per Employee (1987-1989)",
       subtitle = "Comparing grant recipients vs. non-recipients",
       x = "Year", y = "Avg. Training Hours", color = "Status") +
  theme_minimal()

## Other visualization
library(broom)

# Tidy the fixed effects model into a data frame for plotting
model_results <- tidy(fe_model, conf.int = TRUE)

# Filter for the grant coefficient to highlight the impact
ggplot(model_results %>% filter(term == "grant"), 
       aes(x = estimate, y = term, xmin = conf.low, xmax = conf.high)) +
  geom_vline(xintercept = 0, linetype = "dashed", color = "red") +
  geom_pointrange(color = "blue", size = 1) +
  labs(title = "Causal Impact of Training Grants",
       subtitle = "Fixed Effects Estimate with 95% Confidence Interval",
       x = "Estimated Increase in Training Hours",
       y = "Predictor Variable") +
  theme_minimal()
