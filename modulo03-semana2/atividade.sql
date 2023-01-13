/*
    1 - Retornar os campos da tabela de produtos e calcular o volume de cada produto em uma nova coluna. 
    Ordene do menor para o maior volume e exclua os nulos, caso haja.
    2 - Retornar pedidos que foram feitos somente no ano de 2017.
    3 - Qual é a média da nota dos reviews (review_score na tabela order_review)? 
    4 - E qual é a média considerando somente reviews com comentários? 
    5 - Qual é a média considerando somente reviews sem comentários? 
    6 - Podemos dizer que há diferença estatística entre as médias? 
    7 - Faça as considerações que julgar necessárias.
*/

-- 1 Retornar os campos da tabela de produtos e calcular o volume de cada produto em uma nova coluna. 

SELECT product_category_name , COUNT(product_id) 
FROM products 
GROUP BY 1
ORDER BY 2 DESC; 

-- 2 - Retornar pedidos que foram feitos somente no ano de 2017.

SELECT *
FROM  orders
WHERE order_purchase_timestamp LIKE "2017%"
ORDER BY order_purchase_timestamp;

-- 3 - Qual é a média da nota dos reviews (review_score na tabela order_review)? 

SELECT AVG(review_score) 
FROM order_reviews; -- 4.08642062404257

-- 4 - E qual é a média considerando somente reviews COM comentários? 

SELECT AVG(review_score), COUNT(review_score), STDEV(review_score) AS desvio_padrao
, sqrt((AVG(review_score*review_score) - AVG(review_score)*AVG(review_score))) AS std_sc
, COUNT(DISTINCT review_id) 
FROM order_reviews
WHERE review_comment_message IS NOT  NULL;
-- 3.6692796092796094 
-- n = 40.950 
-- std = 1.6156338154631074

-- 5 - Qual é a média considerando somente reviews SEM comentários? 

SELECT AVG(review_score), COUNT(review_score), STDEV(review_score) AS desvio_padrao 
, SQRT((AVG(review_score*review_score) - AVG(review_score)*AVG(review_score))) AS std_sc 
FROM order_reviews
WHERE review_comment_message IS NULL; 
-- 4.379551772660191 
-- n = 58.274 
-- std = 1.0245143927316753

-- 6 Podemos dizer que há diferença estatística entre as médias? 
-- 7 Faça as considerações que julgar necessárias.
/*
 * Calculadora: https://select-statistics.co.uk/calculators/two-sample-t-test-calculator/
    
    H0 médias iguais
    Ha médias diferentes
    As amostras são independentes
    
    Usando a calculadora o p-valor deu 0.016, podemos rejeitar a H0,
    as médias são diferentes.
  
*/