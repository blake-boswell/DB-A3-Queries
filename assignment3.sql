-- Determine the total expense amount for each expense type
-- OUTPUT: expense type and corresponding total amount (asc. order)
SELECT Type, SUM(Amount) FROM Expense GROUP BY Type ORDER BY SUM(Amount) ASC;