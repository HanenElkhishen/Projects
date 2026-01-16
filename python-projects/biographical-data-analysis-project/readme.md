# Biographical Data Analysis Project

## Project Overview
This project delivers a complete data engineering and analysis pipeline for a **large-scale biographical dataset**. The objective is to extract meaningful insights into demographics, lifespan trends, and occupational distributions from nearly **1 million historical and contemporary records**. The workflow emphasizes **efficient data processing, advanced feature engineering, and insightful visualizations**.

## Dataset Specifications
* **Total Records:** ~917,131 rows  
* **Format:** CSV  
* **Key Attributes:** Name, Short Description, Gender, Occupation, Age of Death  
* **Scale Considerations:** Large-volume dataset requiring optimized memory usage and vectorized operations for performance efficiency  

## Technical Methodology
The project leverages **Python 3.x** and high-performance libraries to process and analyze large-scale data effectively.

### 1. Data Cleaning & Imputation
* **Duplicate Management:** Redundant entries removed to maintain data accuracy  
* **Gender Standardization:** Missing values filled as `"Unknown"` to preserve dataset integrity  
* **Age Imputation:** Null values in the `Age of Death` column replaced with the median; converted to integer type  
* **Memory Optimization:** Data types standardized for efficient handling of ~1M rows  

### 2. Advanced Feature Engineering
* **Text-Based Categorization:** Thousands of unique occupations consolidated into **10 high-level categories** (e.g., Artists, Scientists, Politicians, Athletes)  
* **Cross-Field Inference:** Missing occupation data extracted from `Short Description` fields using keyword-based logic  

### 3. Statistical Analysis
* **Longevity Insights:** Comparison of average lifespans by gender, excluding unknown values for precision  
* **Occupational Distribution:** Analysis of prevalent occupations across professional categories  

## Visualizations
High-resolution graphical outputs are saved in the `/figures` directory:

* **Age Distribution:** Histogram with KDE to visualize lifespan frequency  
* **Gender Metrics:** Bar charts for average age, pie charts for population breakdown  
* **Occupational Trends:** Horizontal bar charts highlighting dominant professional categories  
* **Variance Analysis:** Boxplots and violin plots showing age-of-death distribution by occupation  

## Technology Stack
* **Language:** Python 3.x  
* **Data Manipulation:** `pandas`, `numpy`  
* **Visualization:** `matplotlib`, `seaborn`  
* **Development Environment:** Jupyter Notebook  
* **AI Collaboration:** Scripts and documentation optimized with **Gemini 3** and **Claude**  
