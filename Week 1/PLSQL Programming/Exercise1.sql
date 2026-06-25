
-- Scenario 1
--------------------------------------

BEGIN
FOR cust IN (
SELECT CustomerID, Age
FROM Customers
WHERE Age > 60
)
LOOP
UPDATE Loans
SET InterestRate = InterestRate - 1
WHERE CustomerID = cust.CustomerID;
END LOOP;

```
COMMIT;
```

END;
/

---

-- Scenario 2
-------------------------------------------

BEGIN
FOR cust IN (
SELECT CustomerID, Balance
FROM Customers
WHERE Balance > 10000
)
LOOP
UPDATE Customers
SET IsVIP = 'TRUE'
WHERE CustomerID = cust.CustomerID;
END LOOP;

```
COMMIT;
```

END;
/

---

-- Scenario 3
--------------------------

BEGIN
FOR loan_rec IN (
SELECT c.CustomerName,
l.LoanID,
l.DueDate
FROM Customers c
JOIN Loans l
ON c.CustomerID = l.CustomerID
WHERE l.DueDate BETWEEN SYSDATE
AND SYSDATE + 30
)
LOOP
DBMS_OUTPUT.PUT_LINE(
'Reminder: Loan '
|| loan_rec.LoanID
|| ' for '
|| loan_rec.CustomerName
|| ' is due on '
|| loan_rec.DueDate
);
END LOOP;
END;
/
