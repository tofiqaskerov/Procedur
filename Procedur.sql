create table Category(
  Id int Identity (1,1) Primary Key,
  CategoryName nvarchar (100)
)

INSERT INTO Category (CategoryName) VALUES ('Laptop')

create table Product(
  Id int Identity (1,1) Primary Key,
  Name nvarchar (100),
  Price float,
  Color nvarchar(100),
  Description nvarchar(100),
)

ALTER TABLE Product ADD CategoryId int FOREIGN KEY REFERENCES Category(Id)

INSERT INTO Product (Name, Price, Color, Description, CategoryId) VALUES ( 'MSI Modern 14', 2499.99, 'White', 'Mukemmel Laptopdur', 2)


SELECT  * FROM Product Order by Product.Price ASC
SELECT * FROM Product Order by Product.Price DESC


SELECT Product.Name, Price, Color, Description, CategoryName FROM Product JOIN Category on Product.CategoryId = Category.Id
SELECT Product.Name, Price, Color, Description, CategoryName FROM Product JOIN Category on Product.CategoryId = Category.Id WHERE Category.Id = 2 AND Product.Price >= 1049.99 AND Product.Price <= 3229.99
SELECT Product.Name, Price, Color, Description, CategoryName FROM Product JOIN Category on Product.CategoryId = Category.Id WHERE Category.Id = 2 AND Product.Price >= 1049.99 AND Product.Price <= 3229.99 Order by Price ASC


Go
Create Procedure FilterProducts @Price int 
as SELECT * FROM Product Where Product.Price > @Price Order by Price ASC

Go
Create  Procedure FilterProductCategoryPrice @MinPrice int, @MaxPrice int 
as SELECT Product.Name, Price, Color, Description, CategoryName 
FROM Product JOIN Category on Product.CategoryId = Category.Id 
WHERE Category.Id = 2 AND Product.Price >= @MinPrice AND Product.Price <= @MaxPrice Order by Price ASC


EXEC FilterProductCategoryPrice @MinPrice = '1000', @MaxPrice = '5000'
EXEC FilterProducts @price = '1500'

