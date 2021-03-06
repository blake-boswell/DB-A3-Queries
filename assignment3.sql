-- Determine the total expense amount for each expense type
-- OUTPUT: expense type and corresponding total amount (asc. order)
SELECT Type, SUM(Amount) FROM Expense GROUP BY Type ORDER BY SUM(Amount) ASC;

-- Show the total # of trips approved for employees of ea. department. If no employees have any approved trip, the dept. info should not appear
-- OUTPUT: Department names and total number of trips
SELECT Dept.Name, COUNT(Expense.Trip_ID) FROM
Expense JOIN Trip 
ON Expense.Trip_ID = Trip.ID 
JOIN Employee ON Trip.Emp_ID = Employee.ID 
JOIN Dept ON Dept.Code = Employee.Dept
GROUP BY Dept.Name;
 

-- Show the number of distinct days when a departure and a return occur on the same day (Don't need to be from same trip)
-- OUTPUT: Number of times we get a departure and return date occurring on the same day
SELECT DISTINCT COUNT(*) FROM Trip A JOIN Trip B ON A.Return_Date = B.Dep_Date;

-- Show the corresponding employee name, departure date, name of the city visited, and the recipt submission date for ea. approved trip
-- OUTPUT: Employee.Name, Trip.Dep_Date, Trip.To_City, Expense.Submitted for ea. Trip in the Expense Table
SELECT DISTINCT Employee.Name, Trip.Dep_Date, Trip.To_City, Expense.Submitted FROM Expense 
LEFT JOIN Trip ON Expense.Trip_ID = Trip.ID 
JOIN Employee ON Trip.Emp_ID = Employee.ID
ORDER BY Employee.Name;

-- Print the costs (Estimated and actual) and corresponding trip ID's for the trips where the estimated cost is less than the actual expense
-- OUTPUT: Trip.Est_Cost, Expense.Amount, Expense.Trip_ID
-- SELECT Trip.ID, Trip.Est_Cost, Expense.Amount FROM Trip JOIN Expense ON Trip.ID = Expense.Trip_ID WHERE Trip.Est_Cost < Expense.Amount ORDER BY Expense.Amount;
-- If it is the sum of all the expenses for a trip
SELECT Trip.ID, Trip.Est_Cost, SUM(Expense.Amount) FROM Trip JOIN Expense ON Trip.ID = Expense.Trip_ID GROUP BY Trip.ID, Trip.Est_Cost HAVING Trip.Est_Cost < SUM(Expense.Amount) ORDER BY Trip.ID;