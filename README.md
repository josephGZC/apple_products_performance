# Apple Products Perfomance Analysis


<div align="center">
  <img src="https://github.com/user-attachments/assets/d9d9308c-8421-4fd8-b460-5200d29014e3" width="100%">
</div>

> link to the dashboard →  <a href="https://app.powerbi.com/view?r=eyJrIjoiNjZmMzJiYzItMmIyYS00ZWNjLTliNDUtYzQ0ZDdmZTg0ZTlhIiwidCI6ImJkMDNhNzM1LTJhYTMtNGNjYS05NzIyLTJhZTQ5MjlhYjNlYyIsImMiOjEwfQ%3D%3D" target="_blank">Power BI Report</a> <br>
> link to the code →  <a href="https://github.com/josephGZC/airbnb_revenue_analysis/blob/015a0bcac33a18d751b00b4cf578643d3f68a9ad/data_cleaning_and_exploration.sql" target="_blank"> SQL Data Cleaning and Exploratory Analysis</a>

## Table of Contents <a name="toc"></a>

[1. Project Background](#project-background) <br>
[2. Executive Summary](#executive-summary) <br>
[3. Data Cleaning and Preprocessing](#data-cleaning) <br>
[4. Insights Deep-Dive](#insights-deep-dive) <br>
&nbsp;&nbsp;&nbsp;&nbsp;[4.1. Key Highlights](#key-highlights) <br>
&nbsp;&nbsp;&nbsp;&nbsp;[4.2. Product Category Insights](#product-category-insights) <br>
&nbsp;&nbsp;&nbsp;&nbsp;[4.3. Product-Specific Trends](#product-specific-trends) <br>
&nbsp;&nbsp;&nbsp;&nbsp;[4.4. Geographic Breakdown](#geographic-breakdown) <br>
[5. Recommendations](#recommendations) <br>

---

## 1. Project Background <a name="project-background"></a>  
<a href="#toc">[ back to contents ]</a>

This project analyzes Apple product sales data from 2019 to 2022, with the primary objective of understanding trends in quantity sold across time, product categories, and regions. Using SQL for data extraction and Power BI for dashboard development, the goal was to uncover patterns that inform strategic pricing, product focus, and regional marketing efforts.

## 2. Executive Summary <a name="executive-summary"></a>  
<a href="#toc">[ back to contents ]</a>

This report presents an analysis of Apple product sales over four years, focusing on quantity sold as the primary metric, while also exploring supporting sales and order data across time, products, and geographies.

Key findings reveal that while total quantity sold decreased, total revenue continued to grow, driven largely by premium-priced models like the iPhone 14. Most orders involved single-item purchases, and product category performance shifted, with accessories like Airtags briefly outperforming smartphones. Geographically, the United States dominated sales, particularly in cities like Glenade, Brooklyn, and New York.

## 3. Data Cleaning and Preprocessing <a name="data-cleaning"></a>  
<a href="#toc">[ back to contents ]</a>

SQL was used to validate, clean, and standardize all datasets before analysis and visualization. Below are the key steps and results:

### Searching for Duplicate and Missing Values

- To identify duplicates, the query grouped rows based on key identifiers (e.g., `product_id`, `sale_id`) using `HAVING COUNT(*) > 1`.  
  ✅ No duplicate records were found in any of the tables.

- Missing values were assessed using `COUNT(*) - COUNT(column_name)` for null checks and `LTRIM(RTRIM(column_name)) = ''` to identify blank but non-null entries.  
  ✅ No missing or empty values were detected in essential fields.

### Data Standardization

- Whitespace trimming and formatting adjustments were applied to text fields for consistency.
- `launch_date`, `sale_date`, and `claim_date` were converted into proper `DATE` types using `CONVERT(DATE, column_name, 120)`.
- Invalid placeholders such as sales dated in the year 1900 were filtered out to preserve time-based accuracy.

### Data Type Conversion

- Fields like `price` and `quantity` were originally stored as strings and were converted to `INT` using `CAST()` to ensure accurate aggregation and computation.
- Cleaned versions of the data were stored as views (`products_modified`, `sales_modified`, and `warranty_modified`) for use in downstream analysis and dashboard integration.

## 4. Insights Deep-Dive <a name="insights-deep-dive"></a>  
<a href="#toc">[ back to contents ]</a>

### 4.1. Key Highlights <a name="key-highlights"></a> <a href="#toc">[↑]</a>

- Total quantity sold decreased from the previous year, yet total sales increased, suggesting a shift toward higher-priced products.
- In 2021 and 2022, the number of orders matched the quantity sold, indicating that most transactions involved single-item purchases.
- Only 2020 experienced a quarterly decline in quantity sold, likely due to global disruptions, while all other years showed stable or growing trends.
- There is a positive correlation between total sales and quantity sold, although revenue growth in some years was driven more by premium pricing (e.g., iPhone 14) than sales volume.

### 4.2. Product Category Insights <a name="product-category-insights"></a> <a href="#toc">[↑]</a>

- Smartphones led product category sales in 2019, 2020, and 2022, but dropped to 4th place in 2021, when Airtags topped the charts—selling nearly twice as much as the next best category.
- Tablets and laptops consistently ranked 2nd and 3rd, with notable gains in laptop sales in 2021 and 2022.
- For tablets, the iPad 6th Gen (2020) holds the record at 15,000 units sold, followed by the iPad Pro (M2, 11-inch) with 10,000 units in 2022, still below the 2020 peak.

### 4.3. Product-Specific Trends <a name="product-specific-trends"></a> <a href="#toc">[↑]</a>

- iPhone 14 (2022) and iPhone Xs (2020) were top-performing models in their respective years.
- Airtags, which dominated in 2021, saw a sharp drop in 2022, suggesting market saturation or a short-lived demand cycle.

### 4.4. Geographic Breakdown <a name="geographic-breakdown"></a> <a href="#toc">[↑]</a>

- The United States remained the #1 market across all years, followed by China, Germany, and France.
- Within the U.S., the cities of Glenade, Brooklyn, and New York recorded the highest unit sales, indicating strong localized demand that could benefit from targeted promotions or supply focus.

## 5. Recommendations <a name="recommendations"></a> 
<a href="#toc">[ back to contents ]</a>

- **Balance Premium Pricing with Demand Sensitivity**  
  While high-end models like the iPhone 14 have driven strong revenue, the lower quantity sold may indicate price resistance. Future strategies should weigh profit margins against market demand, potentially introducing more mid-tier options or trade-in incentives to retain sales volume.

- **Expand Accessory Product Lines**  
  The 2021 performance of Airtags highlights the potential for accessory-led growth. Apple could explore bundling strategies, new utility-based accessories, or seasonal launches to sustain engagement in this space.

- **Target High-Performing Regions**  
  With cities like Glenade, Brooklyn, and New York leading in unit sales, Apple can benefit from localized marketing, event-based promotions, or exclusive regional offers to deepen presence in these high-conversion zones.
