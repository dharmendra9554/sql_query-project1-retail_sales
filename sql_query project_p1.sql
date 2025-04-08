create database sql_project_p1;
use sql_project_p1;
drop table if exists retail_sales;
create table retail_sales(
transactions_id int primary key, 
 sale_date date,
sale_time time,	
customer_id	int,
gender varchar(15),
	age int,
	category varchar(15),	
    quantiy int,
	price_per_unit float,
	cogs float,
	total_sale float
);


select *  from retail_sales;
select *  from retail_sales
where transactions_id is null;

select *  from retail_sales
where sale_date is null;


select *  from retail_sales
where 
sale_time is null
or
sale_date is null
or
transactions_id is null
or
category is null
or
gender is null

or
cogs is null
or
total_sale is null;

select count(* ) as total_sales from retail_sales;

select count(distinct customer_id ) as total_sales from retail_sales;

select distinct category from retail_sales;




select* from retail_sales
where sale_date= "2022-11-05";

select * from retail_sales
where 
category="clothing"
and
sale_date ="2022-11-05"
and
quantiy >=4 ;
select * from retail_sales;


select 
category,
sum(total_sale) as net_sale,
count(*) as total_orders
from retail_sales
group by 1;

select round(avg(age),2) as avg_age from retail_sales

	

where category= "beauty";

select *from retail_sales
where total_sale>1000;

select category,
gender,
count(*) as total_trans
from retail_sales
group by category,
gender
order by 1;

select 
extract( year from sale_date) as year,
extract( month from sale_date) as month,
avg(total_sale) as avg_sales
from retail_sales
group by 1,2
order  by 1,3 desc;
select * from retail_sales;

select category,
count(distinct customer_id) as cnt_unique_cs
from retail_sales
group by category;

with hourly_sale
as
(
select * ,
case 
    when extract( hour from sale_time) <12 then "morning"
    when extract(hour from sale_time) between 12 and 17 then "afternoon"
    else "evening"
    end as shift
    from retail_sales)
    select shift,
		count(*) as total_orders
        from hourly_sale
        group by shift;
    
    


