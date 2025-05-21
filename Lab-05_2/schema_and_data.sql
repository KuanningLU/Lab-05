--建表語法

CREATE TABLE Customer (
  CustomerID VARCHAR(20) PRIMARY KEY,
  Name VARCHAR(100),
  Email VARCHAR(100),
  Phone VARCHAR(20),
  Street VARCHAR(200),
  City VARCHAR(100),
  ZipCode VARCHAR(20),
  Country VARCHAR(50)
);

CREATE TABLE Supplier (
  SupplierName VARCHAR(100) PRIMARY KEY,
  ContactInfo VARCHAR(200)
);

CREATE TABLE Product (
  ProductID VARCHAR(20) PRIMARY KEY,
  ProductName VARCHAR(100),
  Description TEXT,
  UnitPrice DECIMAL(10,2),
  StockQty INT,
  SupplierName VARCHAR(100),
  FOREIGN KEY (SupplierName) REFERENCES Supplier(SupplierName)
);

CREATE TABLE `Order` (
  OrderID VARCHAR(20) PRIMARY KEY,
  CustomerID VARCHAR(20),
  OrderDate DATE,
  TotalAmount DECIMAL(12,2),
  FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);

CREATE TABLE OrderItem (
  OrderID VARCHAR(20),
  ProductID VARCHAR(20),
  Quantity INT,
  UnitPrice DECIMAL(10,2),
  PRIMARY KEY (OrderID, ProductID),
  FOREIGN KEY (OrderID) REFERENCES `Order`(OrderID),
  FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
);


--插入範例資料
-- Customer
INSERT INTO Customer VALUES
('C001', '王小明', 'wang@example.com', '0912345678', '中山路123號', '台北市', '100', '台灣'),
('C002', '李小華', 'li@example.com', '0987654321', '信義路456號', '台北市', '110', '台灣'),
('C003', '張大同', 'chang@example.com', '0922333444', '和平東路789號', '台北市', '105', '台灣');

-- Supplier
INSERT INTO Supplier VALUES
('供應商A', 'contactA@example.com'),
('供應商B', 'contactB@example.com'),
('供應商C', 'contactC@example.com');

-- Product
INSERT INTO Product VALUES
('P001', '手機', '最新款智慧型手機', 15000.00, 50, '供應商A'),
('P002', '筆記型電腦', '輕薄高效筆電', 30000.00, 30, '供應商B'),
('P003', '耳機', '無線藍牙耳機', 2500.00, 100, '供應商C'),
('P004', '滑鼠', '無線滑鼠', 800.00, 150, '供應商A'),
('P005', '鍵盤', '機械式鍵盤', 1200.00, 80, '供應商B');

-- Order
INSERT INTO `Order` VALUES
('O1001', 'C001', '2025-05-01', 33000.00),
('O1002', 'C002', '2025-05-02', 5800.00),
('O1003', 'C001', '2025-05-03', 2500.00);

-- OrderItem
INSERT INTO OrderItem VALUES
('O1001', 'P001', 1, 15000.00),
('O1001', 'P002', 1, 18000.00),
('O1002', 'P003', 2, 2500.00),
('O1002', 'P004', 1, 800.00),
('O1003', 'P003', 1, 2500.00);
