SELECT CustomerId,
      UnitPrice,
      AVG(UnitPrice) OVER (PARTITION BY CustomerId
      ORDER BY CustomerId
      ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS “CumAvg”
 FROM Orders 
 INNER JOIN [Order Details] ON Orders.OrderId = [Order Details].OrderID 