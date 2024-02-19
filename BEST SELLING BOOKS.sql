SELECT * FROM [dbo].[books_data$]

----------TOTAL SALES BY EACH AUTHORS

SELECT [Authors], SUM([Sales_in_millions]) AS TOTAL_SALES
FROM [dbo].[books_data$]
GROUP BY [Authors]

-----------TOP 10 SELLING BOOKS

SELECT TOP 10([Books]), [Authors], [Sales_in_millions]
FROM [dbo].[books_data$]
ORDER BY [Sales_in_millions] DESC

-----------TOTAL SALES DISTRIBUTION BY LANGUAGE

SELECT [Language], SUM([Sales_in_millions]) AS TOTAL_SALES
FROM [dbo].[books_data$]
GROUP BY [Language]
ORDER BY TOTAL_SALES DESC;

-----------TOTAL BOOKS SALES DISTRIBUTION BY YEAR

SELECT [First_Published], COUNT([Books]) AS BOOK_COUNT, SUM([Sales_in_millions]) AS TOTAL_SALES
FROM [dbo].[books_data$]
GROUP BY [First_Published]
ORDER BY [First_Published] ASC;

----------BOOK PUBLISHED BEFORE/AFTER A CERTAIN YEAR;

SELECT [Books], [Authors], First_Published
FROM [dbo].[books_data$]
WHERE [First_Published] >= 2000
ORDER BY First_Published;

SELECT [Books], [Authors], First_Published
FROM [dbo].[books_data$]
WHERE [First_Published] < 2000
ORDER BY First_Published;

----------COUNT OF BOOK PUBLISHED EACH YEAR

SELECT First_Published, COUNT([Books]) AS BOOKS_COUNT
FROM [dbo].[books_data$]
GROUP BY [First_Published]
ORDER BY First_Published;

----------AVG SALES BY LANGUAGE

SELECT [Language], AVG([Sales_in_millions]) AS AVG_SALES
FROM [dbo].[books_data$]
GROUP BY [Language]
ORDER BY AVG_SALES;

--------AVG SALES BY YEAR

SELECT [First_Published], AVG([Sales_in_millions]) AS AVG_SALES
FROM [dbo].[books_data$]
GROUP BY First_Published
ORDER BY First_Published;

----------AUTHORS WITH MOST SELLING BOOKS

SELECT [Authors], COUNT([Books]) AS TOTAL_BOOKS
FROM [dbo].[books_data$]
GROUP BY [Authors]
ORDER BY TOTAL_BOOKS DESC

-----------BOOKS WITH HIGHEST AND LOWEST SALES

SELECT [Books], [Authors], [Sales_in_millions]
FROM [dbo].[books_data$]
WHERE [Sales_in_millions] = (SELECT MAX(Sales_in_millions) FROM [dbo].[books_data$])
   OR [Sales_in_millions] = (SELECT MIN(Sales_in_millions) FROM [dbo].[books_data$]);
