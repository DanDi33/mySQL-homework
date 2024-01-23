create database veg_fruits;
use veg_fruits;
CREATE TABLE Products (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(20) not null,
    prod_type VARCHAR(20),
    color VARCHAR(20),
    calorie int,
    descript text
); 
-- drop table Products;

insert into Products (product_name, prod_type, color, calorie, descript)
values ('apple','fruits','green', 100, 'green apple');
insert into Products (product_name, prod_type, color, calorie, descript)
values ('orange','fruits','orange', 120, 'delisous orange');
insert into Products (product_name, prod_type, color, calorie, descript)
values ('tomato','vegetables','green', 130, 'red tomato');
insert into Products (product_name, prod_type, color, calorie, descript)
values ('carrot','vegetables','orange', 160, 'orange carrot');
insert into Products (product_name, prod_type, color, calorie, descript)
values ('potato','vegetables','brown', 200, 'brown potato');
insert into Products (product_name, prod_type, color, calorie, descript)
values ('watermelon','fruits','green', 170, 'green watermelon');
-- update Products set 
-- calorie = 160
-- where product_name = 'carrot';
-- update Products set 
-- calorie = 130,
-- descript = 'red tomato',
-- color = 'red'
-- where product_name = 'tomato';

-- Задание 1 
select * from Products;
select * from Products
where prod_type = 'vegetables';
select * from Products
where prod_type = 'fruits';
select product_name from Products;
select distinct color from Products;
select * from Products where 
prod_type = 'fruits' and color = 'orange';
select * from Products where 
prod_type = 'vegetables' and color = 'red';

-- Задание 2
 select * from Products where 
calorie<170;
 select * from Products where 
calorie<170 and calorie>=120;
 select * from Products where calorie
between 120 and 160;
select * from Products where prod_type = 'vegetables' and product_name like '%at%';

UPDATE Products 
SET descript='green apple гемоглобин' 
WHERE user_id=1;
select * from Products where descript like '%гемоглобин';
select * from Products where color = 'orange' or color = 'red';

-- Задание 3

select count(*) as vegetables from Products where prod_type='vegetables'; 
select count(*) as fruits from Products where prod_type='fruits'; 
select color, count(*) as count from Products where color='orange'; 
select color, count(*) as count from Products group by color; 
SELECT color, count(color) as counter_color 
	FROM Products 
	group by color 
	order by counter_color limit 1;
SELECT color, count(color) as counter_color 
	FROM Products 
    group by color 
    order by counter_color desc limit 1;
select min(calorie) as min from Products; 
select max(calorie) as max from Products; 
select avg(calorie) as avg from Products; 
SELECT product_name, calorie 
	FROM Products 
    WHERE calorie = ( SELECT MIN(calorie) FROM Products );
SELECT product_name, calorie 
	FROM Products 
    WHERE calorie = ( SELECT MAX(calorie) FROM Products );