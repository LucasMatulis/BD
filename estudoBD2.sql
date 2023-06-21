use northwind;

select * from products;

select * from categories;

select contactname, postalcode from customers 
order by postalcode;

select contactname, postalcode from customers 
order by postalcode desc;

select contactname, postalcode, region from customers where region is not null
order by contactname desc, postalcode asc;

select categoryID ,sum(unitprice) from products group by categoryID;

SELECT productid, SUM(UnitPrice) AS TotalUnitPricePerSales
FROM products
WHERE productid > 50
GROUP BY productid
HAVING SUM(UnitPrice) >2
ORDER BY productid DESC;

select ProductID, SupplierID, categoryID from products 
where categoryID in(select categoryID from categories where categoryID=5);

CREATE TABLE covidStats 
(covidID INT, 
 coviddate datetime, 
 dailyconfirmedcases INT, 
 dailyDeaths smallint,
 country varchar(25), 
 covidFlag bit, 
 totalLoss decimal(15,2)
);

SELECT * FROM covidstats;
 
INSERT INTO covidstats VALUES (default,'2020-04-25',1000,10,'USA',1,1000000);
 
INSERT INTO covidstats(coviddate,country) VALUES ('2020-04-25','Tuvalu');
 
INSERT INTO covidstats(coviddate,dailyconfirmedcases,dailyDeaths, country,covidFlag,totalLoss) 
VALUES 
('2020-04-25',800,6,'Brazil',1,500000),
('2020-04-25',750,6,'Russia',1,550000),
('2020-04-25',0,0,'Palau',0,5000);

UPDATE covidStats SET covidFlag = 0, totalLoss = 100
WHERE covidid = 4;

ALTER TABLE covidstats
ADD continent char(12);
 
ALTER TABLE covidstats
change continent continent2 varchar(15);
 
ALTER TABLE covidstats
DROP Column continent2;

DELETE FROM covidstats WHERE country = 'Brazil' AND covidFlag = 1;

delete 
FROM covidstats
ORDER BY covidID DESC LIMIT 2;

DROP TABLE covidstats;