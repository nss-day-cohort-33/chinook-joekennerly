-- 1. Provide a query showing Customers (just their full names, customer ID and country) who are not in the US.
SELECT * FROM Customer as c
WHERE c.Country != "USA";

-- 2. Provide a query only showing the Customers from Brazil.

SELECT * FROM Customer as c
WHERE c.Country = "Brazil";

-- 3. Provide a query showing the Invoices of customers who are from Brazil. The resultant table should show the customer's full name, Invoice ID, Date of the invoice and billing country.





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
