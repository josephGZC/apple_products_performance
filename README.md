# Apple Products Perfomance Analysis

<div align="center">
  <img src="https://github.com/user-attachments/assets/d9d9308c-8421-4fd8-b460-5200d29014e3" width="100%">
</div>

> link to the dashboard →  <a href="https://app.powerbi.com/view?r=eyJrIjoiMGI2NDgyNjctZDBhOC00MTJmLWI3MTktZDg4ZGZkZWZkZjYzIiwidCI6ImJkMDNhNzM1LTJhYTMtNGNjYS05NzIyLTJhZTQ5MjlhYjNlYyIsImMiOjEwfQ%3D%3D" target="_blank">Power BI Report</a> <br>
> link to the code →  <a href="https://github.com/josephGZC/apple_products_performance/blob/cfc2ff89de6ba1caa0073696678f66ea729d8bb1/apple_project.sql" target="_blank"> SQL Data Cleaning and Exploratory Analysis</a>

## Table of Contents <a name="toc"></a>

[1. Project Background](#project-background) <br>
[2. Executive Summary](#executive-summary) <br>
[3. Dataset Overview](#dataset-overview) <br>
[4. Data Cleaning and Preprocessing](#data-cleaning) <br>
[5. Insights Deep-Dive](#insights-deep-dive) <br>
&nbsp;&nbsp;&nbsp;&nbsp;[5.1. Key Highlights](#key-highlights) <br>
&nbsp;&nbsp;&nbsp;&nbsp;[5.2. Product Category Insights](#product-category-insights) <br>
&nbsp;&nbsp;&nbsp;&nbsp;[5.3. Product-Specific Trends](#product-specific-trends) <br>
&nbsp;&nbsp;&nbsp;&nbsp;[5.4. Geographic Breakdown](#geographic-breakdown) <br>
[6. Recommendations](#recommendations) <br>

---

## 1. Project Background <a name="project-background"></a>  
<a href="#toc">[ back to contents ]</a>

This project analyzes Apple product sales data from 2019 to 2022, with the primary objective of understanding trends in quantity sold across time, product categories, and geographic regions. SQL was used for data extraction, cleaning, and transformation, while Power BI served as the visualization tool for deriving insights and presenting trends. The goal is to uncover actionable patterns that can guide strategic pricing, product positioning, and region-specific marketing.

## 2. Executive Summary <a name="executive-summary"></a>  
<a href="#toc">[ back to contents ]</a>

This report presents an analysis of Apple product sales from 2019 to 2022, with a primary focus on quantity sold, complemented by revenue and ordering behavior across time, product categories, and regions. While unit sales showed relative stability over the years, 2022 marked a decline in quantity sold—yet total revenue continued to rise. This contrast highlights Apple’s growing reliance on premium pricing strategies, particularly through high-end models like the iPhone 14. Purchasing patterns also reveal that most customers opted for single-item transactions in 2021 and 2022, suggesting a preference for personal, high-investment purchases rather than bulk buying.

Beyond general trends, category-level shifts and geographic performance provide deeper insight. Smartphones remained dominant in most years but briefly lost ground in 2021, when Airtags surged in popularity. Laptops and tablets maintained steady demand, with laptops seeing increased traction in the last two years. On the regional front, the United States led all markets in quantity sold, with cities like Glenade, Brooklyn, and New York emerging as local sales hotspots. These findings suggest clear next steps: introduce more accessible product tiers to retain sales volume, expand the accessory line to capture repeat purchases, and activate localized marketing strategies in high-converting regions.

## 3. Dataset Overview <a name="dataset-overview"></a>  
<a href="#toc">[ back to contents ]</a>
<div align="center">
  <img src="https://github.com/user-attachments/assets/6199f61a-2cae-4980-ae78-baa1e3b2a00a" width="75%">
</div>


## 4. Data Cleaning and Preprocessing <a name="data-cleaning"></a>  
<a href="#toc">[ back to contents ]</a>

SQL was used to validate, clean, and standardize all datasets before analysis and visualization. Below are the key steps and results:

### Searching for Duplicate and Missing Values

- To identify duplicates, the query grouped rows based on key identifiers (e.g., `product_id`, `sale_id`) using `HAVING COUNT(*) > 1`. No duplicate records were found in any of the tables.

- Missing values were assessed using `COUNT(*) - COUNT(column_name)` for null checks and `LTRIM(RTRIM(column_name)) = ''` to identify blank but non-null entries. No missing or empty values were detected in essential fields.

### Data Standardization

- Whitespace trimming and formatting adjustments were applied to text fields for consistency.
- `launch_date`, `sale_date`, and `claim_date` were converted into proper `DATE` types using `CONVERT(DATE, column_name, 120)`.
- Invalid placeholders such as sales dated in the year 1900 were filtered out to preserve time-based accuracy.

### Data Type Conversion

- Fields like `price` and `quantity` were originally stored as strings and were converted to `INT` using `CAST()` to ensure accurate aggregation and computation.
- Cleaned versions of the data were stored as views (`products_modified`, `sales_modified`, and `warranty_modified`) for use in downstream analysis and dashboard integration.


## 5. Insights Deep-Dive <a name="insights-deep-dive"></a>  
<a href="#toc">[ back to contents ]</a>

### 5.1. Key Highlights <a name="key-highlights"></a> <a href="#toc">[↑]</a>

- Total quantity sold decreased from the previous year, yet total sales increased, suggesting a shift toward higher-priced products.
- In 2021 and 2022, the number of orders matched the quantity sold, indicating that most transactions involved single-item purchases.
<div align="center" style="margin-top: -10px; margin-bottom: 10px;">
  <img src="https://github.com/user-attachments/assets/f5ef8923-e609-465e-baea-03e2b8330fed" width="75%">
</div>


- Only 2020 experienced a quarterly decline in quantity sold, likely due to global disruptions, while all other years showed stable or growing trends.
<div align="center" style="margin-top: -10px; margin-bottom: 10px;">
  <img src="https://github.com/user-attachments/assets/d91e5db1-5722-4290-8795-3bc800cc997e" width="75%">
</div>


- There is a positive correlation between total sales and quantity sold, although revenue growth in some years was driven more by premium pricing (e.g., iPhone 14) than sales volume.
<div style="margin-top: 10px; margin-bottom: 10px;">
<table cellspacing="0" cellpadding="0">
  <tr>
    <td style="border: 1px solid white; padding: 0px 5px 2px 0px;">
      <img src="https://github.com/user-attachments/assets/c4cb12df-e9dc-4996-8061-f4fb9ff7ed67" width="100%">
    </td>
    <td style="border: 1px solid white; padding: 0px 0px 2px 5px;">
      <img src="https://github.com/user-attachments/assets/3baf3a15-189f-4ce5-ac3d-4374f6ff2da4" width="100%">
    </td>
  </tr>
  <tr>
    <td style="border: 1px solid white; padding: 2px 5px 0px 0px;">
      <img src="https://github.com/user-attachments/assets/6511503b-d29d-4686-82e5-163a67388f7b" width="100%">
    </td>
    <td style="border: 1px solid white; padding: 2px 0px 0px 5px;">
      <img src="https://github.com/user-attachments/assets/9fdfe327-de16-4e82-842a-88e9ce456073" width="100%">
    </td>
  </tr>
</table>
</div>


### 5.2. Product Category Insights <a name="product-category-insights"></a> <a href="#toc">[↑]</a>

- Smartphones led product category sales in 2019, 2020, and 2022, but dropped to 4th place in 2021, when Airtags topped the charts—selling nearly twice as much as the next best category.
- Tablets and laptops consistently ranked 2nd and 3rd, with notable gains in laptop sales in 2021 and 2022.
<div align="center" style="margin-top: -10px; margin-bottom: 10px;">
  <img src="https://github.com/user-attachments/assets/0fb2ff90-ed45-4afa-b31c-bad9bb024233" width="40%">
</div>


### 5.3. Product-Specific Trends <a name="product-specific-trends"></a> <a href="#toc">[↑]</a>

- iPhone 14 (2022) and iPhone Xs (2020) were top-performing models in their respective years.
- Airtags, which dominated in 2021, saw a sharp drop in 2022, suggesting market saturation or a short-lived demand cycle.
- For tablets, the iPad 6th Gen (2020) holds the record at 15,000 units sold, followed by the iPad Pro (M2, 11-inch) with 10,000 units in 2022, still below the 2020 peak.
<div align="center" style="margin-top: -10px; margin-bottom: 10px;">
  <table cellspacing="0" cellpadding="0" style="border-collapse: collapse;">
    <tr>
      <td style="border: 1px solid white; padding: 5px;">
        <img src="https://github.com/user-attachments/assets/4b45490a-f939-4161-bcfe-4c71ac6dbcdb" width="240px">
      </td>
      <td style="border: 1px solid white; padding: 5px;" >
        <img src="https://github.com/user-attachments/assets/78744168-e04c-4cd0-923d-83f5c418ebbd" width="240px">
      </td>
    </tr>
    <tr>
      <td style="border: 1px solid white; padding: 5px;">
        <img src="https://github.com/user-attachments/assets/244f439e-ee87-43e3-9546-fe355692685f" width="240px">
      </td>
      <td style="border: 1px solid white; padding: 5px;">
        <img src="https://github.com/user-attachments/assets/786f3b79-fb5a-4821-b893-deac6468bde9" width="240px">
      </td>
    </tr>
  </table>
</div>


### 5.4. Geographic Breakdown <a name="geographic-breakdown"></a> <a href="#toc">[↑]</a>

- The United States remained the #1 market across all years, followed by China, Germany, and France.
- Within the U.S., the cities of Glenade, Brooklyn, and New York recorded the highest unit sales, indicating strong localized demand that could benefit from targeted promotions or supply focus.
<div align="center" style="margin-top: -10px; margin-bottom: 10px;">
  <img src="https://github.com/user-attachments/assets/c753746d-089d-484d-aa12-3797ad581b17" width="90%">
</div>


## 6. Recommendations <a name="recommendations"></a> 
<a href="#toc">[ back to contents ]</a>

- **Introduce More Accessible Product Tiers**
Address the dip in quantity sold by launching mid-range alternatives to flagship models or enhancing trade-in and financing options. This ensures broader reach without diluting brand value, especially in price-sensitive markets.

- **Expand and Strategically Refresh Accessory Lines**
Build on the momentum shown by Airtags in 2021 by releasing new accessories with strong utility or lifestyle appeal. Offer curated bundles or limited-edition drops to drive repeat purchases and complement mainline product sales.

- **Deploy Localized Campaigns in High-Performing Markets**
Reinforce Apple’s presence in top-performing U.S. cities like Glenade, Brooklyn, and New York by investing in geo-targeted marketing, exclusive regional offers, or experiential events to maximize impact where demand is already proven.
