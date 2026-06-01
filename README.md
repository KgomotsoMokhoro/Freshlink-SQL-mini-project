# Freshlink- SQL (Aggregations + Grouping)
> Supplier & Stock Performance Analysis — Aggregation Dashboard 

---

## ⚙️ Project Type Flags


- [x] Exploratory Data Analysis (EDA)
- [x] SQL Analysis / Querying
- [x] Dashboard / Data Visualization
- [ ] Data Pipeline / ETL
- [ ] Predictive Modelling / Machine Learning
- [x] Data Cleaning / Wrangling
- [x] End-to-End (multiple of the above)
- [ ] Other: ___________

---

## Table of Contents
1. [Project Overview](#1-project-overview)
2. [Objectives](#2-objectives)
3. [Project Scope & Tools](#3-project-scope--tools)
4. [Repository Structure](#4-repository-structure)
5. [Data Workflow](#5-data-workflow)
6. [Data Model & Schema](#6-data-model--schema)
7. [Analysis & Metrics](#8-analysis--metrics)
8. [Key Insights](#9-key-insights)
9. [Recommendations](#10-recommendations)
10. [Deliverables](#13-deliverables)
11. [Author](#14-author)

---

## 1. Project Overview

<!--
  Write 3–5 sentences in plain language.
  Cover: context → problem → approach → outcome.
  Read it out loud. If it sounds like a form - rewrite it.

  WHAT GOOD LOOKS LIKE:
  "A mid-size retail business was seeing inconsistent revenue across
  its regional stores but couldn't identify the root cause. This project
  explored 18 months of transaction data across five regions to determine
  whether underperformance was driven by sales volume, pricing, or return
  rates. The analysis revealed that one region's gap was almost entirely
  explained by an unusually high return rate on a single product category -
  a finding invisible in the company's top-level reporting."

  WHAT TO AVOID:
  "This project analyzes sales data to find trends and insights."
  (Too vague. Could describe 10,000 projects. Describes none of them.)
-->

**Context:** FreshLink is a fast-growing e-grocery company operating five fulfilment centres across Indonesia — Bandung, Denpasar, Jakarta, Surabaya, and Medan. They stock 10 product categories ranging from Fresh Produce and Meat to Pantry staples and Personal Care, supplied by 10 vendors across the country.
In a leadership review for Q3 2025, Rizky Pratama, Head of Inventory and Procurement, raised a critical concern: the business has no consolidated view of how suppliers are performing or how stock health varies across categories and warehouses. Individual SKU records exist, but nobody has ever grouped and summarised them to answer the questions that matter most to procurement decisions. COME BACK TO EDIT THE FINIDINGS



**Problem Statement:** There has never been agrregated data that the head of procurement can use to make procurement decisions.

**Approach:** 3 Platforms were used, Excel to clean the data, SQL to query the use cases, and PowerBi to visualise the findings.

**Outcome:** [What did you produce or discover?]

---

## 2. Objectives

<!--
  Write objectives that are specific enough to succeed or fail.
  Use action-oriented verbs: Identify, Determine, Quantify, Build, Evaluate.

  WHAT GOOD LOOKS LIKE:
  ✅ "Determine whether customer churn rate correlates with support ticket volume."
  ✅ "Identify the top three revenue-driving product categories across all regions."
  ✅ "Build a reproducible pipeline that ingests and cleans daily sales exports."

  WHAT TO AVOID:
  ❌ "Explore the data."
  ❌ "Gain insights."
  ❌ "Understand trends."
  (These can't fail - which means they can't succeed either.)
-->

- **Primary Objective:** Deliver a Supplier & Stock Performance Analysis using SQL aggregation queries that enable Rizky and the procurement team at FreshLink to summarise stock health, identify underperforming suppliers, quantify expiry risk by category, and surface warehouses with the highest stockout exposure.
- **Secondary Objective 1:** Total SKUs and Average On-Time Rate by Supplier
- **Secondary Objective 2:** Total Inventory Value and SKU Count by ABC Class
- **Secondary Objective 3:** Expiry Risk by Category — Total SKUs Expiring Soon
-  **Secondary Objective 4:** : Warehouse Stock Summary — Total QOH and Average Stock Age
-  **Secondary Objective 5:** Suppliers with Average Lead Time Above 5 Days (HAVING)
-   **Secondary Objective 6:** Calculated Column — Total Stock Value at Risk per Category



---

## 3. Tools



### Tools & Technologies

<!--
  List only what you actually used on this project.
  This is not your skills section - it's the project's technical context.
-->

| Category | Tool(s) Used |
|----------|-------------|
| Data Storage | CSV files |
| Data Processing | SQL, Excel |
| Analysis | Custom SQL queries] |
| Visualization | Power BI, Looker |
| Version Control | Git / GitHub |
| Documentation | Github |
| Other | N/A |

---

## 4. Repository Structure

```
[project-root]/
│
├── data/
│   ├── raw/                  # Original, unmodified source data - never edited
│   ├── processed/            # Cleaned and transformed data
│   └── external/             # Reference data, lookup tables, third-party files
│
├── notebooks/                # Jupyter, R Markdown, or Colab notebooks
│
├── scripts/                  # Reusable .py, .R, or .sh processing files
│
├── queries/                  # SQL files (retain this folder for SQL-heavy projects)
│   ├── exploratory/          # Ad-hoc or investigative queries
│   ├── transformations/      # Cleaning and reshaping logic
│   └── final/                # Production-ready or presentation queries
│
├── reports/                  # Final outputs: PDFs, slide decks, Word docs
│
├── visuals/                  # Exported charts, dashboard screenshots, ERD diagrams
│
├── docs/                     # Data dictionaries, schema notes, reference material
│
├── project_metadata.yml      # Machine-readable metadata (optional)
└── README.md                 # You are here
```

> ⚠️ *Delete folders you didn't use. An empty folder is worse than no folder.*
> SQL-heavy projects: keep `queries/`. Analysis-only projects: keep `notebooks/`. Both? Keep both.

---

## 5. Data Workflow

<!--
  Show how data moved through your project - from source to output.
  Every transformation decision should be traceable here.

  WHAT GOOD LOOKS LIKE:
  1. Source: "Monthly CSV exports pulled from the internal POS system.
              Five files, one per region, covering Jan 2023–Jun 2024."
  2. Ingestion: "Loaded into Python using pandas. Files concatenated into
                 a single dataframe (approx. 340,000 rows)."
  3. Cleaning: "Removed 1.2% of rows with null transaction IDs.
                Standardised date formats across regional files.
                Resolved product category naming inconsistencies (3 variants → 1)."
  4. Transformation: "Created a returns_rate field at product-category level.
                      Aggregated to weekly and regional grain for trend analysis."
  5. Analysis: "Descriptive statistics, regional comparison, return rate
                segmentation by product category."
  6. Output: "Summary report (PDF), annotated notebook, processed CSV."

  WHAT TO AVOID:
  ❌ "Data was cleaned and analysed." (No chain. No decisions. No trust.)
-->

```
[Data Source(s)]
      ↓
[Ingestion / Collection Method]
      ↓
[Cleaning & Transformation]
      ↓
[Analysis / Modelling / Querying]
      ↓
[Output / Visualisation / Reporting]
```

1. **Source:** Dataset sourced from Kaggle — E-Grocery inventory dataset. Single CSV file (E-Grocery_company.csv) covering inventory records across 5 warehouses and 10 product categories, 997 rows and 37 columns.
2. **Ingestion:** Opened in Microsoft Excel. Identified semicolon ";" as the delimiter and re-opened the file with the correct separator to expose all 37 columns into a readable table format.
3. **Cleaning:** Removed dollar signs from Unit_Cost_USD, Last_Purchase_Price_USD, and Total_Inventory_Value_USD columns. Removed percentage symbols from Supplier_OnTime_Pct, Audit_Variance_Pct, and Demand_Forecast_Accuracy_Pct. Verified no duplicate SKU_IDs and no null values in key aggregation columns.
4. **Transformation:** Imported cleaned CSV into MySQL. Created aggregated query outputs grouping by Supplier_Name, Category, ABC_Class, and Warehouse_Location. Calculated a stock value column at query level using Quantity_On_Hand multiplied by Unit_Cost_USD.
5. **Analysis:** Supplier on-time performance ranked by average delivery rate. Expiry risk quantified by category. Inventory value distribution validated against ABC classification. Warehouse stock age compared across all five fulfilment centres.
6. **Output:** Summary findings document (Github), SQL query file (.sql) with commented business questions, Power BI dashboard with aggregated visuals.

---

## 6. Data Model & Schema

<!--
  Define your fields so that someone reading your analysis can follow along
  without digging through your code.

  WHAT GOOD LOOKS LIKE (one row example):
  | transaction_id | string | Unique identifier per sales transaction | TXN-00482 |
  | return_flag    | boolean | Whether the transaction included a return | TRUE |
  | region_code    | string | Two-letter identifier for store region | "NE" |

  WHAT TO AVOID:
  ❌ Skipping this section because "the field names are self-explanatory."
     They're not. Not to a reviewer. Not to you in six months.

  📌 FOR SQL PROJECTS: If you have multiple tables, create one block per table.
     Describe join keys and relationships here. Your ERD (Section 7) will
     visualise what this section describes in text.

  📌 FOR NON-SQL PROJECTS: Describe the shape of your dataset informally
     if a formal schema doesn't apply. Even one paragraph is more helpful than nothing.
-->

### Dataset / Table: `grocery`

| Field Name | Data Type | Description | Example Value |
|------------|-----------|-------------|---------------|
| SKU_ID | string | Unique product identifier] | SKU0001 |
| Quantity_On_Hand | int | Physical units in stock | 359 |
| Unit_Cost_USD | Float| Cost per unit in USD | 5.81 |

> **Row count (approx.):** 997
> **Date range:** 2025/01/17 – 2025/09/08





---


## 7. Analysis & Metrics

<!--
  Explain what you measured and how - before you share what you found.

  WHAT GOOD LOOKS LIKE:
  Metric: "Customer Return Rate"
  Definition: "Number of transactions flagged as returns divided by total
               transactions, calculated at product-category and regional grain."
  Why It Matters: "Return rate - not sales volume - was hypothesised to
                  explain regional revenue gaps. This metric tests that hypothesis."

  WHAT TO AVOID:
  ❌ Defining a metric only in code: SUM(returns) / COUNT(transaction_id)
     That's an implementation. Write the plain-language definition here.
     Both belong in your project - the definition in the README,
     the implementation in the code.
-->

### Analytical Approach
I took a took an exploratory approach for this peoject. The goal was to summarise a flat inventory dataset to surface patterns that are invisible at the row level. The analysis used SQL aggregation to group 997 SKU records by supplier, category, ABC class, and warehouse, then identified where performance gaps and stock risks were concentrated.
### Key Metrics Defined

| Metric | Plain-Language Definition | Why It Matters |
|--------|--------------------------|----------------|
| `Avg Supplier On-Time Rate` | The average percentage of deliveries a supplier made on time, across all their SKUs | Identifies which vendors are causing delays that put stock availability at risk |
| `Total Inventory Value by ABC Class` | The sum of all on-hand stock value grouped by A, B, or C priority class | Confirms whether high-priority items are driving the majority of capital as expected |
| `Expiring SKU Count by Category` | The number of SKUs flagged as Expiring Soon within each product category | Shows which categories carry the highest spoilage and write-off risk |
| `Average Stock Age by Warehouse` | The mean number of days stock has been held per fulfilment centre | Identifies warehouses holding old stock that needs a clearance push |
| `Calculated Stock Value` | Quantity On Hand multiplied by Unit Cost per category | Gives a ground-up financial view of stock exposure independent of recorded values |
### Methods Used

- SQL aggregation. GROUP BY with COUNT, SUM, AVG, MIN, MAX, and ROUND.
- HAVING clause filtering. Used to isolate suppliers whose average lead time exceeded a threshold after grouping.
- Data cleaning in Excel. Currency symbols, decimal separator conflicts, and percentage symbols resolved before import.
  

---

## 8. Key Insights

<!--
  Findings + implications. Not just what happened - what it means.

  WHAT GOOD LOOKS LIKE:
  ✅ "Return rates, not sales volume, explain Region A's underperformance.
      Region A's return rate on home goods was 34% - more than double the
      company average. Revenue was not lost at the point of sale; it was
      lost post-sale through refunds. This points to a fulfilment or
      product quality issue specific to that region, not a demand problem."

  WHAT TO AVOID:
  ❌ "Region A had lower revenue than other regions in Q4."
     (That's an observation. It describes what happened.
      An insight says what it means and where to look next.)

  Aim for 3–6 insights. Quality over quantity.
-->

**Insight 1: Fresh Produce and Meat carry the highest expiry risk**
When SKUs flagged as Expiring Soon are grouped by category, Fresh Produce leads with 81 expiring SKUs followed by Meat at 70 and Dairy at 66. These three perishable categories account for the majority of FreshLink's spoilage exposure and should be prioritised for immediate markdown or promotional activity.

**Insight 2: All suppliers have similar on-time rates**
Supplier on-time rates range closely from 84.03% by PT Nusantara Supplier to 85.66% by PT Indo Fresh. By the query no supplier is underperforming, no supplier is meeting the 95% strategic target either. Meaning the entire supplier base needs improvement.

**Insight 3: A-class items dominate inventory value as expected**
A-class holds $67.4M in total inventory value across 200 SKUs, B-class holds $38.9M across 299 SKUs, and C-class holds $16.6M across 498 SKUs. The 80/20 principle is broadly confirmed.

---

## 9. Recommendations

<!--
  Action-oriented. Addressed to a real audience.
  Tied explicitly to the insight that supports each one.

  WHAT GOOD LOOKS LIKE:
  Priority: High
  Recommendation: "Conduct a fulfilment audit for home goods deliveries
                   in Region A - specifically investigating whether returns
                   correlate with a particular warehouse, carrier, or SKU batch."
  Based On: Insight 1 - return rate anomaly in Region A
  Owner: Operations / Supply Chain team

  WHAT TO AVOID:
  ❌ "Improve the return rate."
     (Not actionable. Doesn't say who, how, or where to start.)
  ❌ "Further analysis is needed."
     (This is a placeholder, not a recommendation.)
-->

| Priority | Recommendation | Based On | Suggested Owner |
|----------|---------------|----------|-----------------|
| High | Trigger immediate markdowns or flash promotions for fresh Produce and meat before stock expires and is written off | UC-03. Expiry risk by category | Category Managers  |
| Medium | Investigate why Personal Care holds $204,805 in calculated stock value and assess whether this capital is tied up in slow-moving SKUs | UC-06. Calculated stock value by category | Rizky |
| Low | Initiate a supplier performance improvement programme across all 10 vendors, no supplier is meeting the 95% on-time target  | UC-01. Supplier on-time rates | Procurement Team |

---


## 10. Deliverables

| Deliverable | Description | Location |
|-------------|-------------|----------|
| SQL query file | All 6 use case queries with business question comments | [`/path/to/file`] |
| Cleaned dataset | E-Grocery CSV with currency symbols, decimal separators, and % signs removed | [`/path/to/file`] |
| PowerBI report | Dashboard with aggregated visuals for supplier, category, warehouse, and ABC analysis | [`/path/to/file`] |
| User requirement document] | Stakeholder requirements, use cases, and data quality checks for Week 2 project | `docs/FreshLink_Week2_URD.docx` |

---

## 11. Author

****Kgomotso Mokhoro****
BCom: Supply chain Managemnt graduate

- 🔗 https://www.linkedin.com/in/kgomotso-mokhoro-399660225
- 💼 https://github.com/KgomotsoMokhoro
- 📧 Mokhoro59@gmail.com

---

*Last updated: May 2026*

