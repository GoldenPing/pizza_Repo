// TP 1 

SELECT * FROM Album a;
SELECT Name, Composer  FROM Track t;
SELECT Name, Composer FROM Track t WHERE Composer = 'AC/DC';

// TP 2 

SELECT a.Title , a2.Name FROM Album a, Artist a2 WHERE a.ArtistId = a2.ArtistId;
-- SELECT a.Title , art.Name FROM Album a INNER JOIN Artist art ON a.ArtistId = art.ArtistId ;

SELECT 
a.Title ,
t.Name ,
g.Name ,
mt.Name 
FROM 
Track t,
Album a,
Genre g,
MediaType mt
WHERE 
t.AlbumId = a.AlbumId AND t.GenreId = g.GenreId AND t.MediaTypeId = mt.MediaTypeId;

SELECT 
a.Title ,
t.Name ,
g.Name ,
mt.Name 
FROM 
Track t
INNER JOIN Album a ON a.AlbumId = t.AlbumId 
INNER JOIN Genre g ON g.GenreId = t.GenreId  
INNER JOIN MediaType mt ON mt.MediaTypeId  = t.TrackId 

SELECT 
a.Title ,
t.Name ,
g.Name ,
mt.Name ,
art.Name 
FROM 
Track t,
Album a,
Genre g,
MediaType mt,
Artist art
WHERE 
t.AlbumId = a.AlbumId AND t.GenreId = g.GenreId AND t.MediaTypeId = mt.MediaTypeId AND a.ArtistId = art.ArtistId;

SELECT 
a.Title ,
t.Name ,
g.Name ,
mt.Name ,
art.Name 
FROM 
Track t
INNER JOIN Album a ON a.AlbumId = t.AlbumId 
JOIN Genre g ON g.GenreId = t.GenreId  
JOIN MediaType mt ON mt.MediaTypeId  = t.MediaTypeId  
INNER JOIN Artist art ON art.ArtistId = a.ArtistId  

SELECT DISTINCT 
cheff.LastName, cheff.FirstName, cheff.ReportsTo, cheff.EmployeeId 
FROM 
Employee cheff
JOIN Employee larbin ON cheff.EmployeeId = larbin.ReportsTo 

// TP 3 
 
SELECT COUNT(*) FROM Artist a ;

 
SELECT a.Title , a2.Name ,COUNT(t.Name) AS 'nombre de track'   
FROM Album a, Artist a2 , Track t 
WHERE a.ArtistId = a2.ArtistId AND a2.Name = "AC/DC" AND t.AlbumId = a.AlbumId 
GROUP BY a.Title ;


SELECT 
a2.Name  , SUM(il.InvoiceLineId) AS 'Nombre de Vente'
FROM 
Track t LEFT JOIN InvoiceLine il ON t.TrackId = il.TrackId,
Album a , Artist a2 
WHERE t.TrackId = il.TrackId AND a.AlbumId  = t.TrackId AND a2.ArtistId  = a.ArtistId   
GROUP BY a2.Name 
ORDER BY 2 DESC ;

SELECT 
t.Name, SUM(il.InvoiceLineId),SUM(il.InvoiceLineId)*il.UnitPrice As "TOTAUX"
FROM 
Track t , InvoiceLine il 
WHERE t.TrackId = il.TrackId  
GROUP BY t.Name 
ORDER BY SUM(il.Quantity) DESC 
LIMIT 10



SELECT Name FROM (SELECT 
g.Name , COUNT(il.InvoiceLineId) AS "nombre de succés" 
FROM 
Genre g 
JOIN Track t on g.GenreId = t.TrackId 
JOIN InvoiceLine il ON t.TrackId = il.TrackId 
GROUP by 1 
ORDER BY 2 DESC )


SELECT  a2.Name ,COUNT(il.InvoiceLineId) AS 'nombre de vente'   
FROM Album a
JOIN Artist a2 			 ON a.AlbumId = a2.ArtistId  
JOIN Track t 			 ON t.AlbumId  = a.AlbumId 
LEFT JOIN InvoiceLine il ON il.TrackId = t.TrackId 
GROUP BY a2.Name  
HAVING COUNT(il.InvoiceLineId) = 0


SELECT  a2.Name, SUM(il.Quantity)    
FROM Album a
JOIN Artist a2 			 ON a.AlbumId = a2.ArtistId  
JOIN Track t 			 ON t.AlbumId  = a.AlbumId 
JOIN InvoiceLine il ON il.TrackId = t.TrackId 
GROUP BY a2.Name 
ORDER BY SUM(il.Quantity) DESC 
LIMIT 1


SELECT * FROM (
selECT * FROM(
SELECT  a2.Name, 'TOP' as "TOP/FLOP"    
FROM Album a
JOIN Artist a2 			 ON a.AlbumId = a2.ArtistId  
JOIN Track t 			 ON t.AlbumId  = a.AlbumId 
JOIN InvoiceLine il ON il.TrackId = t.TrackId 
GROUP BY a2.Name 
ORDER BY SUM(il.Quantity) DESC 
LIMIT 1 )
UNION 
SELECT *  FROM (
SELECT  a2.Name , 'FLOP' as "TOP/FLOP"  
FROM Album a
JOIN Artist a2 			 ON a.AlbumId = a2.ArtistId  
JOIN Track t 			 ON t.AlbumId  = a.AlbumId 
Left JOIN InvoiceLine il ON il.TrackId = t.TrackId 
GROUP BY a2.Name  
HAVING COUNT(il.InvoiceLineId) = 0
 )	
)
ORDER BY 2 DESC 


