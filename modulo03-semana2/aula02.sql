SELECT * FROM customers;

SELECT customer_id 
FROM customers;

SELECT DISTINCT customer_id 
FROM customers;

/*

= igual à
<> OU != diferente de 
< menor
> maior
<= menor ou igual
>= maior ou igual

AND - todas as condições verdadeiras
ANY 
BETWEEN
IN
LIKE
NOT
OR - ao menos uma condição verdadeira

WHERE coluna1 LIKE 'a%' começa com a
WHERE coluna1 LIKE '%a' termina com a 
WHERE coluna1 LIKE '%or%' tem or em qualquer parte
WHERE coluna1 LIKE '_r%' tem r na segunda posição
WHERE coluna1 LIKE 'a_%' começa com a e tem ao menos um caractere depois
WHERE coluna1 LIKE 'a__%' 
WHERE coluna1 LIKE 'a%o' começa com a e termina com o 

*/

SELECT customer_city 
FROM customers 
WHERE customer_city LIKE "_a%";

SELECT DISTINCT customer_city 
FROM customers c 
WHERE LOWER(customer_city) LIKE "S_o paulo";

SELECT  * 
FROM orders 
ORDER BY order_purchase_timestamp DESC;

SELECT  * 
FROM order_reviews 
ORDER BY review_creation_date DESC 
LIMIT 10;

SELECT SUM(price), MAX(price), AVG(price), MIN(price), COUNT(price), STDEV(price)  
FROM order_items;

SELECT SUM(price), MAX(price), AVG(price), MIN(price), STDEV(price) 
FROM order_items;

SELECT SUM(price) as soma, seller_id,
FROM order_items 
GROUP BY seller_id 
ORDER BY soma DESC; 

-- Qual estado vende mais??
SELECT COUNT(DISTINCT customer_id), customer_state  
FROM customers 
GROUP BY customer_state 
ORDER BY 1 DESC; 

-- Comando HAVING, usado apenas quando estamos usando o GROUP BY
-- Não podemos filtrar registros que estão sendo agrupados usando o WHERE

SELECT COUNT(DISTINCT customer_id) AS counter, customer_state  
FROM customers 
GROUP BY customer_state 
HAVING counter > 10000
ORDER BY 1 DESC;

-- CASE WHEN permite substituir o valor de uma coluna por outro de acordo com uma ou mais condições
-- começa com CASE e termina com END, entre fica o WHEN e THEN 
-- Se nenhuma condição for atendida deve ser definido um ELSE

SELECT 
product_id, 
product_category_name, 
CASE 
	WHEN product_category_name LIKE "%moveis%" THEN "moveis"
	WHEN product_category_name LIKE "%lazer" THEN "lazer"
	WHEN product_category_name LIKE "%livros%" THEN "livros"
ELSE "outros"	
END AS categoria_modificada
FROM products 
ORDER BY nova_categoria
LIMIT  100;

-- comando REPLACE
SELECT DISTINCT product_category_name ,
REPLACE (product_category_name, '_', ' ') categoria_sem_underline -- coluna, o que quer substuir pelo substituto
FROM products;

-- comando SUBSTRING
SELECT order_purchase_timestamp
, SUBSTRING(order_purchase_timestamp, 1, 10) as data_compra
FROM orders; 

-- Nosso principal KPI é o volume de vendas. Como faço para contar esse volume mensalmente?
SELECT COUNT(DISTINCT order_id) 
, SUBSTRING(order_purchase_timestamp, 1, 7) AS mes_ano
FROM orders 
group by 2
order by 2;

-- comando COALESCE
SELECT order_delivered_customer_date, 
-- cria a coluna col_case_when
CASE WHEN order_delivered_customer_date 
	IS NULL THEN "Nao entregue"
	ELSE order_delivered_customer_date
	END AS col_case_when,
-- cria a coluna col_coalesce
COALESCE (order_delivered_customer_date, "Nao entregue") AS col_coalesce
FROM orders;

-- lidando com data usando julianday
SELECT CAST((JULIANDAY(order_purchase_timestamp) - JULIANDAY(order_delivered_carrier_date))AS INT) AS dif_compra_entrega
FROM orders;

-- casting 
SELECT (JULIANDAY(order_purchase_timestamp) - JULIANDAY(order_delivered_carrier_date)) AS dif_compra_entrega
FROM orders;

-- comando CREATE VIEW

--tabela virtual baseada no resultado de uma query
--  utilizamos para armazenar querys que precisamos rodar com frequência 
-- e que não queremos os resultados "congelados"

CREATE VIEW volume_diario AS 
SELECT COUNT(*), DATE(order_purchase_timestamp) 
FROM orders 
GROUP BY 2
ORDER BY 2 DESC;

SELECT *
FROM volume_diario;

/*

 select
 from
 where
 group by
 having
 order by
 limit
 
STDEV desvio padrão para campos numéricos
 
 */