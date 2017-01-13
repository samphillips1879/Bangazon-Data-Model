-- DELETE FROM Employees;
-- DELETE FROM Departments;
-- DELETE FROM Computers;
-- DELETE FROM TrainingPrograms;
-- DELETE FROM ProductTypes;
-- DELETE FROM Products;
-- DELETE FROM Orders;
-- DELETE FROM PaymentTypes;
-- DELETE FROM Customers;
-- DELETE FROM TrainingPrograms_Employees;
-- DELETE FROM Orders_Products;
-- DELETE FROM Employee_Types;
-- DELETE FROM Customers_PaymentTypes;







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



CREATE TABLE `Employees` (
	`EmployeeId` INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	`FirstName` TEXT NOT NULL,
	`LastName` TEXT NOT NULL,
	`HireDate` TEXT NOT NULL,
	`DepartmentId` INTEGER NOT NULL,
	`EmployeeTypeId` INTEGER NOT NULL,
	FOREIGN KEY (`DepartmentId`) REFERENCES Departments(`DepartmentId`)



);

