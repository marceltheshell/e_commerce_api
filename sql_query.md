SELECT  c.first_name, c.id, cp.category_id, ca.id, ca.title, count(ca.id) as CategoriesSold 
          FROM Customers as c
          INNER JOIN Orders as o
          ON o.customer_id = c.id
          INNER JOIN Orders_products op
          ON o.id = op.order_id
          INNER JOIN Categories_products cp
          ON op.product_id = cp.product_id
          INNER JOIN Categories ca
          ON cp.category_id = ca.id
          GROUP BY c.first_name, c.id, cp.category_id, ca.id, ca.title