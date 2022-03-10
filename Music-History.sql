--1.Query all of the entries in the Genre table
SELECT * 
FROM Genre;

--2.Query all the entries in the Artist table and order by the artist's name. HINT: use the ORDER BY keywords
SELECT ArtistName
FROM Artist
ORDER BY ArtistName

--3.Write a SELECT query that lists all the songs in the Song table and include the Artist name
SELECT a.ArtistName, s.*
FROM Song AS s
JOIN Artist AS a
ON s.ArtistId = a.Id

--4.Write a SELECT query that lists all the Artists that have a Soul Album
SELECT DISTINCT a.*
FROM Artist AS a
Join Album AS b ON a.Id = b.ArtistId
Join Genre AS g ON b.GenreId = g.Id
WHERE g.Name = 'Soul'

--5.Write a SELECT query that lists all the Artists that have a Jazz or Rock Album
SELECT *
FROM Artist AS a
Join Album AS b
ON a.Id = b.ArtistId
WHERE GenreId = 4 OR GenreId = 2

--6.Write a SELECT statement that lists the Albums with no songs
SELECT *
FROM Album AS b
LEFT JOIN Song AS s
ON s.AlbumId = b.Id
WHERE s.Id is NULL

--7.Using the INSERT statement, add one of your favorite artists to the Artist table.
INSERT INTO Artist (ArtistName, YearEstablished) VALUES ('Modest Mouse', 1993);

--8.Using the INSERT statement, add one, or more, albums by your artist to the Album table.
INSERT INTO Album (Title, ReleaseDate, AlbumLength, Label, ArtistId, GenreId) VALUES ('The Lonesome Crowded West', '11/18/1997', 4438, 'Up Records', 28, 2);
SELECT * FROM Album

--9.Using the INSERT statement, add some songs that are on that album to the Song table.
INSERT INTO Song (Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId) VALUES ('Trailer Trash', 349, '11/18/1997', 2, 28, 24);
SELECT * FROM Artist

--10.Write a SELECT query that provides the song titles, album title, and artist name for all of the data you just entered in. Use the LEFT JOIN keyword sequence to connect the tables, and the WHERE keyword to filter the results to the album and artist you added.
SELECT a.Title, s.Title, Artist.ArtistName
FROM Song s
LEFT JOIN Album a
ON s.AlbumId = a.Id
LEFT JOIN Artist
ON s.ArtistId = Artist.Id
WHERE s.Title = 'Trailer Trash'

--11.Write a SELECT statement to display how many songs exist for each album. You'll need to use the COUNT() function and the GROUP BY keyword sequence.
SELECT a.Title, COUNT(s.Id)
FROM Album as a
LEFT JOIN Song as s 
ON a.Id = s.AlbumId
GROUP BY a.Title

--12.Write a SELECT statement to display how many songs exist for each artist. You'll need to use the COUNT() function and the GROUP BY keyword sequence.
SELECT COUNT(Song.Id) AS 'Number of Songs'
From Song
Join Artist ON Song.ArtistId = Artist.Id
GROUP BY Artist.Id

--13.Write a SELECT statement to display how many songs exist for each genre. You'll need to use the COUNT() function and the GROUP BY keyword sequence.
SELECT COUNT(Song.Id) AS 'Number of Songs'
From Song
JOIN Genre ON Song.GenreId = Genre.Id
GROUP BY Genre.Id

--14.Write a SELECT query that lists the Artists that have put out records on more than one record label. Hint: When using GROUP BY instead of using a WHERE clause, use the HAVING keyword
SELECT ar.artistname
FROM artist AS ar
LEFT JOIN album AS al
ON ar.id = al.artistid
GROUP BY ar.artistname
HAVING COUNT(DISTINCT al.label) > 1

--15.Using ORDER BY and TOP 1, write a select statement to find the album with the longest duration. The result should display the album title and the duration.
SELECT TOP 1 *
FROM Song
ORDER BY Song.SongLength DESC

--16.Using ORDER BY and TOP 1, write a select statement to find the song with the longest duration. The result should display the song title and the duration.

















