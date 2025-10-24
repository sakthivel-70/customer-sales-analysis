# 🛍️ Customer Sales Analysis

A data-driven project designed to analyze customer purchasing behavior, product performance, and business trends using **Python**, **MySQL**, and **Power BI**.

This project demonstrates the end-to-end analytics workflow — from **data cleaning and transformation in MySQL**, **exploratory data analysis in Python**, and **dashboard creation in Power BI** for actionable insights.

---

## 🎯 Project Objectives

- Analyze customer purchase behavior and spending patterns.
- Identify top-performing products and categories.
- Compare sales and purchase amounts across customer segments.
- Study the effect of discounts, shipping types, and subscriptions on revenue.
- Visualize business KPIs and insights using an interactive Power BI dashboard.

---

## 🧰 Tools & Technologies

| Tool / Technology | Purpose |
|------------------|----------|
| **Python (Pandas, Matplotlib, Seaborn)** | Exploratory Data Analysis (EDA) |
| **MySQL** | Data cleaning, transformation, and querying |
| **Power BI** | Data visualization and dashboard creation |
| **Jupyter Notebook / VS Code** | Development environment |

---

## 🗂️ Project Structure

```
Customer-Sales-Analysis/
│
├── data/
│   ├── sales_raw.csv               # Original dataset
│   ├── sales_cleaned.csv           # Cleaned dataset (after transformation)
│
├── scripts/
│   ├── eda_analysis.py             # Python EDA script
│   ├── connect_mysql.py            # Script to connect Python with MySQL
│
├── database/
│   ├── sales_analysis.sql          # SQL file with queries and transformations
│
├── dashboard/
│   ├── Customer_Sales_Dashboard.pbix  # Power BI dashboard file
│
├── reports/
│   ├── Insights_Summary.pdf        # Key findings and insights
│
└── README.md
```

---

## ⚙️ Data Workflow

### 🧹 Step 1 — Data Cleaning & Transformation (MySQL)

All major data transformations and aggregations were performed in **MySQL**.  
Key SQL operations (available in `sales_analysis.sql`) include:

- **Total purchase amount by gender**
  ```sql
  select gender, sum(purchase_amount) as total_amount
  from sales_table
  group by gender;
  ```

- **Customers who spent above-average amount after discounts**
- **Top 5 highest-rated products**
- **Average spend comparison between shipping types**
- **Subscriber vs. Non-subscriber spending behavior**
- **Customer segmentation (New, Returning, Loyal)**
- **Top 3 products per category**
- **Revenue contribution by age group**

These transformations ensured clean, structured data ready for visualization.

---

### 📊 Step 2 — Exploratory Data Analysis (Python)

Performed using **Pandas** to explore and validate key metrics before visualization.  
Key analyses included:
- Correlation between discount and purchase amount
- Age group vs. average spend
- Product performance distribution
- Trend analysis on review ratings and purchase frequency

Example Python snippet:
```python
import pandas as pd


df = pd.read_csv('data/sales_cleaned.csv')
print(df.head)




### 📈 Step 3 — Dashboard Creation (Power BI)

- **MySQL connected directly to Power BI** using ODBC (64-bit) connection.
- Built **interactive visuals** to display:
  - Total Sales & Revenue Trends
  - Gender-based purchase comparison
  - Age group contribution
  - Top products by rating and discount usage
  - Customer segmentation insights

The Power BI dashboard provides real-time interactivity and drill-down analytics.

---

## 📊 Key Insights

| Insight | Observation |
|----------|--------------|
| Gender-based spending | Males spent slightly more overall than females |
| Discount effect | Customers with discounts tend to purchase higher than average |
| Subscription | Subscribers show higher total and average purchase value |
| Product performance | 5 products achieved the highest average review rating |
| Age group | Middle-aged customers contributed the most to total revenue |

---

## 🚀 How to Run

1. **Load SQL File into MySQL:**
   ```sql
   source database/sales_analysis.sql;
   ```

2. **Run Python Analysis:**
   ```bash
   python scripts/eda_analysis.py
   ```

3. **Connect MySQL to Power BI:**
   - Open Power BI → Get Data → MySQL Database
   - Enter host, username, password, and database (`sales_analysis`)
   - Load data and refresh visuals

---

## 🧾 Deliverables

- ✅ Cleaned MySQL database (`sales_analysis`)
- ✅ Exploratory analysis notebook / Python script
- ✅ Power BI interactive dashboard
- ✅ Insight summary report

---

