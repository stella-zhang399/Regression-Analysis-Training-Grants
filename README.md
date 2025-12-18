# Regression-Analysis-Training-Grants
Econometric analysis project using R to model the causal impact of federal training grants on employee training hours. Implemented Ordinary Least Squares (OLS) and Fixed Effects estimation on panel data.

## Project Goal and Context
This project utilized econometric methods to rigorously investigate the causal relationship between the receipt of federal training grants and the subsequent change in employee training hours among a panel of firms.

The objective was to overcome common challenges in observational data, specifically unobserved heterogeneity (e.g., baseline management quality or firm culture), to provide a statistically sound estimate of the grant's true impact on investment in human capital.

## Methodology & Implementation
The analysis followed a rigorous statistical workflow:

* Data Preprocessing: Initial cleaning and manipulation of the panel dataset (cross-sectional firms observed over multiple time periods).

* Model Construction: Constructed a baseline Ordinary Least Squares (OLS) model to establish initial relationships, followed by the main causal analysis using a Fixed Effects (FE) model.   

* Inference and Rigor: The FE model was applied to effectively control for unobserved time-invariant firm characteristics, ensuring a more credible causal interpretation of the grant parameter. Robust standard errors were implemented to address potential heteroscedasticity in the model residuals.   

* Hypothesis Testing: Conducted formal hypothesis testing to determine the statistical significance of the grant variable and other identified determinants (e.g., firm size, industry sector).

## Key Findings and Accomplishments
* Causal Estimation: The Fixed Effects approach yielded a statistically significant estimate for the impact of training grants, demonstrating a specific, quantifiable increase in employee training hours per firm.   

* Methodological Integrity: The project successfully applied advanced econometric techniques (FE models) to real-world panel data, moving beyond simple OLS correlation to perform robust causal inference.

* Code Reproducibility: The analysis script is fully documented, allowing for the complete reproduction of data cleaning, model fitting, and visualization steps.
