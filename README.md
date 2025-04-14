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
&nbsp;&nbsp;&nbsp;&nbsp;[5.1. Trends in Quantity, Sales, and Orders ](#key-highlights) <br>
&nbsp;&nbsp;&nbsp;&nbsp;[5.2. Product Category Insights](#product-category-insights) <br>
&nbsp;&nbsp;&nbsp;&nbsp;[5.3. Product-Specific Trends](#product-specific-trends) <br>
&nbsp;&nbsp;&nbsp;&nbsp;[5.4. Geographic Breakdown](#geographic-breakdown) <br>
[6. Recommendations](#recommendations) <br>

---

## 1. Project Background <a name="project-background"></a>  
<a href="#toc">[ back to contents ]</a>

<p align="justify"> 
This project analyzes Apple product sales data from 2019 to 2022, with the primary objective of understanding trends in quantity sold across time, product categories, and geographic regions. SQL was used for data extraction, cleaning, and transformation, while Power BI served as the visualization tool for deriving insights and presenting trends. The goal is to uncover actionable patterns that can guide strategic pricing, product positioning, and region-specific marketing.
</p>

## 2. Executive Summary <a name="executive-summary"></a>  
<a href="#toc">[ back to contents ]</a>

<p align="justify"> 
This report presents an analysis of Apple product sales from 2019 to 2022, with a primary focus on quantity sold, complemented by revenue and ordering behavior across time, product categories, and regions. While unit sales showed relative stability over the years, 2022 marked a decline in quantity sold—yet total revenue continued to rise. This contrast highlights Apple’s growing reliance on premium pricing strategies, particularly through high-end models like the iPhone 14. Purchasing patterns also reveal that most customers opted for single-item transactions in 2021 and 2022, suggesting a preference for personal, high-investment purchases rather than bulk buying. </p>

<p align="justify"> 
Beyond general trends, category-level shifts and geographic performance provide deeper insight. Smartphones remained dominant in most years but briefly lost ground in 2021, when Airtags surged in popularity. Laptops and tablets maintained steady demand, with laptops seeing increased traction in the last two years. On the regional front, the United States led all markets in quantity sold, with cities like Glenade, Brooklyn, and New York emerging as local sales hotspots. These findings suggest clear next steps: introduce more accessible product tiers to retain sales volume, expand the accessory line to capture repeat purchases, and activate localized marketing strategies in high-converting regions.
</p>

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

### 5.1. Trends in Quantity, Sales, and Orders <a name="key-highlights"></a> <a href="#toc">[↑]</a>

<p align="justify"> 
The KPI dashboard offers a snapshot of overall performance, highlighting a subtle but important shift in Apple’s sales dynamics in 2022. Compared to the previous year, total quantity sold and total orders both declined by 3.2%, yet total sales rose sharply by 29.4%, reaching $163 million, with average sales per transaction climbing 94.1%. This signals a revenue boost driven more by premium pricing than increased unit volume—a trend that may reflect consumer preference for high-end models, but also hints at growing price sensitivity.
</p>
<div align="center" style="margin-top: -10px; margin-bottom: 10px;">
  <img src="https://github.com/user-attachments/assets/f5ef8923-e609-465e-baea-03e2b8330fed" width="75%">
</div>

<p align="justify"> 
This narrative is further supported by time-based trends. A multi-year view of quantity sold by quarter reveals a consistent quarterly increase across most years, except for 2020, which showed a decline—likely influenced by global disruptions. In a closer breakdown of sales performance per year, the data reveals that sales generally scale with higher quantities sold, but 2022 stands out for achieving higher sales despite the lower number of quantity sold from last year. While this surge in revenue is impressive, it underscores a growing reliance on premium pricing—a strategy that may not be sustainable if volume continues to drop.
</p>
<div align="center" style="margin-top: -10px; margin-bottom: 15px;">
  <img src="https://github.com/user-attachments/assets/d91e5db1-5722-4290-8795-3bc800cc997e" width="75%">
</div>

<div style="margin-top: -10px; margin-bottom: 10px;">
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

<p align="justify"> 
A closer look at product categories reveals more nuanced consumer shifts. Smartphones were the top-selling category in 2019, 2020, and 2022, but their dominance slipped in 2021 when Airtags unexpectedly topped the charts—selling nearly twice as much as the next best category. This temporary surge demonstrates the strong potential of accessory-led growth, even when core device sales fluctuate. </p>

<p align="justify"> 
Tablets and laptops maintained consistent 2nd and 3rd place positions, with laptops showing increased performance in 2021 and 2022. This sustained demand for productivity devices signals an opportunity to further develop non-smartphone segments, while the volatility of Airtag sales suggests that accessory success hinges on timing, utility, and refresh cycles. </p>
<div align="center" style="margin-top: -10px; margin-bottom: 10px;">
  <img src="https://github.com/user-attachments/assets/0fb2ff90-ed45-4afa-b31c-bad9bb024233" width="40%">
</div>


### 5.3. Product-Specific Trends <a name="product-specific-trends"></a> <a href="#toc">[↑]</a>

<p align="justify"> 
Top-performing products reinforce the earlier patterns. The iPhone Xs (2020) and iPhone 14 (2022) were standout models, driving substantial revenue despite not breaking quantity records. The iPad 6th Gen in 2020 remains the highest-selling tablet, followed by the iPad Pro (M2) in 2022—which didn’t quite match the earlier peak, suggesting softening interest in newer tablet variants. </p>

<p align="justify"> 
Meanwhile, Airtags surged in 2021 but declined sharply the following year, likely due to market saturation or a lack of need for repeat purchases. This shows how accessories can generate momentum but may require strategic updates or bundling to remain relevant. To fully capitalize on their potential, the accessory lineup needs to be refreshed regularly and aligned with customer utility. </p>
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

<p align="justify"> 
Regionally, the United States consistently emerged as Apple’s top-performing market from 2019 to 2022, followed by China, Germany, and France. Within the U.S., cities such as Glenade, Brooklyn, and New York recorded the highest volume of sales, confirming them as key revenue-generating hubs. </p>

<p align="justify"> 
These localized patterns reveal clear opportunities. Instead of relying solely on broad national campaigns, Apple can implement hyper-targeted strategies—focusing marketing, promotions, or event-based outreach in cities where engagement is already high. Strengthening these top-performing zones could create compounding growth effects. </p>
<div align="center" style="margin-top: -10px; margin-bottom: 10px;">
  <img src="https://github.com/user-attachments/assets/c753746d-089d-484d-aa12-3797ad581b17" width="90%">
</div>


## 6. Recommendations <a name="recommendations"></a> 
<a href="#toc">[ back to contents ]</a>

- <p align="justify"> <strong>Introduce More Accessible Product Tiers.</strong> 
  Address the dip in quantity sold by launching mid-range alternatives to flagship models or enhancing trade-in and financing options. This ensures broader reach without diluting brand value, especially in price-sensitive markets. </p>

- <p align="justify"> <strong>Expand and Strategically Refresh Accessory Lines.</strong> 
  Build on the momentum shown by Airtags in 2021 by releasing new accessories with strong utility or lifestyle appeal. Offer curated bundles or limited-edition drops to drive repeat purchases and complement mainline product sales. </p>

- <p align="justify"> <strong>Deploy Localized Campaigns in High-Performing Markets.</strong> 
  Reinforce Apple’s presence in top-performing U.S. cities like Glenade, Brooklyn, and New York by investing in geo-targeted marketing, exclusive regional offers, or experiential events to maximize impact where demand is already proven. </p>
