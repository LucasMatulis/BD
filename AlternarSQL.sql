use northwind;

select  * from orders;

select * from order_details;

select * from products;

select  * from orders order by CustomerID asc;

select  CustomerID as CodigoCliente, count(CustomerID) as QTDPedidos
from orders  
group by CustomerID 
order by CustomerID asc;

select CategoryID, count(ProductID)
from products
group by CategoryID;

#exercicio1

select  EmployeeID as CodigoFuncionario, count(OrderID) as QTDPedidos
from orders  
group by EmployeeID
order by EmployeeID asc;

#exercicio2

select  OrderID as CodigoPedido, count(ProductID) as QTDProduto
from order_details  
group by OrderID
order by OrderID asc;

#exercicio3

select shipvia as Empresa, count(OrderID) as QTDPedidos
from orders
group by shipvia
order by count(OrderID) desc;

#exercicio4

select supplierID, count(ProductID)
from products
group by SupplierID;

#Aula

select orderID,
		productID,
        quantity,
        UnitPrice,
        (Quantity*UnitPrice)
from order_details;

select orderID,
	   sum((Quantity*UnitPrice)) as CustoCadaPedido
from order_details
group by OrderID;

select 	orders.CustomerID, 
		orders.orderId, 
		sum((order_details.Quantity * order_details.UnitPrice)) as CustoCadaPedido
from orders inner join order_details
	on orders.OrderID=order_details.OrderID
    group by orders.CustomerID, orders.OrderID;
    
    select 	orders.CustomerID, 
		sum((order_details.Quantity * order_details.UnitPrice)) as CustoCadaPedido
from orders inner join order_details
	on orders.OrderID=order_details.OrderID
    group by orders.CustomerID;
    
    
    select categories.CategoryID as codCat,
			categories.CategoryName as NomeCategoria,
            products.ProductID as CodProd,
            products.ProductName as NomeProd,
            products.UnitPrice as PrecoProd,
			suppliers.CompanyName as NomeCompania
            from products inner join categories
            on products.CategoryID=categories.CategoryID
            inner join suppliers
            on suppliers.SupplierID= products.SupplierID;
            
	#Exercicio1
	
    select orders.CustomerID,
			customers.ContactName,
            orders.OrderID,
            orders.OrderDate,
            orders.ShipVia
            from orders inner join customers
            on orders.CustomerID=customers.CustomerID;
            
	#Exercicio2
    
    select suppliers.SupplierID,
			suppliers.CompanyName,
            suppliers.ContactName,
            products.ProductID,
            products.ProductName,
            products.UnitPrice,
            products.UnitsInStock
            from suppliers inner join products
            on suppliers.SupplierID=products.SupplierID
            order by products.UnitPrice;
    
	
    #Exercicio3
    
    select employees.employeeid,
			employees.FirstName,
            orders.OrderID,
            sum(order_details.unitprice*order_details.Quantity) as ValorPedido,
            count(order_details.OrderID) as quantidadeDeItens,
            orders.orderDate
            from employees inner join orders
            on employees.EmployeeID=orders.EmployeeID
            inner join order_details
            on orders.OrderID=order_details.OrderID
            group by employees.employeeid,
					employees.FirstName,
					orders.OrderID,
                    orders.orderDate;
                    
                    
	#----------------------Aula----------------------------
    
    select customers.CustomerID,
    orders.OrderID,
    orders.OrderDate from customers left outer join orders
    on customers.customerID=orders.customerID;
    
      select customers.CustomerID,
    orders.OrderID,
    orders.OrderDate from orders right outer join customers
    on customers.customerID=orders.customerID;
    
    
    #Exercicio 4
    
    select products.ProductID,
    products.ProductName,
    order_details.OrderID
    from products left outer join order_details
    on products.ProductID=order_details.ProductID
    where order_details.OrderID is null;
    
    #-------------------Left e right outer join---------------------------------
    
    select  ct.CustomerID, 
    ct.contactName, 
    od.OrderID, 
    od.orderDate
    from customers as CT left outer join orders as OD
    on ct.CustomerID= od.CustomerID
    where od.orderID is null
    
    union

    select ct.CustomerID,
    ct.contactName, 
    od.OrderID, 
    od.orderDate
    from customers as CT right outer join orders as OD
    on ct.CustomerID= od.CustomerID
    where ct.customerID is null;
    
    #Exercicio
    
    select products.ProductID,
		   products.productName,
           categories.CategoryID,
           categories.CategoryName
           from products right outer join categories
           on products.CategoryID=categories.CategoryID
           where products.ProductID is null
           
           union
           
			select products.ProductID,
		   products.productName,
           categories.CategoryID,
           categories.CategoryName
           from products left outer join categories
           on products.CategoryID=categories.CategoryID
           where categories.CategoryID is null;
           
           
           #-----------------------create view---------------------------
           
           create view cliente
           as
           select customerID,
           contactName
           from customers;
           
           select * from cliente;
           
           create or replace view cliente
            as
           select customerID,
           contactName,
           city,
           Region
           from customers;
           
           select * from cliente where city='Madrid';
           
           #exercicios view
           
           #ex1
           
           create or replace view ListaProdutosSemCat
           as
			select products.ProductID,
		   products.productName,
           categories.CategoryID,
           categories.CategoryName
           from products left outer join categories
           on products.CategoryID=categories.CategoryID
           where products.CategoryID is null;
           
           select * from ListaProdutosSemCat;
           
           #ex2
           
           create or replace view ListaClientePedidos
           as
           select customers.ContactName,
           customers.customerID,
           orders.orderID,
           orders.orderDate
           from customers inner join orders
           on customers.CustomerID=orders.CustomerID;
           
           select * from ListaClientePedidos;
           
           
           #---------------Funções-------------------------
           
           select ucase('banco de dados');
           select lcase('BANCO DE DADOS');
           
           select concat('meu nome é: ', 'lucas');
           
           select concat(ucase(contactname), ' ', address) from customers;
           
           select orderID, orderDate, ADDDATE(orderDate,30) from orders;
           
           select DATEDIFF('2010-05-03','2010-05-04');
           
           select orderID, orderDate, DATEDIFF(curDate(),orderDate) from orders; 
           
           SELECT DATE_FORMAT('2010-05-03', '%d/%m/%Y');
           
           select orderID, orderDate, Date_Format(orderdate,'%d/%m/%Y') from orders; 
           
           SELECT DATE_FORMAT('2010-05-03','%W,%M of %Y');
           
		   select orderID, orderDate, Date_Format(orderdate,'%W,%M of %y') from orders; 
           
          
          delimiter $$
          create function ObterTitulo(IDfunc int)
           returns char(4)
           deterministic
           begin
           declare StrTitulo char(4);
           select titleOfCourtesy into StrTitulo from employees
           where EmployeeID=IDfunc;
           return StrTitulo;
           end
           $$
           
           select ObterTitulo(1);
           
           
           
           
           
           #Exercicio1
           
            delimiter $$
          create function RetornarUpTitle(IDfunc int)
           returns char(10)
           deterministic
           begin
           declare StrTitulo char(10);
           select ucase(titleOfCourtesy) into StrTitulo from employees
           where EmployeeID=IDfunc;
           if StrTitulo='MS.' then 
           set StrTitulo='Senhorita';
           elseif StrTitulo='DR.' then
           set StrTitulo='doutor';
           elseif StrTitulo='MRS.' then
           set StrTitulo='senhora';
           else
           set StrTitulo='Senhor';
           end if;
           return StrTitulo;
           end
           $$
           
           
           select RetornarUpTitle(2);
           
           
           #-------------------------codigo para procedure de select--------------------------------
           
           select * from region;
           
           delimiter $$
           create procedure sp_insereRegiao(idRegiao int, DSCregiao char(50))
           begin
           if(idRegiao is not null and 
			  DSCregiao is not null)
              then insert into region (regionid, regiondescription)
              values(idRegiao, DSCregiao);
              end if;
              end
              $$
              
		   call sp_insereRegiao(6,'Nordeste');
           
           #ex1
             delimiter $$
           create procedure sp_mudarRegiao(idRegiao int, DSCregiao char(50))
           begin
           if(idRegiao is not null and 
			  DSCregiao is not null)
              then update region set regiondescription=DSCregiao
              where regionid=idRegiao;
              end if;
              end
              $$
              
              call sp_mudarRegiao(5,'Sudoeste');
              
              #ex2
             delimiter $$
           create procedure sp_listaRegiao(idRegiao int)
           begin
           if(idRegiao is null)
           then select * from region;
           else select * from region
           where regionid=idRegiao;
              end if;
              end
              $$
              
              call sp_listaRegiao(2);
              
              #ex3
                  delimiter $$
           create procedure sp_deletarRegiao(idRegiao int)
           begin
           if(idRegiao is not null)
              then delete from region
              where regionid=idRegiao;
              end if;
              end
              $$
              
              call sp_deletarRegiao(6);
              
              #--------------triggers------------------------------
              
              delimiter $$
              create trigger tr_atualizaEstoque after insert on order_details
              for each row
              begin
              if (new.productid is not null and new.quantity is not null)
              then update products
              set unitsinstock=unitinstock-new.quantity
              where productid=new.productid;
              end if;
              end
              $$
              
           
           