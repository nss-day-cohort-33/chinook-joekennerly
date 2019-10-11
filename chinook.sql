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

SELECT i.InvoiceId, e.FirstName || ' ' || e.LastName as fullName
FROM Invoice as i
JOIN Customer as c ON i.CustomerId = c.CustomerId
JOIN Employee as e ON e.EmployeeId = c.SupportRepId;

-- 7. Provide a query that shows the Invoice Total, Customer name, Country and Sale Agent name for all invoices and customers.

SELECT i.Total, c.FirstName || ' ' || c.LastName as customerName, c.Country, e.FirstName || ' ' || e.LastName as employeeName
FROM Invoice as i
JOIN Customer as c ON c.CustomerId = i.CustomerId
JOIN Employee as e ON e.EmployeeId = c.SupportRepId
GROUP BY customerName;

SELECT c.firstName, i.InvoiceId
FROM Invoice as i
JOIN Customer as c on c.CustomerId = i.CustomerId;

-- 8. How many Invoices were there in 2009 and 2011?
SELECT COUNT(*) as "Invoices from 2009"
FROM Invoice as i
WHERE i.InvoiceDate > "2009-01-01"
AND i.InvoiceDate < "2009-12-31";

SELECT COUNT(*) as "Invoices from 2011"
FROM Invoice as i
WHERE i.InvoiceDate > "2011-01-01"
AND i.InvoiceDate < "2011-12-31";

-- 9. What are the respective total sales for each of those years?

SELECT SUM(i.Total) as "Total from 2009"
FROM Invoice as i
WHERE i.InvoiceDate > "2009-01-01"
AND i.InvoiceDate < "2009-12-31";

SELECT SUM(i.Total) as "Total from 2011"
FROM Invoice as i
WHERE i.InvoiceDate > "2011-01-01"
AND i.InvoiceDate < "2011-12-31";

-- 10. Looking at the InvoiceLine table, provide a query that COUNTs the number of line items for Invoice ID 37.

SELECT COUNT(*) as "Count for 37"
FROM InvoiceLine as i
WHERE i.InvoiceId = 37;

-- 11. Looking at the InvoiceLine table, provide a query that COUNTs the number of line items for each Invoice

SELECT il.InvoiceId, COUNT(il.InvoiceId)
FROM InvoiceLine as il;
GROUP BY il.InvoiceId;

-- 12. Provide a query that includes the purchased track name with each invoice line item

SELECT il.InvoiceId, t.Name
FROM InvoiceLine AS il
JOIN Track AS t ON t.TrackId = il.TrackId;

-- 13. Provide a query that includes the purchased track name AND artist name with each invoice line item.

SELECT il.InvoiceId, t.Name, ar.Name
FROM InvoiceLine AS il
JOIN Track AS t ON t.TrackId = il.TrackId
JOIN Album AS a ON a.AlbumId = t.AlbumId
JOIN Artist AS ar ON ar.ArtistId = a.ArtistId;

-- 14. Provide a query that shows the # of invoices per country

SELECT i.BillingCountry ,COUNT(*) AS InvoiceNum
FROM Invoice AS i
GROUP BY i.BillingCountry;

-- 15. Provide a query that shows the total number of tracks in each playlist. The Playlist name should be include on the resulant table.

SELECT p.Name, COUNT(pt.TrackId)
FROM PlaylistTrack AS pt
JOIN Playlist AS p ON p.PlaylistId = pt.PlaylistId
GROUP BY p.PlaylistId;

-- 16. Provide a query that shows all the Tracks, but displays no IDs. The result should include the Album name, Media type and Genre.

SELECT t.Name AS track, a.Title AS album, mt.Name AS mediatype, g.Name AS genre
FROM Track AS t
JOIN Album AS a ON a.AlbumId = t.AlbumId
JOIN MediaType AS mt ON mt.MediaTypeId = t.MediaTypeId
JOIN Genre AS g ON g.GenreId = t.GenreId;

-- 17. Provide a query that shows all Invoices but includes the # of invoice line items.

SELECT i.InvoiceId, COUNT(il.InvoiceId)
FROM Invoice AS i
JOIN InvoiceLine AS il ON il.InvoiceId = i.InvoiceId
GROUP BY i.InvoiceId;

-- 18. Provide a query that shows total sales made by each sales agent.

SELECT e.FirstName || ' ' || e.LastName as fullName, SUM(i.Total) as totalSales
FROM Employee AS e
JOIN Customer AS c ON c.SupportRepId = e.EmployeeId
JOIN Invoice AS i ON i.CustomerId = c.CustomerId
WHERE e.Title = "Sales Support Agent"
GROUP BY fullName;

-- 19. Which sales agent made the most in sales in 2009?

SELECT FirstName, MAX(totalSales)
FROM (SELECT e.FirstName, SUM(i.Total) AS totalSales
FROM Employee AS e
JOIN Customer AS c ON c.SupportRepId = e.EmployeeId
JOIN Invoice AS i ON i.CustomerId = c.CustomerId
WHERE i.InvoiceDate > "2009-01-01"
AND i.InvoiceDate < "2009-12-31" 
GROUP BY e.FirstName);

-- 20. Which sales agent made the most in sales over all?

SELECT FirstName, MAX(totalSales)
FROM (SELECT e.FirstName, SUM(i.Total) AS totalSales
FROM Employee AS e
JOIN Customer AS c ON c.SupportRepId = e.EmployeeId
JOIN Invoice AS i ON i.CustomerId = c.CustomerId
GROUP BY e.FirstName);

-- 21. Provide a query that shows the count of customers assigned to each sales agent.

SELECT e.FirstName, COUNT(c.CustomerId)
FROM Employee AS e
JOIN Customer AS c ON c.SupportRepId = e.EmployeeId
GROUP BY e.FirstName;

-- 22. Provide a query that shows the total sales per country.
SELECT BillingCountry, ROUND(field, 2) AS totalSales
FROM (SELECT i.BillingCountry, SUM(i.Total) AS field 
FROM Invoice AS i
GROUP BY i.BillingCountry)
;


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
