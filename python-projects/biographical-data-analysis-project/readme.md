# 📊 Biographical Data Analysis

## 📝 Project Overview
This project provides a professional **Exploratory Data Analysis (EDA)** on a massive biographical dataset containing over **917,000 records**. The goal is to uncover patterns between human lifespan, gender, and career paths. By leveraging data cleaning and feature engineering, the project reveals how different professional domains correlate with life expectancy.

## 🛠️ Tech Stack
- **Language:** Python 3.x
- **Libraries:** - `Pandas`: Data manipulation and cleaning.
  - `NumPy`: Numerical operations.
  - `Matplotlib` & `Seaborn`: Advanced statistical visualizations.
  - `OS`: Directory and file management.

## ⚙️ Project Workflow

### 1. Data Cleaning & Preparation
- **Initial Shape:** Processed a raw dataset of ~917,131 entries.
- **Handling Missing Values:**
  - **Gender:** Imputed as 'Unknown' to maintain data volume.
  - **Age of Death:** Used **Median Imputation (72.0 years)** to ensure outliers didn't skew the distribution.
- **Environment Automation:** The script automatically creates a `/figures` directory to organize output charts.

### 2. Intelligent Feature Engineering
The dataset contained raw, unorganized occupation titles. I built a custom **Mapping Logic** to categorize these into 9 professional sectors:
* **Artists:** Actors, Painters, Architects, Directors.
* **Writers:** Authors, Poets, Journalists.
* **Scientists:** Researchers, Professors, Philosophers.
* **Politicians:** Lawyers, Diplomats, Judges.
* **Religious:** Priests, Pastors, Clergy.
* **Others:** Athletes, Engineers, Physicians, Musicians.

### 3. Statistical Analysis & Insights
- **The Longevity Gap:** Discovered that **Females live an average of 2.03 years longer than Males** (71.22 vs 69.19 years).
- **Professional Impact:** Analyzed the "Age of Death" distribution across different sectors, identifying which professions tend to have higher/lower longevity.
- **Distribution Trends:** Most historical figures in the dataset are concentrated in Politics and Arts.

## 📊 Key Visualizations
The project generates several high-resolution plots:
- **Missing Data Heatmap:** To audit data quality before cleaning.
- **Boxplots:** Comparing life expectancy variance across all occupation categories.
- **Violin Plots:** Detailed density analysis for the Top 5 most frequent professions.

- ## Project by: Hanen Elkhishen
  -Data Source: Provided by a friend
