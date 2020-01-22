-- Multi-Table Query Practice

-- Display the ProductName and CategoryName for all products in the database. Shows 77 records.
select p.ProductName, p.Id, c.CategoryName from product as p join category as c on c.Id = p.CategoryId;

-- Display the order Id and shipper CompanyName for all orders placed before August 9 2012. Shows 429 records.
select o.id, o.OrderDate, s.CompanyName from [order] as o join shipper as s on s.id = o.ShipVia where OrderDate < '2012-08-09';

-- Display the name and quantity of the products ordered in order with Id 10251. Sort by ProductName. Shows 3 records.
select p.ProductName, od.quantity from product as p join orderdetail as od 
on o.Id = od.OrderId join [order] as o on p.Id = od.ProductId where o.id = 10251 
order by p.ProductName asc
-- Display the OrderID, Customer's Company Name and the employee's LastName for every order. All columns should be labeled clearly. Displays 16,789 records.
select o.id, o.CustomerId, c.CompanyName, e.LastName from [order] as o 
join customer as c on o.CustomerId = c.Id join employee as e 
on o.EmployeeId = e.Id 
