-- Determine the total expense amount for each expense type
-- OUTPUT: expense type and corresponding total amount (asc. order)
SELECT Type, SUM(Amount) FROM Expense GROUP BY Type ORDER BY SUM(Amount) ASC;

-- Show the total # of trips approved for employees of ea. department. If no employees have any approved trip, the dept. info should not appear
-- OUTPUT: Department names and total number of trips
SELECT Dept.Name, COUNT(Expense.Trip_ID) FROM Expense JOIN (Trip JOIN (Employee JOIN Dept ON Dept.Code = Employee.Dept) ON Trip.Emp_ID = Employee.ID) ON Expense.Trip_ID = Trip.ID GROUP BY Dept.Name; 
