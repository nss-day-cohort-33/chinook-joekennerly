-- 1. Provide a query showing Customers (just their full names, customer ID and country) who are not in the US.
SELECT c.FirstName, c.LastName, c.CustomerId, c.Country FROM Customer as c
WHERE c.Country != "USA";

-- 2. Provide a query only showing the Customers from Brazil.

SELECT * FROM Customer as c
WHERE c.Country = "Brazil";

-- 3. Provide a query showing the Invoices of customers who are from Brazil. The resultant table should show the customer's full name, Invoice ID, Date of the invoice and billing country.

SELECT c.FirstName || ' ' || c.LastName as fullName, i.InvoiceId, i.InvoiceDate, i.BillingCountry
FROM Invoice as i
JOIN Customer as c
WHERE c.Country = "Brazil";

-- 4. Provide a query showing only the Employees who are Sales Agents.

SELECT * FROM Employee as e
WHERE e.Title = "Sales Support Agent";

-- 5. Provide a query showing a unique/distinct list of billing countries from the Invoice table.

SELECT DISTINCT i.BillingCountry FROM Invoice as i;

-- 6. Provide a query that shows the invoices associated with each sales agent. The resultant table should include the Sales Agent's full name.






SELECT * FROM Track;
SELECT * FROM Album;
SELECT * FROM Artist;
SELECT * FROM Customer;
SELECT * FROM Employee;
SELECT * FROM Genre;
SELECT * FROM Invoice;
SELECT * FROM InvoiceLine;
SELECT * FROM MediaType;
SELECT * FROM Playlist;
SELECT * FROM PlaylistTrack;
