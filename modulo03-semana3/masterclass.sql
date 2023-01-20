SELECT *
FROM order_reviews or2 
WHERE  review_comment_message NOTNULL AND review_comment_title NOTNULL 
ORDER BY review_creation_date  DESC 
limit 10;

SELECT customer_state , COUNT(1),
COUNT(*), COUNT(customer_id), COUNT(DISTINCT customer_id)  
FROM customers 
GROUP BY 1
ORDER BY 2 DESC ;

SELECT customer_state , COUNT(1),
COUNT(*), COUNT(customer_id), COUNT(DISTINCT customer_id)  
FROM customers 
GROUP BY 1
HAVING COUNT(1) > 1000 
ORDER BY 2 DESC ;

SELECT *
FROM  orders o 
INNER JOIN order_items oi 
ON o.order_id = oi.order_id 
LIMIT 10;

SELECT COUNT(DISTINCT o.order_id), AVG(price), customer_id  
FROM orders o 
INNER JOIN order_items oi 
ON o.order_id = oi.order_id 
GROUP BY 3
ORDER BY 1 ASC ;


SELECT cust.customer_state,
	COUNT(DISTINCT customer_unique_id) qtd_clientes,
	AVG(pay.payment_value) AS media_compras,
	SUM(pay.payment_value) AS total_compras,
	MAX(pay.payment_value) AS maior_compra,
	MIN(pay.payment_value) AS menor_compra
FROM order_payments AS pay
INNER JOIN orders AS ord ON pay.order_id = ord.order_id 
INNER JOIN customers AS cust ON ord.customer_id  = cust.customer_id 
GROUP BY cust.customer_state 
HAVING SUM(pay.payment_value) > 300000 