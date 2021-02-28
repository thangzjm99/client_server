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

