select * from products;

select contactname, postalcode from customers 
order by postalcode;

select contactname, postalcode from customers 
order by postalcode desc;

select contactname, postalcode, region from customers where region is not null
order by contactname desc, postalcode asc;

select categoryID ,sum(unitprice) from products group by categoryID;

