 CREATE VIEW SalesView AS 
 SELECT 
     C.CustomerID,C.CustomerName,C.City,C.Country,O.OrderID,O.OrderDate,
	 OD.OrderDetailID,OD.Quantity,P.ProductID,P.ProductName,P.Unit,P.Price,
	 SH.ShipperID,SH.ShipperName,SU.SupplierID,SU.SupplierName,CA.CategoryID,CA.CategoryName
	 FROM Customers C  
	 JOIN Orders O ON C.CustomerID=O.CustomerID
	 JOIN OrderDetails OD ON O.OrderID=OD.OrderID
	 JOIN Products P ON P.ProductID=OD.ProductID
	 JOIN Shippers SH ON SH.ShipperID=O.ShipperID
	 JOIN Suppliers SU ON SU.SupplierID=P.SupplierID
	 JOIN Categories CA ON CA.CategoryID=P.CategoryID
