select * from pizza_sales;


!---- select pizza_name_id from pizza_sales;
 

!---KPI's Metrics---Total Revenue
select sum(total_price) as Total_Revenue 
from pizza_sales;


!---KPI's Metrics--- Average Order Value (total price/total order)
select (sum(total_price) / count(distinct order_id)) AS Avg_order_value 
from pizza_sales;


!---KPI's Metrics--- Total Pizzas Sold
select sum(quantity) AS Total_pizzas_sold 
from pizza_sales;


!---KPI's Metrics--- Total Orders
select count(distinct order_id) AS Total_orders 
from pizza_sales;


!---KPI's Metrics--- Average Pizzas Per Order (total number of pizzas sold/ total number of order)
select CAST(cast(sum(quantity) as decimal (10,2))/ cast(count(distinct order_id) as decimal (10,2)) AS DECIMAL(10,2)) AS Avg_pizzas_per_order 
from pizza_sales;


!----------1-Datily Trend for Total Order
select DATENAME(DW,order_date) as Order_day, count(distinct order_id) as total_order
from pizza_sales
group by DATENAME(DW,order_date);


!----------2-Monthly Trend of Total Order
select DATENAME(MONTH,order_date) AS Month_name, count(distinct order_id) as Total_orders
from pizza_sales
group by DATENAME(MONTH,order_date);


!----------3-Percent of Sales by Pizzas Catagory (pizzas_catagory, total_revenue, percent_of_total_revenue)
select pizza_category, cast (sum(total_price) as decimal (10,2)) as total_revenue,
cast (sum(total_price)*100 / (select sum(total_price) from pizza_sales) as decimal(10,2))  as Sales_perct
from pizza_sales
group by pizza_category;


!----------4-Percentage of Sales by Pizza Size (pizza_size, total_sales, pct_total_sale_on_pizza_size)
select pizza_size, cast(sum(total_price) as decimal(10,2)) as total_revenue,
cast(sum(total_price)*100 / (select sum(total_price) from pizza_sales) as decimal(10,2)) as pct_on_sales_pizza_size
from pizza_sales
group by pizza_size
order by pizza_size;


!--------------5-Total Pizzas Sold by Pizza Category (pizza_category, total_quantity_sold) 
select pizza_category, sum(quantity) as toal_quantity_sold
from pizza_sales
group by pizza_category;


!-------------6-Top 5 Pizza by Revenue (top 5 pizza_name, total_revenue)
select top 5 pizza_name, sum(total_price) as total_revenue
from pizza_sales
group by pizza_name
order by total_revenue DESC;




!--------------Bottom 5 Pizza by Revenue (Botoom 5 pizza_name, total_revenue)
select top 5 pizza_name, sum(total_price) as total_revenue
from pizza_sales
group by pizza_name
order by total_revenue ASC;


!----------------7- Top 5 Pizza by Quantity ( Top 5 pizza_name, total_quantity)
select top 5 pizza_name, sum(quantity) as total_quantity
from pizza_sales
group by pizza_name
order by total_quantity DESC;



!----------------- Bottom 5 Pizza by Quantity
select top 5 pizza_name, sum(quantity) as total_quantity
from pizza_sales
group by pizza_name
order by total_quantity ASC;




!----------------8- Top 5 Pizza by Orders ( Top 5 pizza_name, total_orders)
select top 5 pizza_name, count(distinct order_id) as total_orders
from pizza_sales
group by pizza_name
order by total_orders DESC;


!-----------------Bottom 5 Pizza by Orders 
select top 5 pizza_name, count(distinct order_id) as total_orders
from pizza_sales
group by pizza_name
order by total_orders ASC;

