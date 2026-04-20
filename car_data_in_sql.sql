drop database first_project;

create Database first_project;

use  first_project;

select * from car_data_sheet limit 100;

set sql_safe_updates = 0;

Delete From Car_Data_Sheet 
where brand = '';

select Brand , sum(price) as total_sales from car_data_sheet
 group by Brand order by ('DESC') ;
 
 
 
 select * from car_data_sheet 
 where car_id is null;
 
 
 
 select Brand , sum(Quantity_in_stock) as total_stock
 from car_data_sheet
 group by Brand
 order by ('DESC');
 
 select * from car_data_sheet
 where Brand = '';
 
 
 select Brand , Round(avg(price),2) as Avg_price
 from car_data_sheet
 Group by Brand
 order by ('DESC');
 
 update car_data_sheet
 set Transmission = "Automatic"
 where Transmission = "auto" or Transmission = "A";
 
 update car_data_sheet
 set Transmission = "Manual"
 where  Transmission = "M" or  Transmission = "manaul";
 
select transmission , count(*) as count
from car_data_sheet 
 Group by transmission;
 
 Select status , count(*) as total
 from car_data_sheet
 Group by status;
 
 Select Engine_type , count(Engine_Type) as total,Round(avg(price),2) as avg_price
 from car_data_sheet
 Group by engine_type
 order by count ('DESC');
 
 
 
 
