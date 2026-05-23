# Data Warehouse and Analytics Project

Welcome to the **Data Warehouse and Analytics Project** repository 🚀

This project demonstrates an end-to-end data warehousing solution, from raw data ingestion to business-ready analytics. It follows a modern **Medallion Architecture (Bronze, Silver, Gold)** and showcases practical SQL-based data engineering skills.

---

## 🏗️ Data Architecture

The system is designed using the Medallion Architecture:

![Data Architecture](docs/data_architecture.png)

- **Bronze Layer**: Raw data loaded directly from CSV files into SQL Server with no transformations.
- **Silver Layer**: Cleaned, standardized, and transformed data prepared for modeling.
- **Gold Layer**: Business-ready star schema optimized for reporting and analytics.

---

## 📖 Project Overview

This project includes:

1. Data Architecture Design – layered Medallion architecture implementation  
2. ETL Pipelines – extraction, transformation, and loading from CRM & ERP sources  
3. Data Modeling – fact and dimension tables using star schema  
4. Analytics Layer – SQL-based reporting for business insights  

---

## 🎯 Skills Demonstrated

- SQL Development (DDL, DML, Stored Procedures, Views)  
- Data Warehousing Concepts  
- ETL Pipeline Design  
- Data Cleaning & Transformation  
- Star Schema Modeling  
- Data Quality Checks  

---

## 🛠️ Tools & Technologies

- SQL Server Express  
- SQL Server Management Studio (SSMS)  
- DrawIO (Architecture & Data Models)  
- GitHub (Version Control)  
- Notion (Project Planning)  

---

## 🚀 Project Requirements

### Objective
Build a SQL Server data warehouse integrating CRM and ERP datasets.

### Key Requirements
- Load raw CSV data into SQL Server (Bronze layer)
- Clean and transform data in Silver layer
- Build star schema in Gold layer
- Ensure data quality across all layers
- Focus on current-state data (no historization required)

---

### Analytics Goals
- Customer behavior analysis  
- Product performance analysis  
- Sales trend analysis  

---

## 📂 Repository Structure

```text
data-warehouse-project/
│
├── datasets/
├── docs/
├── scripts/
├── tests/
├── README.md
└── LICENSE
```

---

## 🛡️ License

This project is licensed under the MIT License.

---

## 🌟 About Me

Hi, I’m **Siddiqa Ali**, a Financial Data Analyst interested in data engineering, analytics, and building end-to-end data solutions.

🔗 LinkedIn: https://www.linkedin.com/in/siddiqa-sajid-0179bb271/  
🔗 GitHub: https://github.com/sdsajid98-commits

I enjoy working with SQL, data pipelines, and turning raw data into meaningful business insights.
