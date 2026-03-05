# Retail Banking Customer Spending Analysis (SQLite)

## Project Overview

This project analyzes retail banking customer transactions using SQLite.

The goal is to identify high-value customers and understand how customer spending behaviour differs across countries and risk profiles.

The analysis focuses on answering simple business questions that banking teams may ask when evaluating customer behaviour.

---

## Database

Database file used:

```
retail_banking.db
```

Main tables used:

- Customers
- Accounts
- Transactions

To simplify analysis, a SQL view was created to summarize transaction activity for each customer.

---

## Customer Spending View

A reusable view called **v_customer_spending** was created to calculate:

- total accounts per customer
- total number of transactions
- total transaction amount
- average transaction amount
- country and risk rating

This view allows easier analysis without repeatedly joining multiple tables.

---

## Business Question 1  
### Customers Spending Above Their Country Average

**Question**

Which customers spend more than the average customer in their country?

**Approach**

A correlated subquery was used to calculate the average total transaction amount per country and identify customers whose spending exceeds that average.

**Sample Findings**

UK average spending: **209,878**

- Customer_46 spent **391,314**
- Customer_22 spent **390,646**

Canada average spending: **157,760**

- Customer_13 spent **374,255**
- Customer_37 spent **315,826**

USA average spending: **157,219**

- Customer_21 spent **281,899**
- Customer_35 spent **280,026**

**Interpretation**

These customers represent **high-value clients** compared to their peers in the same country. In a real banking environment, this information could support:

- premium customer identification  
- targeted financial products  
- personalized relationship management

---

## Business Question 2  
### Comparing Similar Customers (Self Join)

**Question**

Do customers with the same country and risk rating behave similarly in terms of spending?

**Approach**

A self join was used on the customer spending view to compare customers with identical country and risk rating attributes. The query calculates the difference in total spending between customer pairs.

**Sample Findings**

Canada (High Risk)

- Customer_13 spent **374,255**
- Customer_50 spent **91,192**

Difference: **283,062**

USA (Medium Risk)

- Customer_21 spent **281,899**
- Customer_44 spent **28,206**

Difference: **253,693**

Germany (High Risk)

- Customer_40 spent **311,319**
- Customer_33 spent **75,495**

Difference: **235,824**

**Interpretation**

Even among customers with the same risk category and country, spending behaviour can vary significantly. This may highlight:

- unusually high transaction activity  
- customer segmentation opportunities  
- behavioural outliers

---

## SQL Skills Demonstrated

This project demonstrates the use of:

- SQL Joins
- Self Joins
- Correlated Subqueries
- Aggregation (SUM, AVG, COUNT)
- SQL Views
- SQLite database analysis

---

## Tools Used

- SQLite
- DB Browser for SQLite
- GitHub

---

## Author

Kayode Alatise
