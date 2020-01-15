select Product.model, price from Product, PC
where Product.model = PC.model and maker = 'B'
union
select Product.model, price from Product, Laptop
where Product.model = Laptop.model and maker = 'B'
union
select Product.model, price from Product, Printer
where Product.model = Printer.model and maker = 'B'