Market Basket Analysis using R

Overview
This project implements Market Basket Analysis on a groceries dataset using the Apriori algorithm to discover associations between products frequently purchased together. The analysis helps identify customer purchasing patterns and product relationships that can be valuable for retail strategy.

Technologies Used
R Programming Language
arules package (Association Rule Mining)
arulesViz package (Visualization)

Project Structure
market_basket_analysis.R: Main analysis script
README.md: Project documentation

Implementation Details
The analysis uses the following parameters:
Support: 0.001
Confidence: 0.8
Maximum pattern length: 3

How to Run
1. Install required packages:
install.packages(c("arules", "arulesViz"))

2. Load the required libraries:
library(arules)
library(arulesViz)

3. Run the analysis script "market-basket-analysis.r"