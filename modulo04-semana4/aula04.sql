/*
 01 - Há quanto tempo cada seller entrou na nossa base? Dica: use a data do primeiro pedido por seller 
 e a última data de registro de compra da base (2018-10-17) para esse cálculo.
 */


from order_i


SELECT seller_id , first_value(order_purchase_timestamp) over (PARTITION by seller_id)
FROM order_items oi
join orders o using (order_id);


/* 
 02 - Crie uma query SQL que retorne todos os pagamentos do cliente, com suas datas de aprovação, 
 valor da compra e o valor total que o cliente já gastou em todas as suas compras, mostrando somente 
 os clientes onde o valor da compra é diferente do valor total já gasto.
*/


select CustomerId
from Orders  
/*
 03 - Pensando em um sistema de recomendação por estado, precisamos entender o que cada estado consome. 
 Por isso, responda: Quais são os 3 principais produtos de cada estado? 
 Existe alguma diferença de comportamento do RS e da BA?
*/




/* 
04 - Supondo que nosso SLA de resposta de review deve ser de 24 horas. Estamos cumprindo o SLA?
*/


/* 
 05 - Qual é o número de usuários ativos mensais para 2017? Qual é a taxa de crescimento mensal?
*/