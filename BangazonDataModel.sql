-- DELETE FROM Employee;
-- DELETE FROM Department;
-- DELETE FROM Computer;
-- DELETE FROM TrainingProgram;
-- DELETE FROM ProductType;
-- DELETE FROM Product;
-- DELETE FROM Order;
-- DELETE FROM PaymentType;
-- DELETE FROM Customer;
-- DELETE FROM TrainingProgram_Employee;
-- DELETE FROM Order_Product;
-- DELETE FROM Employee_Type;
-- DELETE FROM Customer_PaymentType;







DROP TABLE IF EXISTS Employee;
DROP TABLE IF EXISTS Department;
DROP TABLE IF EXISTS Computer;
DROP TABLE IF EXISTS TrainingProgram;
DROP TABLE IF EXISTS ProductType;
DROP TABLE IF EXISTS Product;
DROP TABLE IF EXISTS Orders;
DROP TABLE IF EXISTS PaymentType;
DROP TABLE IF EXISTS Customer;
DROP TABLE IF EXISTS TrainingProgram_Employee;
DROP TABLE IF EXISTS Order_Product;
DROP TABLE IF EXISTS Employee_Type;
DROP TABLE IF EXISTS Customer_PaymentType;



CREATE TABLE `Employee` (
	`EmployeeId` INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	`FirstName` TEXT NOT NULL,
	`LastName` TEXT NOT NULL,
	`HireDate` TEXT NOT NULL,
	`DepartmentId` INTEGER NOT NULL,
	`EmployeeTypeId` INTEGER NOT NULL,
	FOREIGN KEY (`DepartmentId`) REFERENCES `Departments`(`DepartmentId`),
	FOREIGN KEY (`EmployeeTypeId`) REFERENCES `EmployeeType`(`EmployeeTypeId`)
);

CREATE TABLE `Department` (
	`DepartmentId` INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	`Name` TEXT NOT NULL,
	`Budget` INTEGER NOT NULL,
	`SupervisorId` INTEGER NOT NULL,
	FOREIGN KEY (`SupervisorId`) REFERENCES `Employee`(`EmployeeId`)
);

CREATE TABLE `Computer` (
	`ComputerId` INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	`PurchaseDate` TEXT NOT NULL,
	`DecommissionDate` TEXT NOT NULL,
	`Model` TEXT NOT NULL,
	`EmployeeId` INTEGER NOT NULL,
	FOREIGN KEY (`EmployeeId`) REFERENCES `Employee`(`EmployeeId`)
);

CREATE TABLE `TrainingProgram` (
	`TrainingProgramId` INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	`Name` TEXT NOT NULL,
	`StartDate` TEXT NOT NULL,
	`EndDate` TEXT NOT NULL,
	`MaximumAttendees` INTEGER NOT NULL
);

CREATE TABLE `ProductType` (
	`ProductTypeId` INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	`Name` TEXT NOT NULL,
	`Format` TEXT NOT NULL
);

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

CREATE TABLE `Orders` (
	`OrderId` INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	`OrderStatus` TEXT NOT NULL,
	`CustomerId` INTEGER NOT NULL,
	`PaymentTypeId` INTEGER NOT NULL,
	FOREIGN KEY (`CustomerId`) REFERENCES `Customer`(`CustomerId`),
	FOREIGN KEY (`PaymentTypeId`) REFERENCES `PaymentType`(`PaymentTypeId`)
);

CREATE TABLE `PaymentType` (
	`PaymentTypeId` INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	`Name` TEXT NOT NULL,
	`AccountNumber` TEXT NOT NULL
);

CREATE TABLE `Customer` (
	`CustomerId` INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	`FirstName` TEXT NOT NULL,
	`LastName` TEXT NOT NULL,
	`CreationDate` TEXT NOT NULL,
	`IsInactive` BOOLEAN NOT NULL DEFAULT 0,
	`DaysSinceActive` INTEGER NOT NULL DEFAULT 0,
	`ActiveOrderId` INTEGER NOT NULL,
	FOREIGN KEY (`ActiveOrderId`) REFERENCES `Orders`(`OrderId`)
);

CREATE TABLE `TrainingProgram_Employee` (
	`TrainingProgram_EmployeeId` INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	`EmployeeId` INTEGER NOT NULL,
	`TrainingProgramId` INTEGER NOT NULL,
	FOREIGN KEY (`EmployeeId`) REFERENCES `Employee`(`EmployeeId`),
	FOREIGN KEY (`TrainingProgramId`) REFERENCES `TrainingProgram`(`TrainingProgramId`)
);

CREATE TABLE `Order_Product` (
	`Order_ProductId` INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	`OrderId` INTEGER NOT NULL,
	`ProductId` INTEGER NOT NULL,
	FOREIGN KEY (`OrderId`) REFERENCES `Orders`(`OrderId`),
	FOREIGN KEY (`ProductId`) REFERENCES `Product`(`ProductId`)
);

CREATE TABLE `Employee_Type` (
	`Employee_TypeId` INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	`Name` TEXT NOT NULL,
	`SecurityLevel` INTEGER NOT NULL
);

CREATE TABLE `Customer_PaymentType` (
	`Customer_PaymentTypeId` INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	`CustomerId` INTEGER NOT NULL,
	`PaymentTypeId` INTEGER NOT NULL,
	FOREIGN KEY (`CustomerId`) REFERENCES `Customer`(`CustomerId`),
	FOREIGN KEY (`PaymentTypeId`) REFERENCES `PaymentType`(`PaymentTypeId`)
);



