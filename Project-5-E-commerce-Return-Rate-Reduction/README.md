# 🛒 E-Commerce Return Rate Reduction Analysis

## 📌 Project Overview

This project focuses on analyzing e-commerce return behavior and building a predictive model to identify high-risk returns. The goal is to help businesses reduce return rates using data-driven insights and visualization.

---

## 🎯 Objectives

* Analyze return rates across product categories and locations
* Identify high-risk products with frequent returns
* Build a machine learning model to predict return probability
* Develop an interactive dashboard for business insights

---

## 🧰 Tech Stack

* **Python** (Pandas, NumPy, Scikit-learn)
* **Power BI** (Dashboard & Visualization)
* **Google Colab** (Development Environment)

---

## 📂 Dataset

* Synthetic E-commerce Returns Dataset
* Contains:

  * Product details
  * Customer/location data
  * Order information
  * Return status

---

## ⚙️ Data Preprocessing

* Removed duplicate records
* Handled missing values
* Converted `Return_Status`:

  * Returned → 1
  * Not Returned → 0
* Cleaned column names
* Fixed date format

---

## 📊 Exploratory Data Analysis (EDA)

* Calculated overall return percentage
* Analyzed return rate by:

  * Category
  * Location
* Identified patterns in return behavior

---

## 🔥 High-Risk Product Identification

* Products with return rate > 50% were flagged
* Exported as:

  * `high_risk_products.csv`

---

## 🤖 Machine Learning Model

* **Algorithm Used:** Logistic Regression
* **Target Variable:** Return_Status
* **Output:**

  * Return Probability
  * Risk Level (Low / Medium / High)

---

## 📈 Power BI Dashboard

### Features:

* KPI Cards (Total Orders, Return %)
* Return Rate by Category (Bar Chart)
* Geographic Analysis (Map)
* Risk Distribution (Pie Chart)
* High-Risk Products Table
* Interactive Filters (Slicers)

---

## 📦 Project Outputs

* `final_with_risk_scores.csv`
* `high_risk_products.csv`
* Power BI Dashboard
* Python Codebase

---

## 🚀 Key Insights

* Certain product categories show higher return rates
* Specific locations have increased return behavior
* High-risk products can be identified using predictive modeling

---

## 🔮 Future Improvements

* Use advanced models like Random Forest
* Add customer review analysis (NLP)
* Include marketing channel data
* Implement real-time prediction system

---

## 🙌 Author

* Divakar Pal

---
