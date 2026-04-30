# 🚗 Car Sales Data Analysis — SQL & Power BI

![MySQL](https://img.shields.io/badge/MySQL-Workbench-4479A1?style=flat&logo=mysql&logoColor=white)
![Power BI](https://img.shields.io/badge/Power%20BI-Dashboard-F2C811?style=flat&logo=powerbi&logoColor=black)
![GitHub](https://img.shields.io/badge/GitHub-Portfolio-181717?style=flat&logo=github&logoColor=white)
![Status](https://img.shields.io/badge/Status-Completed-brightgreen?style=flat)
![Project](https://img.shields.io/badge/Type-Internship%20Portfolio-blueviolet?style=flat)

> An end-to-end **Data Analyst project** performing car inventory analysis, brand performance comparison, transmission & engine-type insights, and revenue forecasting — built using **MySQL** for querying and **Power BI** for interactive dashboard visualization.

---

## 📌 Project Highlights

| Metric | Value |
|---|---|
| 🏢 Total Brands Analysed | 7 (Mercedes, Nissan, Tesla, BMW, Kia, Toyota, Hyundai) |
| 💰 Total Revenue | Rs. 9.3905 Billion |
| 🚘 Avg Revenue per Car | Rs. 18.93 Million |
| 📦 Available Stock | 176 Cars |
| ✅ Sold Cars | 164 Cars |
| 🔖 Reserved Cars | 156 Cars |
| 🏆 Top Brand (Revenue) | Mercedes — Rs. 472.8M |
| ⚡ Fastest Growing | Tesla (EV demand surge) |

---

## 🗂️ Repository Structure

```
car-sales-analysis/
│
├── car_data_in_sql.sql             # All SQL queries (cleaning + analysis)
├── car_data_sheet.csv              # Raw dataset (source file)
├── Car_Sales_Dashboard.pbix        # Power BI dashboard file
├── Car_Sales_Analysis_Report.docx  # Full project report
└── README.md
```

---

## 🎯 Objectives

- Analyze **brand-wise car inventory** and stock levels
- Compare **total & average revenue** across different brands
- Understand **transmission type distribution** (Automatic vs Manual)
- Track **car availability status** — Available, Sold, Reserved
- Identify **popular engine types** and their price impact
- Present all findings through an **interactive Power BI dashboard**

---

## 🛠️ Tools & Technologies

| Tool | Purpose |
|---|---|
| **MySQL Workbench** | Writing & executing SQL queries, data cleaning |
| **Microsoft Power BI** | Interactive dashboard & KPI visualisation |
| **GitHub** | Version control & project sharing |
| **Excel / CSV** | Raw data storage and import |

---

## 📋 Dataset Description

| Column | Description |
|---|---|
| `Car_ID` | Unique identifier for each car |
| `Brand` | Manufacturer / brand name |
| `Model` | Specific model of the car |
| `Year` | Manufacturing year |
| `Color` | Exterior colour |
| `Engine_Type` | Petrol, Diesel, Electric, Hybrid |
| `Transmission` | Automatic / Manual |
| `Quantity_in_Stock` | Units available in inventory |
| `Status` | Available / Sold / Reserved |
| `Price` | Selling price (INR) |

---

## 🧹 Data Cleaning

Before analysis, the dataset was cleaned using SQL:

```sql
-- Remove blank/null brand rows
DELETE FROM car_data_sheet
WHERE brand IS NULL OR brand = '';

-- Standardise transmission values
UPDATE car_data_sheet
SET Transmission = 'Automatic'
WHERE Transmission = 'auto' OR Transmission = 'A';

UPDATE car_data_sheet
SET Transmission = 'Manual'
WHERE Transmission = 'M' OR Transmission = 'manaul';
```

**Cleaning steps performed:**
- Removed NULL and empty-string rows across key columns
- Standardised inconsistent `Transmission` entries (`auto`, `A`, `M`, `manaul`)
- Verified data types for numeric fields (`Price`, `Year`, `Quantity`)
- Validated `Car_ID` for null records

---

## 🔍 SQL Analysis

### Query 1 — Brand-wise Total Stock

```sql
SELECT Brand, SUM(Quantity_in_stock) AS total_stock
FROM car_data_sheet
GROUP BY Brand
ORDER BY total_stock DESC;
```

| Brand | Total Stock |
|---|---|
| Mercedes | 793 |
| Nissan | 782 |
| Tesla | 776 |
| Toyota | 699 |
| BMW | 670 |
| Kia | 657 |
| Hyundai | 543 |

> 💡 **Insight:** Mercedes leads inventory (793 units); Hyundai has the lowest stock (543 units).

---

### Query 2 — Brand-wise Total Sales Revenue

```sql
SELECT Brand, SUM(price) AS total_sales
FROM car_data_sheet
GROUP BY Brand
ORDER BY total_sales DESC;
```

| Brand | Total Sales (INR) |
|---|---|
| Mercedes | 472,858,099 |
| Nissan | 451,769,752 |
| Toyota | 432,334,316 |
| Tesla | 420,124,968 |
| BMW | 414,088,538 |
| Kia | 405,200,871 |
| Hyundai | 352,631,885 |

> 💡 **Insight:** Mercedes leads revenue at Rs. 472.8M; Hyundai has the lowest at Rs. 352.6M.

---

### Query 3 — Transmission Type Distribution

```sql
SELECT transmission, COUNT(*) AS count
FROM car_data_sheet
GROUP BY transmission;
```

| Transmission | Count |
|---|---|
| Manual | 251 |
| Automatic | 245 |

> 💡 **Insight:** Near-equal market split — Manual (251) slightly edges Automatic (245).

---

### Query 4 — Car Status Distribution

```sql
SELECT status, COUNT(*) AS total
FROM car_data_sheet
GROUP BY status;
```

| Status | Total |
|---|---|
| Available | 176 |
| Sold | 164 |
| Reserved | 156 |

> 💡 **Insight:** 176 cars available, 164 sold, and 156 reserved — healthy inventory movement.

---

### Query 5 — Engine Type Analysis

```sql
SELECT Engine_type, COUNT(Engine_Type) AS total, ROUND(AVG(price), 2) AS avg_price
FROM car_data_sheet
GROUP BY engine_type;
```

| Engine Type | Total | Avg Price (INR) |
|---|---|---|
| Petrol | 132 | 6,003,933 |
| Electric | 128 | 5,898,016 |
| Diesel | 124 | 5,699,229 |
| Hybrid | 112 | 6,203,917 |

> 💡 **Insight:** Petrol is most common (132 units); Hybrid commands the highest average price (Rs. 6.2M).

---

## 📊 Power BI Dashboard

An interactive **CAR SALES DASHBOARD** was built on a dark-themed interface.

### KPI Cards

| KPI | Value |
|---|---|
| Total Revenue | Rs. 9.3905 Billion |
| Expected Revenue | Rs. 8.732 Billion |
| Available Stock | 176 Cars |
| Sold Cars | 164 Cars |
| Avg Revenue per Car | Rs. 18.93 Million |

### Dashboard Visuals

| Visual | Chart Type | Key Finding |
|---|---|---|
| Cars Status Distribution | Pie Chart | Available 35.48% \| Sold 33.06% \| Reserved 31.45% |
| Engine Type Distribution | Donut Chart | Petrol 26.61% \| Electric 25.81% \| Diesel 25% \| Hybrid 22.58% |
| Brand-wise Revenue | Horizontal Bar Chart | All 7 brands compared (0 to 2Bn range) |
| Year-wise Revenue Trend | Area Line Chart | Revenue from 2015–2025 with peak ~2018 |

### Interactive Slicers
- **Year** — Filter by manufacturing year
- **Brand** — Filter by car brand
- **Engine Type** — Filter by Petrol / Diesel / Electric / Hybrid
- **Stock Alert** — Filter by availability status

---

## 🔮 Future Predictions (2026–2028)

### Revenue Forecast

| Year | Predicted Revenue | Growth Rate |
|---|---|---|
| 2026 (Baseline) | Rs. 9.39 Billion | — |
| 2026 (End) | Rs. 10.1–10.5 Billion | +7% to +12% |
| 2027 | Rs. 11.2–12.0 Billion | +10% to +14% |
| 2028 | Rs. 12.5–13.8 Billion | +12% to +15% |

### Engine Type Market Share Shift

| Engine Type | Current Share | Predicted 2028 |
|---|---|---|
| Electric | 25.81% | 32–35% ⬆️ |
| Hybrid | 22.58% | 26–28% ⬆️ |
| Petrol | 26.61% | 23–25% ⬇️ |
| Diesel | 25.00% | 14–17% ⬇️ |

> ⚡ Electric vehicles expected to overtake Petrol by 2027 driven by EV policies and rising fuel costs.

---

## 💡 Key Business Recommendations

- **Increase Tesla & EV inventory** — Demand is rising and will peak by 2027
- **Reduce Diesel procurement** by 20–30% in the next buying cycle
- **Focus on Hyundai marketing** — lowest sales but strong budget-segment potential
- **Launch reservation-to-sale conversion program** to move 156 reserved cars faster
- **Prioritise 2026–2027 expansion** — revenue cycle indicates an upward trend phase

---

## 📈 Key Insights Summary

- 🏆 **Mercedes** leads in both stock (793 units) and total revenue (Rs. 472.8M)
- 📉 **Hyundai** has the lowest stock (543) and lowest revenue (Rs. 352.6M)
- ⚙️ **Manual vs Automatic** transmission is nearly 50-50 — market split is even
- ⚡ **Electric cars** (128 units) are rapidly gaining ground, close behind Petrol
- 💎 **Hybrid engines** command the highest average price at Rs. 6,203,917
- 🔖 **156 reserved cars** likely to convert to Sold within 30–60 days

---

## 🚀 Getting Started

### Prerequisites
- MySQL Workbench 8.0+
- Microsoft Power BI Desktop
- `car_data_sheet.csv` (source dataset)

### Setup

```bash
git clone https://github.com/your-username/car-sales-analysis.git
cd car-sales-analysis
```

1. Open **MySQL Workbench** → Run `car_data_in_sql.sql`
2. Export the cleaned data as CSV
3. Open `Car_Sales_Dashboard.pbix` in **Power BI Desktop**
4. Refresh data source to point to your exported CSV

---

## 📄 License

This project was developed for a **Data Analyst Internship Portfolio** (April 2026).  
For educational and portfolio purposes only.

---

<p align="center">
  Made with ❤️ using MySQL & Power BI &nbsp;|&nbsp; Data Analyst Portfolio Project
</p>
