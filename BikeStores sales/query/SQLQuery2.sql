SELECT 
	ord.order_id,
	concat (cust.first_name,' ' , cust.last_name) AS 'customer_name',
	cust.city,
	cust.state,
	ord.order_date,
	SUM(itm.quantity) AS 'total_units',
	SUM (itm.quantity * itm.list_price) AS 'revenue',
	prod.product_name,
	categ.category_name,
	stor.store_name,
	CONCAT (rep.first_name,' ' , rep.last_name) AS 'sales_representative'


FROM sales.orders ord
JOIN sales.customers cust
ON ord.customer_id = cust.customer_id

JOIN sales.order_items itm
ON ord.order_id = itm.order_id
JOIN sales.stores stor
ON ord.store_id = stor.store_id
JOIN sales.staffs rep
ON ord.staff_id=rep.staff_id
JOIN production.products prod
ON itm.product_id = prod.product_id
JOIN production.categories categ
ON prod.category_id = categ.category_id


GROUP BY 
	ord.order_id,
	concat (cust.first_name,' ' , cust.last_name),
	cust.city,
	cust.state,
	ord.order_date,
	prod.product_name,
	categ.category_name,
	stor.store_name,
	CONCAT (rep.first_name,' ' , rep.last_name)
