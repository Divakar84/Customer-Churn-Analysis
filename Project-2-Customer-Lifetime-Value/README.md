# Customer Lifetime Value (LTV) Prediction using Machine Learning

## 📌 Project Overview
Customer Lifetime Value (LTV) is an important business metric that estimates the total revenue a business can expect from a customer during their relationship with the company. 

This project builds a **machine learning model** to predict customer LTV using historical purchase behavior. The model helps businesses identify high-value customers and improve targeted marketing strategies.

---

## 🎯 Objective
Predict the **Customer Lifetime Value (LTV)** based on customer purchase history and behavioral features.

---

## 🛠 Tools & Technologies
- Python
- Pandas
- NumPy
- Matplotlib
- Scikit-learn
- XGBoost
- Jupyter Notebook

---

## 📊 Dataset
The dataset contains simulated e-commerce transaction data with the following fields:

| Column | Description |
|------|-------------|
| customer_id | Unique ID of customer |
| order_id | Unique order identifier |
| order_date | Date of purchase |
| order_amount | Amount spent on the order |

---

## ⚙️ Project Workflow

### 1️⃣ Data Preprocessing
- Loaded transaction dataset
- Converted order dates to datetime format
- Checked data structure and summary statistics

### 2️⃣ Feature Engineering (RFM)
Created customer-level features:
- **Recency** – Days since last purchase
- **Frequency** – Number of purchases
- **Average Order Value (AOV)** – Average amount spent per order

### 3️⃣ Target Variable
Calculated **Customer Lifetime Value (LTV)** as the total spending per customer.

### 4️⃣ Model Training
Two regression models were trained:

- Linear Regression
- XGBoost Regressor

### 5️⃣ Model Evaluation
Models were evaluated using:

- **MAE (Mean Absolute Error)**
- **RMSE (Root Mean Squared Error)**

Results:

| Model | MAE | RMSE |
|------|------|------|
| Linear Regression | 133 | 254 |
| XGBoost | 46 | 116 |

XGBoost achieved significantly better prediction accuracy.

### 6️⃣ Customer Segmentation
Customers were segmented based on predicted LTV:

- Low Value
- Medium Value
- High Value

This segmentation can help businesses focus marketing efforts on high-value customers.

---

## 📈 Visualizations
The project includes:

- Correlation Heatmap
- Actual vs Predicted LTV Scatter Plot
- Feature Importance Plot

---

## 📂 Project Structure

# Customer Lifetime Value (LTV) Prediction using Machine Learning

## 📌 Project Overview
Customer Lifetime Value (LTV) is an important business metric that estimates the total revenue a business can expect from a customer during their relationship with the company. 

This project builds a **machine learning model** to predict customer LTV using historical purchase behavior. The model helps businesses identify high-value customers and improve targeted marketing strategies.

---

## 🎯 Objective
Predict the **Customer Lifetime Value (LTV)** based on customer purchase history and behavioral features.

---

## 🛠 Tools & Technologies
- Python
- Pandas
- NumPy
- Matplotlib
- Scikit-learn
- XGBoost
- Jupyter Notebook

---

## 📊 Dataset
The dataset contains simulated e-commerce transaction data with the following fields:

| Column | Description |
|------|-------------|
| customer_id | Unique ID of customer |
| order_id | Unique order identifier |
| order_date | Date of purchase |
| order_amount | Amount spent on the order |

---

## ⚙️ Project Workflow

### 1️⃣ Data Preprocessing
- Loaded transaction dataset
- Converted order dates to datetime format
- Checked data structure and summary statistics

### 2️⃣ Feature Engineering (RFM)
Created customer-level features:
- **Recency** – Days since last purchase
- **Frequency** – Number of purchases
- **Average Order Value (AOV)** – Average amount spent per order

### 3️⃣ Target Variable
Calculated **Customer Lifetime Value (LTV)** as the total spending per customer.

### 4️⃣ Model Training
Two regression models were trained:

- Linear Regression
- XGBoost Regressor

### 5️⃣ Model Evaluation
Models were evaluated using:

- **MAE (Mean Absolute Error)**
- **RMSE (Root Mean Squared Error)**

Results:

| Model | MAE | RMSE |
|------|------|------|
| Linear Regression | 133 | 254 |
| XGBoost | 46 | 116 |

XGBoost achieved significantly better prediction accuracy.

### 6️⃣ Customer Segmentation
Customers were segmented based on predicted LTV:

- Low Value
- Medium Value
- High Value

This segmentation can help businesses focus marketing efforts on high-value customers.

---

## 📈 Visualizations
The project includes:

- Correlation Heatmap
- Actual vs Predicted LTV Scatter Plot
- Feature Importance Plot

---

## 📂 Project Structure
# Customer Lifetime Value (LTV) Prediction using Machine Learning

## 📌 Project Overview
Customer Lifetime Value (LTV) is an important business metric that estimates the total revenue a business can expect from a customer during their relationship with the company. 

This project builds a **machine learning model** to predict customer LTV using historical purchase behavior. The model helps businesses identify high-value customers and improve targeted marketing strategies.

---

## 🎯 Objective
Predict the **Customer Lifetime Value (LTV)** based on customer purchase history and behavioral features.

---

## 🛠 Tools & Technologies
- Python
- Pandas
- NumPy
- Matplotlib
- Scikit-learn
- XGBoost
- Jupyter Notebook

---

## 📊 Dataset
The dataset contains simulated e-commerce transaction data with the following fields:

| Column | Description |
|------|-------------|
| customer_id | Unique ID of customer |
| order_id | Unique order identifier |
| order_date | Date of purchase |
| order_amount | Amount spent on the order |

---

## ⚙️ Project Workflow

### 1️⃣ Data Preprocessing
- Loaded transaction dataset
- Converted order dates to datetime format
- Checked data structure and summary statistics

### 2️⃣ Feature Engineering (RFM)
Created customer-level features:
- **Recency** – Days since last purchase
- **Frequency** – Number of purchases
- **Average Order Value (AOV)** – Average amount spent per order

### 3️⃣ Target Variable
Calculated **Customer Lifetime Value (LTV)** as the total spending per customer.

### 4️⃣ Model Training
Two regression models were trained:

- Linear Regression
- XGBoost Regressor

### 5️⃣ Model Evaluation
Models were evaluated using:

- **MAE (Mean Absolute Error)**
- **RMSE (Root Mean Squared Error)**

Results:

| Model | MAE | RMSE |
|------|------|------|
| Linear Regression | 133 | 254 |
| XGBoost | 46 | 116 |

XGBoost achieved significantly better prediction accuracy.

### 6️⃣ Customer Segmentation
Customers were segmented based on predicted LTV:

- Low Value
- Medium Value
- High Value

This segmentation can help businesses focus marketing efforts on high-value customers.

---

## 📈 Visualizations
The project includes:

- Correlation Heatmap
- Actual vs Predicted LTV Scatter Plot
- Feature Importance Plot

---

---

## 📌 Key Learning Outcomes
- Customer behavior analysis using RFM
- Feature engineering for machine learning
- Regression modeling
- Model evaluation techniques
- Customer segmentation using predicted values

---

## 🚀 Future Improvements
- Add more behavioral features
- Use time-based validation
- Build an interactive dashboard
- Deploy the model using a web application

---

## 👨‍💻 Author
**Divakar Pal**

Developed as part of a **Machine Learning project on Customer Lifetime Value Prediction**.
