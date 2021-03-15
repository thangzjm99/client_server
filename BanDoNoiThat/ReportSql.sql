use BanDoNoiThat
go


select Order_detail.product_id,SUM(Order_detail.amount) as sell_amount,SUM(Order_detail.total_price) as sell_price from Order_detail
group by Order_detail.product_id



select Import.id_product,sum(Import.quantity) as import_quantity,SUM(import_price*Import.quantity) as import_price from Import
group by Import.id_product


select Product.code,Product.name,a.sell_amount,a.sell_price,b.import_quantity,b.import_price from Product,
(select Order_detail.product_id,SUM(Order_detail.amount) as sell_amount,SUM(Order_detail.total_price) as sell_price from Order_detail
group by Order_detail.product_id) as a,
(select Import.id_product,sum(Import.quantity) as import_quantity,SUM(import_price*Import.quantity) as import_price from Import
group by Import.id_product) as b
where Product.id = a.product_id and Product.id=b.id_product


-- Import
select ProductionCompany.name,ProductionCompany.email,ProductionCompany.phone, A.import_quantity,A.import_price from ProductionCompany,
(select Import.id_productionCompany,SUM(Import.quantity) as  import_quantity,SUM(Import.import_price * Import.quantity) as import_price
from Import
where Import.created_at between '2021-01-01' and '2021-12-12'
group by Import.id_productionCompany
) as A
where ProductionCompany.id = A.id_productionCompany

--Selling
select Product.name,Product.code,A.selling_amount,A.selling_price from  Product,
( select Order_detail.product_id,sum(Order_detail.amount) as selling_amount,sum(Order_detail.total_price) as selling_price
from Order_detail
where Order_detail.created_at between '2021-01-01' and '2021-12-12'
group by Order_detail.product_id) as A
where Product.id = A.product_id





