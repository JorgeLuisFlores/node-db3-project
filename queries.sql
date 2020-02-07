-- Multi-Table Query Practice

-- Display the ProductName and CategoryName for all products in the database. Shows 77 records.
SELECT ProductName, CategoryName
FROM Product
    JOIN Category ON Product.CategoryId = Category.Id;

-- Display the order Id and shipper CompanyName for all orders placed before August 9 2012. Shows 429 records.
SELECT [Order].ID,
    Shipper.CompanyName,
    [Order].OrderDate
FROM [Order]
    JOIN Shipper ON Shipper.ID = [Order].ShipVia
WHERE [Order].OrderDate < ('2012-08-09');

-- Display the name and quantity of the products ordered in order with Id 10251. Sort by ProductName. Shows 3 records.
SELECT
    [Order].ID,
    Product.ProductName,
    OrderDetail.Quantity
FROM [Order]
    JOIN OrderDetail ON [Order].ID = OrderDetail.OrderID
    JOIN Product ON OrderDetail.ProductID = Product.ID
WHERE [Order].ID = (10251)
ORDER BY ProductName;


-- Display the OrderID, Customer's Company Name and the employee's LastName for every order. All columns should be labeled clearly. Displays 16,789 records.
SELECT
    [Order].ID,
    Customer.CompanyName,
    Employee.LastName
FROM Customer
    JOIN [Order] ON Customer.ID = [Order].CustomerID
    JOIN Employee ON [Order].EmployeeID = Employee.ID
