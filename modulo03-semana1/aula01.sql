SELECT * 
FROM  customers;

SELECT customer_id AS identidade -- alias
FROM customers;

SELECT *
FROM  orders 
WHERE  order_purchase_timestamp <> "2017-10-02";

-- 2. Quantos clientes únicos temos na base ?
SELECT  COUNT(*), COUNT(DISTINCT  customer_id), COUNT(customer_id)
FROM customers
WHERE  customer_id IS NOT NULL;  -- 99.441


SELECT  COUNT(*)
, COUNT(distinct order_id)
, COUNT(distinct order_item_id)
from order_items  
where order_id is not null;


SELECT  COUNT(*), COUNT(distinct order_id || product_id)
from order_items
where order_id is not null;

SELECT  COUNT(distinct customer_id), customer_state, customer_city
from customers 
group by 2, 3
order by 1 desc;

/*  
    3. Selecione os dados da tabela de pagamentos onde
	só apareçam os tipos de pagamento “VOUCHER” ou “BOLETO”.
*/
SELECT  *
FROM  order_payments 
WHERE LOWER(payment_type) IN ("boleto", "voucher");
-- where LOWER(payment_type) = "boleto" or lower(payment_type) = "voucher"


/* 
  4. Encontre os clientes do estado de SP e que não morem na cidade de São Paulo.
*/
SELECT  *
FROM  customers
WHERE LOWER (customer_state) = "sp" 
AND LOWER(customer_city) NOT LIKE  "s_o paulo";
;


SELECT  DISTINCT  customer_city
FROM customers 
WHERE  LOWER() (customer_city) LIKE  "%paulo%"
ORDER BY customer_city DESC; 

/* create table ou create view
 * select
 * from 
 * where
 * group by
 * having
 * order by
 * limit
 */