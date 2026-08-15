# DataCo Supply Chain Analytics

An end-to-end data analytics project analyzing supply chain performance, profitability, customer behavior, product performance, and delivery operations using Python, PostgreSQL, and Power BI.

## Project Overview

This project analyzes the DataCo SMART Supply Chain dataset to identify business performance patterns, profitability drivers, customer value, product performance, and delivery issues.

The project follows a complete data analyst workflow:

**Business Understanding → Data Preparation → Feature Engineering → EDA → SQL Analysis → Power BI Dashboard → Business Recommendations**

## Business Objectives

The analysis focuses on answering the following business questions:

- How is the business performing in terms of revenue, profit, and profit margin?
- Which markets, customer segments, and product categories contribute most to revenue and profit?
- How does discounting relate to profitability?
- Which customer groups generate the greatest share of revenue?
- Which shipping modes experience the greatest delivery problems?
- Is late delivery concentrated in specific markets or widespread?
- What actions could improve profitability, customer value, and delivery performance?

## Tools & Technologies

- **Python**
  - Pandas
  - NumPy
  - Matplotlib
  - Jupyter Notebook
- **PostgreSQL**
  - CTEs
  - Window Functions
  - LAG()
  - RANK()
  - Aggregations
- **Power BI**
  - Data modeling
  - DAX
  - Interactive dashboards
  - Business-focused visualizations

## Key Business Findings

### Overall Performance

The dataset contains:

- **180,519** order-item records
- **65,752** distinct orders
- **20,652** customers
- Approximately **$36.78M** in revenue
- Approximately **$3.97M** in profit
- Approximately **10.78%** overall profit margin

### Delivery Performance

Delivery reliability was the most significant operational issue identified.

- Approximately **57.33% of orders were classified as late**
- Second Class had approximately **80% late deliveries**
- Second Class had an average delivery delay of approximately **2 days**
- Late-delivery rates were relatively similar across markets

### Profitability & Discounting

Profit margin decreased as discount intensity increased:

| Discount Category | Profit Margin |
|---|---:|
| No Discount | 13.09% |
| Low | 11.48% |
| Medium | 10.16% |
| High | 9.03% |

This represents an association rather than proof that discounts alone cause lower margins.

### Customer Value

Repeat and frequent customers represented approximately **40.76% of customers but generated approximately 78.25% of revenue**.

This highlights the importance of repeat purchasing and customer retention.

### Product & Category Performance

Some of the highest-revenue categories included:

- Fishing
- Cleats
- Camping & Hiking
- Cardio Equipment
- Women's Apparel
- Water Sports

The analysis also showed that high revenue does not always correspond to high profitability.

## Power BI Dashboard

The Power BI dashboard contains four analytical pages:

### 1. Supply Chain Executive Overview

Provides a high-level view of:

- Revenue
- Profit
- Orders
- Customers
- Average Order Value
- Late Delivery Rate
- Revenue trends
- Market performance
- Delivery performance

### 2. Customer & Product Performance

Analyzes:

- Revenue by customer segment
- Profit by customer segment
- Top revenue-generating categories
- Revenue versus profit margin
- Revenue mix by discount category

### 3. Delivery & Operations

Analyzes:

- Orders by shipping mode
- Delivery performance by shipping mode
- Average delivery delay
- Late delivery rate by market

### 4. Profitability & Commercial Drivers

Analyzes:

- Profit margin by discount category
- Revenue versus profit by market
- Profit contribution by order size
- Monthly profit margin trend
- Profit contribution by department

## Business Recommendations

The analysis resulted in six major recommendations:

1. Investigate the operational causes of Second Class delivery delays.
2. Evaluate discounting based on incremental profit rather than revenue alone.
3. Strengthen customer retention and encourage repeat purchasing.
4. Evaluate product categories using revenue, profit, and profit margin together.
5. Validate late-period data coverage before interpreting the revenue decline as a business problem.
6. Treat late delivery primarily as a system-wide operational issue rather than focusing only on individual markets.

## Project Structure

```text
DataCo-Supply-Chain-Analytics/
│
├── notebooks/
│   ├── 01_Business_Understanding.ipynb
│   ├── 02_Data_Preparation.ipynb
│   ├── 03_Feature_Engineering.ipynb
│   └── 04_Exploratory_Data_Analysis.ipynb
│
├── sql/
│   └── 05_SQL_analysis.sql
│
├── powerbi/
│   └── 06_Supply_Chain_Dashboard.pbix
│
├── report/
│   └── 07_DataCo_Supply_Chain_Business_Report.pdf
│
└── README.md
```
## Data Limitations
- The dataset is historical rather than live operational data.
- The late-period revenue decline may be affected by changing data coverage.
- Observational analysis identifies associations but does not establish causality.
- The source data contains order-item records rather than one row per order.
- Delivery metrics depend on the underlying analytical grain.
- This project focuses on descriptive and diagnostic analytics rather than predictive modeling.

## Project Outcome
This project demonstrates an end-to-end data analytics workflow, combining Python, PostgreSQL, and Power BI to transform raw supply-chain data into business insights and actionable recommendations.
