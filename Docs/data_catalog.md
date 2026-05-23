# Data Catalog for Gold Layer

## Overview
The Gold Layer represents the business-ready data model designed for reporting, dashboarding, and analytical use cases. It contains curated **dimension tables** and **fact tables** optimized for business insights and decision-making.

---

### 1. **gold.dim_customers**
- **Purpose:** Stores customer information enriched with demographic and geographic attributes.
- **Columns:**

| Column Name      | Data Type     | Description                                                                                   |
|------------------|---------------|-----------------------------------------------------------------------------------------------|
| customer_key     | INT           | Surrogate key uniquely identifying each customer record in the dimension table.               |
| customer_id      | INT           | Unique identifier assigned to each customer.                                                  |
| customer_number  | NVARCHAR(50)  | Alphanumeric customer reference code used for tracking and identification.                    |
| first_name       | NVARCHAR(50)  | Customer's first name.                                                                        |
| last_name        | NVARCHAR(50)  | Customer's last name or family name.                                                          |
| country          | NVARCHAR(50)  | Country of residence of the customer (e.g., 'Australia').                                    |
| marital_status   | NVARCHAR(50)  | Customer marital status (e.g., 'Married', 'Single').                                          |
| gender           | NVARCHAR(50)  | Customer gender (e.g., 'Male', 'Female', 'n/a').                                              |
| birthdate        | DATE          | Customer date of birth in YYYY-MM-DD format.                                                  |
| create_date      | DATE          | Date the customer record was created in the source system.                                    |

---

### 2. **gold.dim_products**
- **Purpose:** Stores product-related information and classification attributes.
- **Columns:**

| Column Name          | Data Type     | Description                                                                                   |
|----------------------|---------------|-----------------------------------------------------------------------------------------------|
| product_key          | INT           | Surrogate key uniquely identifying each product record in the dimension table.                |
| product_id           | INT           | Unique identifier assigned to the product.                                                    |
| product_number       | NVARCHAR(50)  | Alphanumeric product code used for inventory and tracking purposes.                           |
| product_name         | NVARCHAR(50)  | Descriptive name of the product including key identifying attributes.                        |
| category_id          | NVARCHAR(50)  | Identifier for the product category.                                                          |
| category             | NVARCHAR(50)  | High-level grouping of products (e.g., Bikes, Components).                                   |
| subcategory          | NVARCHAR(50)  | More detailed classification within a category.                                               |
| maintenance_required | NVARCHAR(50)  | Indicates whether maintenance is required (Yes/No).                                           |
| cost                 | INT           | Base cost of the product in whole currency units.                                             |
| product_line        | NVARCHAR(50)  | Product line or series classification (e.g., Road, Mountain).                                 |
| start_date          | DATE          | Date when the product became available in the system.                                         |

---

### 3. **gold.fact_sales**
- **Purpose:** Stores transactional sales data for analytical reporting.
- **Columns:**

| Column Name     | Data Type     | Description                                                                                   |
|-----------------|---------------|-----------------------------------------------------------------------------------------------|
| order_number    | NVARCHAR(50)  | Unique identifier for each sales order (e.g., 'SO54496').                                     |
| product_key     | INT           | Foreign key linking to the product dimension table.                                           |
| customer_key    | INT           | Foreign key linking to the customer dimension table.                                          |
| order_date      | DATE          | Date when the order was placed.                                                              |
| shipping_date   | DATE          | Date when the order was shipped.                                                             |
| due_date        | DATE          | Payment due date for the order.                                                             |
| sales_amount    | INT           | Total sales value for the transaction line item.                                              |
| quantity        | INT           | Number of units purchased.                                                                   |
| price           | INT           | Unit price of the product at the time of sale.                                               |
