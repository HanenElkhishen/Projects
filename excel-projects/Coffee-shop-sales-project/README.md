# ☕ Coffee Shop Sales Analysis using Excel

![Excel](https://img.shields.io/badge/Microsoft_Excel-217346?style=for-the-badge&logo=microsoft-excel&logoColor=white)
![Analysis](https://img.shields.io/badge/Data_Analysis-FF6B6B?style=for-the-badge&logo=chartdotjs&logoColor=white)
![Dashboard](https://img.shields.io/badge/Dashboard-4285F4?style=for-the-badge&logo=google-analytics&logoColor=white)

## 📋 Table of Contents
- [Project Overview](#-project-overview)
- [Dataset Description](#-dataset-description)
- [Tools Used](#-tools-used)
- [Data Cleaning & Preparation](#-data-cleaning--preparation)
- [Analysis & KPIs](#-analysis--kpis)
- [Dashboard Overview](#-dashboard-overview)
- [Key Insights & Findings](#-key-insights--findings)
- [Recommendations](#-recommendations)
- [Conclusion](#-conclusion)

---

## 🎯 Project Overview

This project analyzes sales data from a coffee shop chain (Maven Roasters) to uncover actionable insights that can drive business growth and operational efficiency. Using Microsoft Excel's advanced features, I developed an interactive dashboard to visualize key performance metrics and identify trends in customer behavior, product performance, and sales patterns.

### Business Problem
Maven Roasters needs to understand sales performance across different dimensions—time, product categories, and store locations—to optimize inventory, staffing, and marketing strategies.

### Objectives
1. Prepare and clean the dataset for analysis
2. Explore sales data using Pivot Tables to identify trends
3. Build a dynamic, interactive dashboard to visualize key metrics and support data-driven decision-making

---

## 📊 Dataset Description

The dataset contains transactional data from Maven Roasters coffee shops over a six-month period (January to June).

### Key Columns
| Column | Description |
|--------|-------------|
| **Transaction Date & Time** | When each purchase occurred |
| **Store Location** | Which store location processed the transaction |
| **Product Category** | Type of product sold (Coffee, Tea, Bakery, etc.) |
| **Product Type** | Specific product within each category |
| **Quantity** | Number of items purchased |
| **Price** | Unit price of each product |

### Key Metrics
- **Revenue:** Calculated as Price × Quantity
- **Transaction Count:** Total number of sales transactions
- **Time-based dimensions:** Month, Day of Week, Hour

---

## 🛠️ Tools Used

| Tool | Features Used |
|------|---------------|
| **Microsoft Excel** | • Formulas for Revenue calculation<br>• TEXT() function for date/time extraction<br>• Pivot Tables for data aggregation<br>• Pivot Charts (Line, Column, Bar)<br>• Slicers for interactive filtering<br>• Dashboard design and formatting |

---

## 🧹 Data Cleaning & Preparation

To ensure data quality and enable robust analysis, I performed the following preparation steps:

### 1. Data Familiarization
- ✅ Reviewed the dataset structure to understand the number of transactions, time period covered, and product categories
- ✅ Identified all available product categories and types

### 2. Calculated Columns

#### 💰 Revenue Column
```excel
Revenue = Price × Quantity
```
- Created a new column calculating Revenue as `Price × Quantity`
- This metric is essential for understanding financial performance

#### 📅 Month Column
```excel
=TEXT(transaction_date, "mmm")
```
- Extracted month names from transaction dates using the TEXT() function
- Format: "Jan", "Feb", "Mar", etc. (text labels instead of numerical values)
- Enables time-series analysis of monthly trends

#### 📆 Day of Week Column
```excel
=TEXT(transaction_date, "ddd")
```
- Extracted day names from transaction dates using the TEXT() function
- Format: "Mon", "Tue", "Wed", etc. (text labels)
- Helps identify weekly patterns in customer traffic

#### 🕐 Hour Column
```excel
=HOUR(transaction_time)
```
- Extracted the hour component from transaction times
- Enables analysis of peak sales hours throughout the day

---

## 📈 Analysis & KPIs

Using Excel Pivot Tables, I analyzed the coffee shop data across multiple dimensions to extract key performance indicators:

### Key Metrics Tracked

| KPI | Description | Business Value |
|-----|-------------|----------------|
| 📊 **Monthly Revenue Trends** | Tracks revenue growth or decline over time | Identifies seasonal patterns and business momentum |
| 📅 **Transactions by Day of Week** | Shows which days generate the most customer traffic | Optimizes staff scheduling and inventory planning |
| 🕐 **Transactions by Hour of Day** | Identifies peak hours when the store is busiest | Helps allocate resources during high-demand periods |
| 🛍️ **Sales by Product Category** | Reveals which categories drive the most transactions | Guides inventory management and product focus |
| 🏆 **Top 15 Product Types** | Highlights best-selling individual products | Informs promotional strategies and menu optimization |

---

## 📊 Dashboard Overview

The final dashboard provides an interactive, at-a-glance view of Maven Roasters' sales performance:

### Dashboard Components

#### 1️⃣ Total Revenue by Month (Line Chart with Trendline)
- Displays monthly revenue progression from January to June
- Includes a dotted trendline showing predicted future sales
- **Insight:** Reveals consistent growth trajectory with clear upward momentum

#### 2️⃣ Transactions by Day of Week (Column Chart)
- Shows transaction volume for each day (Sunday through Saturday)
- **Insight:** Monday and Friday are the busiest days, while Saturday sees a notable drop

#### 3️⃣ Most Active Sales Time (Column Chart)
- Displays transaction counts by hour of day (6 AM - 8 PM)
- **Insight:** Peak hours are 8 AM, 9 AM, and 10 AM, with activity declining throughout the day

#### 4️⃣ Sales by Product Categories (Horizontal Bar Chart)
- Ranks product categories by total transactions
- **Insight:** Coffee dominates with 58,416 transactions, followed by Tea (45,449) and Bakery (22,796)

#### 5️⃣ Interactive Slicer
- Store Location filter that dynamically updates all charts and tables
- Enables location-specific analysis across all metrics

#### 6️⃣ Top 15 Products Table
- Shows the highest-performing product types by transaction count and revenue
- Helps identify star products worth promoting

### 💡 Decision-Making Value
The dashboard enables managers to quickly assess performance, spot trends, and make informed decisions about staffing, inventory, promotions, and operational hours.

---

## 💡 Key Insights & Findings

Based on the analysis, the following patterns emerged:

### 📈 Strong Revenue Growth
The business shows consistent month-over-month revenue growth from **$81,678 in January** to **$168,486 in June**, with projections indicating continued upward trajectory.

### 📅 Weekly Traffic Patterns
**Monday** and **Friday** are the busiest days (21,643 and 21,701 transactions respectively), while **Saturday** experiences a significant drop (20,510 transactions). This suggests weekend behavior differs from weekday patterns.

### ☕ Morning Rush Dominates
The majority of transactions occur between **8 AM and 10 AM**, with a steep decline after 11 AM. This indicates a strong breakfast/morning coffee rush.

### 🏆 Coffee is King
Coffee products account for the largest share of sales (**58,416 transactions**), significantly outperforming other categories. Tea and Bakery products also show strong performance.

### 🎯 Category Diversity
While Coffee leads, the presence of Tea, Bakery, Drinking Chocolate, and other categories indicates customers value product variety.

---

## 🎯 Recommendations

Based on the data analysis, I recommend the following actions for Maven Roasters:

### 1. ⏰ Optimize Staffing for Peak Hours
- Schedule more staff between **8 AM and 11 AM** to handle the morning rush efficiently
- Consider reduced staffing in late afternoon/evening hours to control labor costs

### 2. 📅 Investigate Saturday Performance
- Saturday shows lower traffic compared to other days—explore targeted weekend promotions or events to boost footfall
- Survey customers to understand why Saturday traffic is lower

### 3. ☕ Capitalize on Coffee Demand
- Expand coffee product varieties or introduce seasonal specials
- Ensure coffee inventory is well-stocked, especially during peak hours

### 4. 🥐 Promote Tea and Bakery Items
- Since Coffee dominates, create bundled offers (e.g., "Coffee + Pastry" combos) to increase bakery sales
- Highlight tea options during slower hours to diversify revenue streams

### 5. 📊 Leverage Growth Momentum
- With consistent revenue growth, consider expanding marketing efforts or opening new locations
- Invest in loyalty programs to retain the growing customer base

### 6. 📍 Location-Specific Strategies
- Use the slicer functionality to analyze individual store performance
- Tailor strategies based on each location's unique patterns

---

## Conclusion

This project demonstrates the power of Excel for business analytics. By transforming raw transactional data into an interactive dashboard, I provided Maven Roasters with clear visibility into their sales performance and customer behavior. The insights derived from this analysis can directly inform strategic decisions around staffing, inventory management, marketing, and operational planning.

The combination of data preparation, Pivot Table analysis, and dashboard visualization showcases essential skills for any data analyst role: data cleaning, analytical thinking, and the ability to communicate findings through compelling visualizations.

---

**Author:** *HANEN Data Analyst **Portfolio Project***
**Tools:** Microsoft Excel (Pivot Tables, Pivot Charts, Formulas, Dashboard Design)  
**Date:** Jan 2025
