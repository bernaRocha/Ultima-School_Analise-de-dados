SELECT CustomerId, UnitPrice,
   AVG(UnitPrice) OVER (PARTITION BY CustomerId) AS “AvgUnitPrice”
FROM Orders 
INNER JOIN "Order Details"  ON Orders.OrderID = [Order Details].OrderId

SELECT CustomerId, OrderDate, UnitPrice,
    ROW_NUMBER() OVER (PARTITION BY CustomerId ORDER BY UnitPrice DESC) AS “UnitRank”
FROM Orders
INNER JOIN [Order Details]
ON Orders.OrderID = [Order Details].OrderId

SELECT CustomerId, OrderDate, UnitPrice,
    ROW_NUMBER() OVER (PARTITION BY CustomerId ORDER BY UnitPrice DESC) AS “UnitRank”
FROM Orders
INNER JOIN [Order Details]
ON Orders.OrderID = [Order Details].OrderId
ORDER BY CustomerId, UnitPrice DESC 


/* com RANK():
 se você tiver vários valores com exatamente o mesmo valor, a função rank dará a eles a mesma classificação.
 */ 
SELECT CustomerId, OrderDate, UnitPrice,
    RANK() OVER (PARTITION BY CustomerId ORDER BY UnitPrice DESC) AS “UnitRank”
FROM Orders
INNER JOIN [Order Details]
ON Orders.OrderID = [Order Details].OrderId
ORDER BY CustomerId, UnitPrice DESC 

/*
Bem, e se você não quiser pular números? Bem, podemos usar DENSE_RANK() em vez disso.
DENSE_RANK(): Novamente, substitua nossa função de janela por DENSE_RANK() e mantenha todo o resto igual.
*/
SELECT CustomerId, OrderDate, UnitPrice,
    DENSE_RANK() OVER (PARTITION BY CustomerId ORDER BY UnitPrice DESC) AS “UnitRank”
FROM Orders
INNER JOIN [Order Details]
ON Orders.OrderID = [Order Details].OrderId
ORDER BY CustomerId, UnitPrice DESC 

/*Lição: Exemplos de uso - Funções de valor*/
SELECT ProductId,
 OrderDate,
 Quantity,
 LAG(Quantity) OVER (PARTITION BY ProductId ORDER BY OrderDate) AS "LAG"
 FROM Orders
 INNER JOIN [Order Details] ON Orders.OrderId = [Order Details].OrderId


/*2. Crie uma nova coluna que forneça a quantidade da data do pedido a seguir para cada ProductId.

Isso vai se parecer bastante com o nosso exemplo anterior. No entanto, desta vez, como queremos a linha a seguir, usaremos LEAD().
*/
SELECT ProductId,
      OrderDate,
      Quantity,
      LEAD(Quantity) OVER (PARTITION BY ProductId ORDER BY OrderDate) AS "LEAD"
 FROM Orders
 INNER JOIN [Order Details] ON Orders.OrderId = [Order Details].OrderId
 

 

























