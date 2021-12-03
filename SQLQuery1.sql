USE AdventureWorks2017

SELECT * FROM HumanResources.Employee
/* HUMAN RESOURCE ALL
*/
SELECT LoginID,JobTitle,OrganizationLevel  FROM HumanResources.Employee
/* HUMAN RESOURCE SELECTED
*/
SELECT 'ID' = BusinessEntityID, 'Tanggal Lahir' = BirthDate FROM HumanResources.Employee
/* CARA PERTAMA UNTUK MENGUBAH NAMA ATRIBUT
*/
SELECT 'ID'  BusinessEntityID, 'Tanggal Lahir'  BirthDate FROM HumanResources.Employee
/* CARA KEDUA
*/
SELECT 'ID' AS BusinessEntityID, 'Tanggal Lahir'  AS BirthDate FROM HumanResources.Employee
/* CARA KETIGA
*/
SELECT  * FROM HumanResources.EmployeePayHistory

SELECT BusinessEntityID, RATE, RATA_RATA_PER_HARI = 2 * RATE FROM HumanResources.EmployeePayHistory
/* OPERASI ARITMATIKA
*/
SELECT * FROM HumanResources.EmployeeDepartmentHistory WHERE DepartmentID = '4'
/* MENCARI DATA SPESIFIK 
*/
SELECT   DepartmentID, ShiftID FROM HumanResources.EmployeeDepartmentHistory WHERE DepartmentID = '4' 
/* MENCARI DATA SPESIFIK
*/
SELECT * FROM HumanResources.EmployeePayHistory WHERE BusinessEntityID <= 5
/* KOMPARASI 
*/
SELECT * FROM HumanResources.Employee ORDER BY VacationHours DESC
/* DARI YANG TERBESAR KE YANG TERBESAR BISA ALFABET BISA ANGKA
*/
SELECT * FROM HumanResources.Employee ORDER BY VacationHours ASC
/* DARI YANG TERBESAR KE YANG TERKECIL 
*/
SELECT * from HumanResources.Employee

SELECT TOP 10 WITH TIES BusinessEntityID,HireDate, JobTitle, sickleavehours from HumanResources.Employee WHERE HireDate >= '1/1/2009' AND HireDate <= '12/31/2009' ORDER BY HireDate DESC
/* MENCARI TOP TEN BERDASARKAN HIRED DATE YANG TERBESAR  
*/