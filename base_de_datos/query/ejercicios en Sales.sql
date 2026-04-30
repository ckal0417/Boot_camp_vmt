USE AdventureWorksLT2022;
GO

-- EJERCICIOS
--1
SELECT COUNT(*)as total_clientes FROM SalesLT.Customer

--2
SELECT COUNT(*)as total_ventas_Octubre FROM SalesLT.SalesOrderHeader
WHERE ModifiedDate between '2008-10-01' and '2008-10-31'

--3
Select Name as categorias_por_nombre FROM SalesLT.ProductCategory 
ORDER BY Name ASC


 --4
DECLARE @SaleId INT = 71780;
SELECT 
    s.Status,
    s.SalesOrderNumber,
    sd.*
FROM SalesLT.SalesOrderHeader s
INNER JOIN SalesLT.SalesOrderDetail sd 
    ON s.SalesOrderID = sd.SalesOrderID
    AND s.SalesOrderID = @SaleId;
