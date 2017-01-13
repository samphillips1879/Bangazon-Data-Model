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
	FOREIGN KEY (`DepartmentId`) REFERENCES Departments(`DepartmentId`)



);

