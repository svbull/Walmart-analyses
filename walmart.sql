select * from walmart;

-- How many unique cities does the data have?
select distinct city as cities from walmart;

-- How many unique product lines does the data have?
select count(distinct Product_line) as Numbers from walmart ;

-- What is the most selling product line.
select sum(Quantity) as 'No.',Product_line from walmart group by Product_line order by sum(Quantity)  desc;

-- What is the most common payment methord.
select Payment,count(payment) as payment_methords from walmart group by payment;

-- What is the total revenue by month
select round(sum(Total),2) as revenue ,Month_name from (select *,monthname(date) as Month_name from walmart) as a group by Month_name;

-- What month had the largest COGS?
select round(sum(cogs),2) as revenue,month_name from (select *,monthname(date) as Month_name from walmart) as a group by month_name;

-- What product line had the largest revenue?
select product_line,round(sum(Total),2) as revenue from walmart group by Product_line order by sum(unit_price*quantity) desc;

-- What is the city with the largest revenue?
select city, round(sum(total),2) as revenue from walmart group by city order by revenue desc;

-- Which branch sold more products than average product sold?
select branch,sum(quantity) as Product_sold from walmart group by branch having sum(quantity)> (select avg(quantity) from walmart) ;

-- Fetch each product line and add a column to those product line showing "Good", "Bad". Good if its greater than average sales
SELECT product_line,ROUND(AVG(total),2) AS avg_sales,CASE WHEN AVG(total) > (SELECT AVG(total) FROM walmart) THEN "Good" ELSE "Bad" END AS Remarks FROM walmart GROUP BY product_line;

-- What is the most common product line by gender?
select gender,product_line,count(quantity) as No from walmart group by 1,2 order by no desc ;

-- What is the average rating of each product line
select product_line,round(avg(Rating),1) as rating from walmart group by product_line order by rating  desc;

-- Number of sales made in each time of the day per weekday
SELECT DAYNAME(date) AS weekday, HOUR(time) AS hour_of_day, COUNT(*) AS num_sales FROM walmart GROUP BY weekday, hour_of_day ;

-- Which of the customer types brings the most revenue?
select customer_type,round(sum(total),2) as Total from walmart group by customer_type;

-- Which city has the largest tax percent/ VAT (Value Added Tax)?
SELECT city,ROUND(AVG(tax_5),2) AS avg_tax_pct FROM sales GROUP BY city ORDER BY avg_tax_pct DESC;

-- Which customer type pays the most in VAT?
SELECT	customer_type,	AVG(tax_pct) AS total_tax FROM sales GROUP BY customer_type ORDER BY total_tax;

-- How many unique payment methods does the data have?
select distinct payment,count(payment) as Total from walmart group by payment;

-- What is the gender of most of the customers?
select gender,count(*) from walmart group by gender;
-- What is the gender distribution per branch?
select branch,gender,count(*) as Total from walmart group by branch,gender;

-- Which time of the day do customers give most ratings?
select hour(time) as 'time',count(rating) as rating from walmart group by time order by rating desc;







