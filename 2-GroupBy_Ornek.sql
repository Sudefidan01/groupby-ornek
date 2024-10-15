--Hangi ürünümden kaç adet satın alınmış
--Ürün adı ve adet bilgisi olarak listeleyelim
--(order details , products)
select 
	(
	select
		ProductName
	from Products
	where  Products.ProductID=od.ProductID

	) as ProductName,
	sum(od.Quantity) as Amount
from [Order Details] as od
group by od.ProductID
order by Amount asc

--Hangi tedarikçiden kaç çeşit ürün alıyorum
--Tedarikçi adı ve çeşit adet bilgisi olarak listeleyelim
--(products , suppliers)
select
	
	(
		select 
			CompanyName
		from Suppliers
		where Suppliers.SupplierID=Products.SupplierID
	) as Supplier,
	COUNT(Products.ProductID) as Amount

from Products
group by Products.SupplierID

--Hangi ülkede kaç adet müşterim var
--Ülke adı ve adet bilgisi olarak listeleyelim
--(Customers)
select
	Country,
	COUNT(CustomerID) as Amount

from Customers
group by Country
