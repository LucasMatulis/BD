use northwind;

select ProductName from products;

select ReorderLevel from products;

select distinct categoryID from products;

select * from products where categoryID=1;

select * from suppliers where ContactTitle like 'MARKETING Manager';

select * from products where categoryID in (2,3);

#O % antes da palavra é pra pesquisar qualquer coisa onde a palavra venha por ultimo e depois e se a palavra vier primeiro 
select * from suppliers where ContactTitle like '%manager%';

select * from suppliers where Address like '%ST%';

select * from orders where OrderDate >'1997-08-15 00:00:00';

select * from orders where OrderDate >'1997-08-15 00:00:00' and OrderDate< '1997-10-08 00:00:00';

select * from orders where OrderDate between '1997-08-15 00:00:00' and '1997-08-17 00:00:00';

select productName, unitprice from products ;

select productName, unitprice, unitprice+10 as 'UnitPrice + 10' from products ;

CREATE TABLE products2 SELECT productName, unitprice, unitprice+10 FROM products;

#No que for feita outra sessão esta tabela temporarira ira sumir e tera q ser recriada de novo
CREATE temporary TABLE tmpproduct SELECT productName, unitprice, unitprice+10 FROM products;

delete from products2 where productname like 'chai';

update products2 set productName='Mengao' where productName like 'chang';


#JOINS---------------------------------------------------------------

#INNER JOIN

create table myemploye (employeID int, firstname varchar(20), lastname varchar(20));

insert into myemploye values (1,'Lucas','Matulis');
insert into myemploye values (2,'Joao','Matulis');
insert into myemploye values (3,'Leo','Matulis');

create table mysalary(employeID int, salaray float);

insert into mysalary values(1, 10000);
insert into mysalary values(2, 20000);
insert into mysalary values(3, 30000);

select A.firstname, A.lastname, B.salaray from myemploye A inner join mysalary B on A.employeID=B.employeID;

#LEFT OUTER JOIN

create table myphone(employeID int , phonenumber int);

insert into myphone values(1,1231313);
insert into myphone values(2,3453453);

select A.firstname, A.lastname, B.phonenumber from myemploye A left join myphone B on A.employeID=B.employeID;

#RIGHT OUTER JOIN

create table myparking (employeID int, parkingspot varchar(20));

insert into myparking values(1, 'a1');
insert into myparking values(2, 'a2');

select A.parkingspot,B.firstname, B.lastname from myparking A right join myemploye B on A.employeID=B.employeID; 

#FULL OUTER JOING

create table mycustomer(customerID int, customername varchar(20));

insert into mycustomer values(1, 'Mister');
insert into mycustomer values(2, 'Maestro');

create table myorder(ordernumber int, ordername varchar(20), customerID int);

insert into myorder values(1, 'ordem1',1);
insert into myorder values(2, 'ordem2',2);
insert into myorder values(3, 'ordem3',7);
insert into myorder values(4, 'ordem4',8);

select A.customerID,A.customername,B.ordernumber,B.ordername from mycustomer A  right join myorder B on A.customerID=B.customerID

union

select A.customerID,A.customername,B.ordernumber,B.ordername from mycustomer A  left join myorder B on A.customerID=B.customerID;

#CROSS JOIN

select * from mycustomer cross join mysalary;

#DATAS

select curdate();

select curdate()-2;


#DATEPART

select year(curdate()) as 'ano atual';

select month(curdate()) as  'mes atual';

select day(curdate()) as 'dia atual';


#DATEADD

SELECT DATE_ADD(curdate(), INTERVAL 10 DAY);  

SELECT DATE_ADD(curdate(), INTERVAL 10 MONTH);  

SELECT DATE_ADD(curdate(), INTERVAL 10 YEAR); 

############

select  * from orders limit 10;

select OrderID, customerid, RequiredDate, ShippedDate, datediff(RequiredDate,ShippedDate) from orders;

select date_add(curdate(),INTERVAL -(EXTRACT(day from curdate())-1) day);

#AGGREGATE FUNCTIONS

select * from mysalary;

select avg(salaray) from mysalary;

select count(salaray) from mysalary;

select count(*) from mysalary;

select sum(salaray) from mysalary;

select min(salaray) from mysalary;

select max(salaray) from mysalary;

#MYORDER

select * from orders;

#CONCAT

select concat('flamengo ','Vasco');

select orderid, shipname, concat(shipname, ' ',rand()) as 'texto concatenado' from orders;

#left

select orderid, shipname, left(shipname, 5) from orders;

#RIGHT

select orderid, shipname, RIGHT(shipname, 5) from orders;

#SUBSTRING

select orderid, shipname, substring(shipname, 2,5) from orders;

#lowercase

select orderid, shipname, lower(shipname) from orders;

#Uppercase

select orderid, shipname, upper(shipname) from orders;

#length

select orderid, shipname, length(shipname) from orders;

select orderid, shipname, concat(upper(left(shipname,1)), lower(substring(shipname, 2, length(shipname)))) from orders;

#TRIM

select '          oi              ';

select length('           oi         ');

#LTRIM

select ltrim('           oi         ');

select rtrim('           oi         ');

select ltrim(rtrim('           oi         '));
























