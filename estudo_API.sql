create database  exemplo_pi;

use exemplo_pi;

create table cliente(
id int primary key auto_increment,
nome varchar(100),
cpf varchar(11));

select * from cliente;

insert into cliente(nome,cpf) values('Lucas','35542458874');

update cliente set nome='joao' where id=1;

delete from cliente where id =1;