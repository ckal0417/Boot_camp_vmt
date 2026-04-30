use AdventureWorksLT2022;
GO

SELECT TOP (1000) [ProductID]
      ,[Name]
      ,[ProductNumber]
      ,[Color]
      ,[StandardCost]
      ,[ListPrice]
      ,[Size]
      ,[Weight]
      ,[ProductCategoryID]
      ,[ProductModelID]
      ,[SellStartDate]
      ,[SellEndDate]
      ,[DiscontinuedDate]
      ,[ThumbNailPhoto]
      ,[ThumbnailPhotoFileName]
      ,[rowguid]
      ,[ModifiedDate]
  FROM [AdventureWorksLT2022].[SalesLT].[Product]
  GO

  Select distinct Color as product_color from SalesLT.Product
  where Color is not null;
  GO

  DECLARE @PAGE_NUMBER INT = 1;
  DECLARE @ROWS_PER_PAGE INT = 10;
  
  Select distinct Color as product_color from SalesLT.Product
  where Color is not null
  ORDER BY Color
  OFFSET @PAGE_NUMBER * @ROWS_PER_PAGE ROWS
  FETCH NEXT @ROWS_PER_PAGE ROWS ONLY;
  GO

  DECLARE @PAGE_NUMBER INT = 1;
  DECLARE @ROWS_PER_PAGE INT = 10;
  
  Select * from SalesLT.Customer
  ORDER BY CustomerID
  OFFSET @PAGE_NUMBER * @ROWS_PER_PAGE ROWS
  FETCH NEXT @ROWS_PER_PAGE ROWS ONLY;
  GO


  select * from SalesLT.ProductCategory
  order by Name DESC;
  go 

--like
  SELECT * from SalesLT.Customer
  where FirstName like '%R%';

  SELECT * FROM SalesLT.Customer
  where FirstName = 'Robert';


  -- between
SELECT * FROM SalesLT.Customer
where ModifiedDate between '2005-08-01' and '2007-07-01'

--count
SELECT COUNT(*)as total_costumers FROM SalesLT.Customer

Select COUNT(*) from SalesLT.SalesOrderHeader
SELECT DISTINCT COUNT(*) FROM SalesLT.SalesOrderHeader

SELECT * FROM SalesLT.SalesOrderHeader
ORDER BY AccountNumber

Select SUM(TotalDue) as total_ventas from SalesLT.SalesOrderHeader

SELECT COUNT(*) FROM SalesLT.Product

SELECT ProductCategoryID as category_id, COUNT (ProductCategoryID) as total FROM SalesLT.Product
GROUP BY ProductCategoryID
ORDER BY total DESC

SELECT * FROM SalesLT.Product p
  inner join SalesLT.ProductCategory pc
		on p.ProductCategoryID =pc.ParentProductCategoryID

SELECT
	soh.SalesOrderID as sales_order_id,
	c.FirstName as customer_first_name
FROM SalesLT.SalesOrderHeader soh
INNER JOIN SalesLT.Customer c
	on c.CustomerID = soh.CustomerID



