SELECT * from customers;

SELECT customer_id 
FROM customers;

SELECT DISTINCT customer_id 
from customers;

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
WHERE customer_city LIKE "_a%"
;

SELECT DISTINCT customer_city 
from customers c 
WHERE LOWER(customer_city) LIKE "S_o paulo" 
;

SELECT  * 
FROM orders 
ORDER BY order_purchase_timestamp DESC  
;

SELECT  * 
FROM order_reviews 
ORDER BY review_creation_date DESC 
limit 10;

SELECT SUM(price), MAX(price), AVG(price), MIN(price), COUNT(price), STDEV(price)  
FROM order_items 
;

SELECT SUM(price), MAX(price), AVG(price), MIN(price), stdev(price) 
FROM order_items 
;

SELECT SUM(price) as soma, seller_id,
FROM order_items 
group by seller_id 
order by soma DESC 

-- Qual estado vende mais??
SELECT COUNT(DISTINCT customer_id), customer_state  
FROM customers 
group by customer_state 
ORDER BY 1 DESC 


/*
 select
 from
 where
 group by
 order by
 limit
 
 
 STDEV desvio padrão para campos numéricos
 
 */