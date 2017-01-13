DELETE FROM Order_Product;
DELETE FROM Orders;
DELETE FROM TrainingProgram_Employee;
DELETE FROM TrainingProgram;
DELETE FROM PaymentType;
DELETE FROM Product;
DELETE FROM ProductType;
DELETE FROM Customer;
DELETE FROM Computer;
DELETE FROM Employee;
DELETE FROM EmployeeType;
DELETE FROM Department;




DROP TABLE IF EXISTS Order_Product;
DROP TABLE IF EXISTS Orders;
DROP TABLE IF EXISTS TrainingProgram_Employee;
DROP TABLE IF EXISTS TrainingProgram;
DROP TABLE IF EXISTS PaymentType;
DROP TABLE IF EXISTS Product;
DROP TABLE IF EXISTS ProductType;
DROP TABLE IF EXISTS Customer;
DROP TABLE IF EXISTS Computer;
DROP TABLE IF EXISTS Employee;
DROP TABLE IF EXISTS EmployeeType;
DROP TABLE IF EXISTS Department;





CREATE TABLE `Department` (
	`DepartmentId` INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	`Name` TEXT NOT NULL,
	`Budget` INTEGER NOT NULL
	-- `SupervisorId` INTEGER,
	-- FOREIGN KEY (`SupervisorId`) REFERENCES `Employee`(`EmployeeId`)
	-- in an effort to remove the dependency-loop between employee and department, I'm removing the SupervisorId property. Instead, if I wish to retrieve the supervisor of a department, I'll search for the employee with the approptiate DepartmentId that also has an EmployeeType with a Name of "Supervisor"
);

insert into Department values (null, "Research and Development", 1000000);





CREATE TABLE `EmployeeType` (
	`EmployeeTypeId` INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	`Name` TEXT NOT NULL,
	`SecurityLevel` INTEGER NOT NULL
);

insert into EmployeeType values (null, "Supervisor", 3);






CREATE TABLE `Employee` (
	`EmployeeId` INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	`FirstName` TEXT NOT NULL,
	`LastName` TEXT NOT NULL,
	`HireDate` TEXT NOT NULL,
	`DepartmentId` INTEGER NOT NULL,
	`EmployeeTypeId` INTEGER NOT NULL,
	FOREIGN KEY (`DepartmentId`) REFERENCES `Department`(`DepartmentId`),
	FOREIGN KEY (`EmployeeTypeId`) REFERENCES `EmployeeType`(`EmployeeTypeId`)
);

insert into Employee select 
	null, "Samuel", "Phillips", "10/15/1995", d.DepartmentId, et.EmployeeTypeId 
	from Department d, EmployeeType et
	where d.Name = "Research and Development" and et.Name = "Supervisor";





CREATE TABLE `Computer` (
	`ComputerId` INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	`PurchaseDate` TEXT NOT NULL,
	`DecommissionDate` TEXT NOT NULL,
	`Model` TEXT NOT NULL,
	`EmployeeId` INTEGER NOT NULL,
	FOREIGN KEY (`EmployeeId`) REFERENCES `Employee`(`EmployeeId`)
);

insert into Computer select 
	null, "1/1/2017", "N/A", "Macbook Pro", e.EmployeeId
	from Employee e
	where e.FirstName = "Samuel" and e.LastName = "Phillips";












CREATE TABLE `Customer` (
	`CustomerId` INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	`FirstName` TEXT NOT NULL,
	`LastName` TEXT NOT NULL,
	`CreationDate` TEXT NOT NULL,
	`IsInactive` BOOLEAN NOT NULL DEFAULT 0,
	`DaysSinceActive` INTEGER NOT NULL DEFAULT 0
	-- `ActiveOrderId` INTEGER NOT NULL,    this data will be accessed through orders, not through customer
	-- FOREIGN KEY (`ActiveOrderId`) REFERENCES `Orders`(`OrderId`)
);

insert into Customer values (null, "Allie", "Guillory", "12/19/1994", 0, 0);
insert into Customer values (null, "Ben", "Retersdor", "5/13/2012", 0, 0);



CREATE TABLE `ProductType` (
	`ProductTypeId` INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	`Name` TEXT NOT NULL,
	`Format` TEXT NOT NULL
);

insert into ProductType values (null, "Instrument", "Physical");




CREATE TABLE `Product` (
	`ProductId` INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	`Title` TEXT NOT NULL,
	`Description` TEXT NOT NULL,
	`Price` INTEGER NOT NULL,
	`ProductTypeId` INTEGER NOT NULL,
	`SellerId` INTEGER NOT NULL,
	FOREIGN KEY (`ProductTypeId`) REFERENCES `ProductType`(`ProductTypeId`),
	FOREIGN KEY (`SellerId`) REFERENCES `Customer`(`CustomerId`)
);

insert into Product select 
	null, "Guitar", "6-stringed instrument, great for shredding gnarly riffs, bro!", 500, pt.ProductTypeId, s.CustomerId
	from ProductType pt, Customer s
	where pt.Name = "Instrument" and s.FirstName = "Allie" and s.LastName = "Guillory";








CREATE TABLE `PaymentType` (
	`PaymentTypeId` INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	`Name` TEXT NOT NULL,
	`AccountNumber` TEXT NOT NULL,
	`CustomerId` INTEGER NOT NULL
);

insert into PaymentType select
	null, "Visa", "11111111111112", c.CustomerId
	from Customer c 
	where c.FirstName = "Ben" and c.LastName = "Retersdor";













CREATE TABLE `TrainingProgram` (
	`TrainingProgramId` INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	`Name` TEXT NOT NULL,
	`StartDate` TEXT NOT NULL,
	`EndDate` TEXT NOT NULL,
	`MaximumAttendees` INTEGER NOT NULL
);

insert into TrainingProgram values (null, "How to NOT be a Jerk", "Today", "Tomorrow", 50);







CREATE TABLE `TrainingProgram_Employee` (
	`TrainingProgram_EmployeeId` INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	`EmployeeId` INTEGER NOT NULL,
	`TrainingProgramId` INTEGER NOT NULL,
	FOREIGN KEY (`EmployeeId`) REFERENCES `Employee`(`EmployeeId`),
	FOREIGN KEY (`TrainingProgramId`) REFERENCES `TrainingProgram`(`TrainingProgramId`)
);


insert into TrainingProgram_Employee select
	null, e.EmployeeId, tp.TrainingProgramId
	from Employee e, TrainingProgram tp
	where e.FirstName = "Samuel" and e.LastName = "Phillips" and tp.Name = "How to NOT be a Jerk";




CREATE TABLE `Orders` (
	`OrderId` INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	`OrderStatus` TEXT NOT NULL,
	`CustomerId` INTEGER NOT NULL,
	`PaymentTypeId` INTEGER NOT NULL,
	FOREIGN KEY (`CustomerId`) REFERENCES `Customer`(`CustomerId`),
	FOREIGN KEY (`PaymentTypeId`) REFERENCES `PaymentType`(`PaymentTypeId`)
);

insert into Orders select
	null, "Active", c.CustomerId, pt.PaymentTypeId
	from Customer c, PaymentType pt
	where c.FirstName = "Ben" and c.LastName = "Retersdor" and pt.Name = "Visa" and pt.CustomerId = c.CustomerId;









CREATE TABLE `Order_Product` (
	`Order_ProductId` INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	`OrderId` INTEGER NOT NULL,
	`ProductId` INTEGER NOT NULL,
	FOREIGN KEY (`OrderId`) REFERENCES `Orders`(`OrderId`),
	FOREIGN KEY (`ProductId`) REFERENCES `Product`(`ProductId`)
);

insert into Order_Product select
	null, o.OrderId, p.ProductId
	from Orders o, Product p, Customer c
	where o.OrderStatus = "Active" and c.FirstName = "Ben" and c.LastName = "Retersdor" and p.Title = "Guitar" and o.CustomerId = c.CustomerId;








-- CREATE TABLE `Customer_PaymentType` (
-- 	`Customer_PaymentTypeId` INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
-- 	`CustomerId` INTEGER NOT NULL,
-- 	`PaymentTypeId` INTEGER NOT NULL,
-- 	FOREIGN KEY (`CustomerId`) REFERENCES `Customer`(`CustomerId`),
-- 	FOREIGN KEY (`PaymentTypeId`) REFERENCES `PaymentType`(`PaymentTypeId`)
-- );

-- insert into Customer_PaymentType select 
-- 	null, c.CustomerId, pt.PaymentTypeId
-- 	from Customer c, PaymentType pt
-- 	where 








