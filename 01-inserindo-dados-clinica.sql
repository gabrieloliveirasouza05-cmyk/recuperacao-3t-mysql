-- =====================================================
-- Atividade 01 - Inserindo dados (INSERT INTO)
-- Aluno: Renato Gabriel
-- =====================================================

create database if not exists clinica_renato
default character set utf8mb4
collate utf8mb4_0900_ai_ci;

use clinica_renato;

-- tabela paciente
create table if not exists paciente (
  id int auto_increment primary key,
  nome varchar(30) not null,
  data_nascimento date,
  altura decimal(3,2),
  status_cadastro boolean,
  genero enum('M','F','OUTRO')
) default charset = utf8mb4;

-- tabela medico
create table if not exists medico (
  id int auto_increment primary key,
  nome varchar(30)
) default charset = utf8mb4;

-- tabela consulta (depende de paciente e medico)
create table if not exists consulta (
  id int auto_increment primary key,
  data_time datetime,
  id_paciente int,
  id_medico int,
  foreign key (id_paciente) references paciente(id),
  foreign key (id_medico) references medico(id)
) default charset = utf8mb4;

-- exemplo da aula: 2 pacientes
insert into paciente (nome, data_nascimento, altura, status_cadastro, genero) values
('João Oliveira', '2000-03-30', 1.80, true, 'M'),
('Maria Helena', '2001-02-25', 1.58, true, 'F');

-- Atividade 01: mais 5 pacientes
insert into paciente (nome, data_nascimento, altura, status_cadastro, genero) values
('Renato Gabriel', '2008-05-14', 1.75, true, 'M'),
('Ana Souza', '1995-08-10', 1.65, true, 'F'),
('Pedro Lima', '1988-11-02', 1.82, true, 'M'),
('Carla Mendes', '1999-01-19', 1.70, true, 'F'),
('Lucas Ferreira', '2003-07-07', 1.68, true, 'M');

-- exemplo da aula: 2 médicos
insert into medico (nome) values
('Julia'),
('Zeca');

-- Atividade 02: mais 5 médicos
insert into medico (nome) values
('Dr. Roberto Alves'),
('Dra. Fernanda Costa'),
('Dr. Marcos Pereira'),
('Dra. Patrícia Rocha'),
('Dr. Gustavo Nunes');

-- exemplo da aula: 2 consultas
insert into consulta (data_time, id_paciente, id_medico) values
('2026-09-03 10:10:55', 2, 1),
('2026-09-05 12:00:00', 1, 1);

-- Atividade 03: mais 5 consultas
insert into consulta (data_time, id_paciente, id_medico) values
('2026-09-10 08:30:00', 3, 3),
('2026-09-11 09:00:00', 4, 4),
('2026-09-12 14:15:00', 5, 5),
('2026-09-15 16:45:00', 6, 6),
('2026-09-18 10:00:00', 7, 7);

-- consultar todos os dados das tabelas
select * from paciente;
select * from medico;
select * from consulta;

-- consulta com inner join: id e data da consulta, nome do paciente e do médico
select consulta.id, consulta.data_time, paciente.nome, medico.nome
from consulta
inner join paciente on consulta.id_paciente = paciente.id
inner join medico on consulta.id_medico = medico.id;
