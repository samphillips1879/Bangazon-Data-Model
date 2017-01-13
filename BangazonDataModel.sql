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
DROP TABLE IF EXISTS Order;
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
	FOREIGN KEY (`DepartmentId`) REFERENCES Departments(`DepartmentId`),
	FOREIGN KEY (`EmployeeTypeId`) REFERENCES EmployeeType(`EmployeeTypeId`)
);

CREATE TABLE `Department` (
	`DepartmentId` INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	`Name` TEXT NOT NULL,
	`Budget` INTEGER NOT NULL,
	`SupervisorId` INTEGER NOT NULL,
	FOREIGN KEY (`SupervisorId`) REFERENCES Employee(`EmployeeId`)
);

CREATE TABLE `Computer` (
	`ComputerId` INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	`PurchaseDate` TEXT NOT NULL,
	`DecommissionDate` TEXT NOT NULL,
	`Model` TEXT NOT NULL,
	`EmployeeId` INTEGER NOT NULL,
	FOREIGN KEY (`EmployeeId`) REFERENCES Employee(`EmployeeId`)
);



