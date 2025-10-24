create database sales_analysis;
use sales_analysis;
select * from sales_table limit 10;
#Total purchase amount male and female
select  gender,sum(purchase_amount)as total_amount from sales_table group by gender;

#which customer spent more than average amount after using discount 
select 
	customer_id,
	purchase_amount
from 
	sales_table
where
	discount_applied="Yes" 
and
	purchase_amount>=(select avg(purchase_amount) from sales_table) ;
    
#top 5 highest average review products 

select 
	item_purchased,
    round(avg(review_rating),1) as avg_rating 
from 
	sales_table 
group by 
	item_purchased
order by  
	avg(review_rating) desc 
limit 5;  

#compare avg shipping amount between standard and exress shipping

select shipping_type,round(avg(purchase_amount),2)avg_amt 
from sales_table  
where shipping_type in ("Express" ,"Standard") 
group by shipping_type 
order by avg(purchase_amount) ;

#compare avg and total amount spend between subscribers and non subscribers
select  subscription_status,count(*) as cnt,avg(purchase_amount)avg_amt,sum(purchase_amount)total_amt 
from sales_table 
group by subscription_status;

#top 5 products with highest percentage of purchases with discount applied

select  item_purchased,100*sum(case when discount_applied="Yes" then 1 else 0 end) /count(*)as v
from sales_table
group by item_purchased 
order by v desc limit 5;
#segment customers into new ,returning,loyal based on previous purchases
select sum(case when previous_purchases =1 then 1 end) as new_cust,
sum(case when previous_purchases between 1 and 10 then 1 end )as returning_cust,
sum(case when previous_purchases >10 then 1 end )as loyal_cust from sales_table ;

#top3 most purchased products within each category
with cte as(select item_purchased,category,count(*)c ,row_number()over(partition by category order by count(*) desc)rn from 
sales_table group by item_purchased,category order by category desc)
select item_purchased,category,c from cte where rn<4;

#are customer who are repeat buyers(more than 5 previous purchases) also likely to subscribe?
select subscription_status,count(*)cnt 
from sales_table 
where previous_purchases>5 
group by subscription_status;

#what is the revenue contribution of each age group
select age_group,sum(purchase_amount)total_amount from sales_table group by age_group order by total_amount desc;