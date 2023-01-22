/*
 1 - Retorne a quantidade de itens vendidos em cada categoria por estado do cliente. 
 Mostre somente categorias/estados que tenha vendido uma quantidade de itens acima de 1000 itens.
 
 1- select tudo que deve aparecer
*/

SELECT COUNT(DISTINCT oi.order_id) AS contador, 
	p.product_category_name, 
	c.customer_state  
FROM products p 
JOIN order_items oi ON p.product_id = oi.product_id
JOIN orders o ON o.order_id = oi.order_id
JOIN customers c ON c.customer_id  = o.customer_id 
GROUP BY 2, 3
HAVING contador >= 1000 
ORDER BY contador DESC;

/*
 2 - Mostre os 5 clientes (customer_id) que tem o maior valor total de compras 
 (considerar apenas o valor do produto). Qual foi o valor total de todas as compras, 
quantidade de compras, e valor médio gasto por cada um deles?
*/

SELECT o.customer_id,
	SUM(op.payment_value) valor_total,
	COUNT(DISTINCT o.order_id) quant_compras,
	AVG(payment_value) valor_medio
FROM order_payments AS op 
INNER JOIN orders AS o ON op.order_id = o.order_id 
GROUP BY 1
ORDER BY valor_total DESC 
LIMIT 5;

/*
 3 - Mostre o valor total vendido de cada vendedor (seller_id) em cada uma 
 das categorias de produtos, somente retornando os vendedores que nesse somatório e 
 agrupamento venderam mais de $1000. Desejamos ver a categoria do produto e os vendedores - 
 para cada uma dessas categorias mostre seus valores de venda de forma decrescente.
*/

SELECT seller_id, product_category_name,
SUM(price) as soma_valor
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id 
GROUP BY 1, 2
HAVING soma_valor > 1000
ORDER BY 3;