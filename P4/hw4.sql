select count(distinct model) as num_of_products_by_maker 
from pc natural join product 
group by maker;

select max(screen) as max_screen_size_by_E 
from laptop natural join product 
where maker = 'E';

select avg(price)
from 
(select price, maker 
from product, pc 
where product.model = pc.model 
union all 
select price, maker   
from product, laptop 
where product.model = laptop.model 
union all 
select price, maker 
from product, printer 
where product.model = printer.model ) 
as union_price 
group by maker 
having avg(price) >= 200 
order by avg(price) desc;

