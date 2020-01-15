#A#########################################################
select distinct maker from product
where model in
(select model from pc where speed>=3.0);

select distinct R.maker from product R
where exists(select P.model from pc P where P.speed >= 3.0
and P.model = R.model);

#B##########################################################

select P1.model from printer P1
where P1.price >= all(select P2.price from printer P2);

select P1.model from printer P1
where P1.price in
(select max(P2.price) from printer P2);

#C##########################################################

select L.model from laptop L
where L.speed < any (select P.speed from pc P);

select L.model from laptop L
where exists
(select P.speed from pc P where P.speed >= L.speed);

#D##########################################################

select model from (select model, price from pc union 
select model,price from laptop 
union 
select model,price from printer) 
MP where MP.price >= all 
(select price from pc 
union 
select price from laptop 
union 
select price from printer);

select model from 
(select model,price from pc union 
select model, price from laptop union 
select model, price from printer) MP 
where MP.price IN(select max(price) from 
(select price from pc 
union 
select price from laptop 
union 
select price from printer) M2);

#E##########################################################

select PR.maker from product PR, printer PT 
where PR.model=PT.model and PT.price <=all 
(select min(price)from printer);

select PR.maker from product PR,printer PT 
where PR.model=PT.model and PT.price  
in(select min(P.price) from printer P);

#f##########################################################

select PR.maker from product PR, pc P 
where PR.model=P.model and P.ram 
in(select min(ram) from pc) 
and P.speed >= all(select P.speed from product PR, pc P 
where PR.model=P.model and P.ram 
in(select min(ram) from pc));

select PR.maker from product PR, pc P 
where PR.model=P.model and P.ram 
=(select min(ram) from pc) 
and P.speed in(select max(P.speed) from product PR, pc P 
where PR.model=P.model and 
P.ram in(select min(ram) from pc));











