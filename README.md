# Sales-Dashboard-with-SQL-Server-and-Power-BI
I have created the dashboards for sales insights using data from a SQL Server database. The dataset was extracted using SQL queries within SQL Server Management Studio and then visualized using Power BI. This project will provide valuable insights for sales teams and executives to make informed decisions and drive business growth.
Step-by-Step Process:

Database Used:
     Bike store database.

    SQL Queries:
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
      JOIN production.products prod
      ON itm.product_id = prod.product_id
      JOIN sales.order_items itm
      ON ord.order_id = itm.order_id
      JOIN sales.stores stor
      ON ord.store_id = stor.store_id
      JOIN sales.staffs rep
      ON ord.staff_id=rep.staff_id
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
![2024-04-26_003453](https://github.com/Pythonist-QuratUlAin/Sales-Dashboard-with-SQL-Server-and-Power-BI/assets/109209138/e9ed1ba0-26df-41e1-9653-12c3f069a280)


Power BI Dashboard:
 ![2024-04-26_003528](https://github.com/Pythonist-QuratUlAin/Sales-Dashboard-with-SQL-Server-and-Power-BI/assets/109209138/9fb76a28-7d1b-4fed-8d35-a82fee8df99d)
