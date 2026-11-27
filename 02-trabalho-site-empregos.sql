-- =====================================================
-- Atividade 02 - Trabalho: inserção e consulta de dados
-- Banco do aplicativo: site de empregos
-- Aluno: Renato Gabriel
-- =====================================================

create database if not exists site_empregos
default character set utf8mb4
collate utf8mb4_0900_ai_ci;

use site_empregos;

-- empresas que anunciam vagas
create table if not exists empresa (
  id int auto_increment primary key,
  razao_social varchar(100) not null,
  cnpj varchar(14),
  cidade varchar(50),
  email varchar(100)
) default charset = utf8mb4;

-- candidatos cadastrados
create table if not exists candidato (
  id int auto_increment primary key,
  nome varchar(100) not null,
  email varchar(100),
  telefone varchar(15),
  cidade varchar(50),
  data_nascimento date
) default charset = utf8mb4;

-- vagas (pertencem a uma empresa)
create table if not exists vaga (
  id int auto_increment primary key,
  titulo varchar(100) not null,
  salario decimal(10,2),
  modalidade enum('presencial','remoto','hibrido'),
  ativa boolean,
  id_empresa int,
  foreign key (id_empresa) references empresa(id)
) default charset = utf8mb4;

-- candidaturas (um candidato se candidata a uma vaga)
create table if not exists candidatura (
  id int auto_increment primary key,
  data_candidatura datetime,
  status_candidatura varchar(20),
  id_candidato int,
  id_vaga int,
  foreign key (id_candidato) references candidato(id),
  foreign key (id_vaga) references vaga(id)
) default charset = utf8mb4;

-- 1. INSERIR REGISTROS (ordem das chaves estrangeiras:
--    empresa e candidato primeiro, depois vaga, por último candidatura)

insert into empresa (razao_social, cnpj, cidade, email) values
('Coamo Agroindustrial', '11111111000101', 'campo mourão', 'rh@coamo.com'),
('Tech Paraná LTDA', '22222222000102', 'maringá', 'vagas@techpr.com'),
('Mercado Bom Preço', '33333333000103', 'campo mourão', 'contato@bompreco.com'),
('Construtora Alfa', '44444444000104', 'cascavel', 'rh@alfa.com'),
('Clínica Vida', '55555555000105', 'curitiba', 'rh@clinicavida.com'),
('Loja Digital Sul', '66666666000106', 'londrina', 'vagas@digitalsul.com');

insert into candidato (nome, email, telefone, cidade, data_nascimento) values
('Renato Gabriel', 'renato@email.com', '44999990001', 'campo mourão', '2008-05-14'),
('Ana Silva', 'ana.silva@email.com', '44999990002', 'maringá', '2000-03-21'),
('Bruno Souza', 'bruno.souza@email.com', '44999990003', 'campo mourão', '1998-07-30'),
('Carla Costa', 'carla.costa@email.com', '45999990004', 'cascavel', '2002-11-12'),
('Diego Martins', 'diego.martins@email.com', '41999990005', 'curitiba', '1995-01-05'),
('Eduarda Lima', 'eduarda.lima@email.com', '43999990006', 'londrina', '2001-09-18');

insert into vaga (titulo, salario, modalidade, ativa, id_empresa) values
('Auxiliar de Almoxarifado', 2200.00, 'presencial', true, 1),
('Desenvolvedor Júnior', 3500.00, 'remoto', true, 2),
('Operador de Caixa', 1800.00, 'presencial', true, 3),
('Técnico em Edificações', 3000.00, 'presencial', true, 4),
('Recepcionista', 1900.00, 'presencial', false, 5),
('Analista de Marketing Digital', 4000.00, 'hibrido', true, 6);

insert into candidatura (data_candidatura, status_candidatura, id_candidato, id_vaga) values
('2026-11-01 09:15:00', 'em análise', 1, 2),
('2026-11-02 10:30:00', 'aprovado', 2, 6),
('2026-11-03 14:00:00', 'em análise', 3, 1),
('2026-11-04 16:20:00', 'reprovado', 4, 4),
('2026-11-05 08:45:00', 'em análise', 5, 5),
('2026-11-06 11:10:00', 'aprovado', 6, 3);

-- 2. CONSULTAR TABELAS (validar se os dados foram gravados)
select * from empresa;
select * from candidato;
select * from vaga;
select * from candidatura;
