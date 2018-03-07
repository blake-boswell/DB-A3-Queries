-- Determine the total expense amount for each expense type
-- OUTPUT: expense type and corresponding total amount (asc. order)
SELECT Type, SUM(Amount) FROM Expense GROUP BY Type ORDER BY SUM(Amount) ASC;

-- Show the total # of trips approved for employees of ea. department. If no employees have any approved trip, the dept. info should not appear
-- OUTPUT: Department names and total number of trips
SELECT Dept.Name, COUNT(Expense.Trip_ID) FROM
Expense JOIN 
(Trip JOIN (Employee JOIN Dept ON Dept.Code = Employee.Dept) ON Trip.Emp_ID = Employee.ID)
ON Expense.Trip_ID = Trip.ID 
GROUP BY Dept.Name; 

-- Show the number of distinct days when a departure and a return occur on the same day (Don't need to be from same trip)
-- OUTPUT: Number of times we get a departure and return date occurring on the same day
SELECT DISTINCT COUNT(*) FROM Trip A JOIN Trip B ON A.Return_Date = B.Dep_Date;

-- Show the corresponding employee name, departure date, name of the city visited, and the recipt submission date for ea. approved trip
-- OUTPUT: Employee.Name, Trip.Dep_Date, Trip.To_City, Expense.Submitted for ea. Trip in the Expense Table
SELECT DISTINCT Employee.Name, Trip.Dep_Date, Trip.To_City, Expense.Submitted FROM Expense 
JOIN Trip ON Expense.Trip_ID = Trip.ID 
JOIN Employee ON Trip.Emp_ID = Employee.ID
ORDER BY Employee.Name;