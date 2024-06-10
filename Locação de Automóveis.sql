create database loja;
use loja;

-- tabela clientes
create table clientes (
	cpf varchar(14) primary key,
	nome varchar(50) not null,
    nascimento date not null
);

-- tabela veiculos
create table veiculos(
	placa varchar(10) primary key,
    veiculo varchar(30) not null,
    cor varchar(20) not null,
    diaria decimal(10,2) not null
);

-- tabela locaçoes
create table locacoes(
	codLocacao int primary key,
    cpf varchar(14) not null,
    placa varchar(10) not null,
    dias int not null,
    total decimal(10,2) not null,
    foreign key (cpf) references cliente (cpf),
    foreign key (placa) references veiculos(placa)
);

-- inserções

-- clientes
insert into clientes (nome, cpf, nascimento) values
('Ariano Suassuna', '123.456.789-01', '1022-05-21'),
('Grace Hopper', '543.765.987-23', '2002-04-29'),
('Richard Feynman', '987.654.231-90', '2001-10-12'),
('Edgar Poe', '432.765.678-67', '1998-12-14'),
('Gordon Freeman', '927.384.284-44', '1984-11-26');

-- veiculos
insert into veiculos (placa, veiculo, cor, diaria) values
('WER-3456', 'Fusca', 'Preto', 30.00),
('FDS-8384', 'Variante', 'Rosa', 60.00),
('CVB-9933', 'Comodoro', 'Preto', 20.00),
('FGH-2256', 'Deloriam', 'Azul', 80.00),
('DDI-3948', 'Brasília', 'Amarela', 45.00);

-- locacoes
insert into locacoes (codLocacao, cpf, placa, dias, total) values
(101, '123.456.789-01', 'WER-3456', 3, 90.00),
(102, '543.765.987-23', 'FDS-8384', 7, 420.00),
(103, '987.654.231-90', 'CVB-9933', 1, 20.00),
(104, '432.765.678-67', 'FGH-2256', 3, 240.00),
(105, '927.384.284-44', 'DDI-3948', 7, 315.00);

-- view que seleciona todas as locações e seus respectivos veículos e clientes.

create view total as
select 
    L.codLocacao,
    C.nome as cliente,
    C.cpf,
    C.nascimento,
    V.veiculo,
    V.cor,
    V.placa,
    V.diaria,
    L.dias,
    L.total
from 
    locacoes L
    inner join clientes C on L.cpf = C.cpf
    inner join veiculos V on L.placa = V.placa;
    
    
-- selecao
select * from total;

