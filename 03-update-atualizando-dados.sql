-- =====================================================
-- Atividade 03 - UPDATE (atualizando dados)
-- Aluno: Renato Gabriel
-- =====================================================

create database if not exists update_aula
default character set utf8mb4
collate utf8mb4_0900_ai_ci;

use update_aula;

-- criação da tabela de produtos
create table if not exists produtos (
  id int auto_increment primary key,
  nome varchar(50),
  categoria varchar(30),
  preco decimal(10,2),
  estoque int
) default charset = utf8mb4;

-- inserção de dados em produtos
insert into produtos (nome, categoria, preco, estoque) values
('teclado gamer', 'periféricos', 150.00, 20),
('mouse óptico', 'periféricos', 50.00, 15),
('monitor 24"', 'monitores', 900.00, 8),
('cadeira gamer', 'móveis', 1200.00, 5),
('webcam hd', 'periféricos', 250.00, 12);

-- criação da nova tabela: clientes
create table if not exists clientes (
  id int auto_increment primary key,
  nome varchar(100),
  email varchar(100),
  cidade varchar(50)
) default charset = utf8mb4;

-- inserção de dados em clientes
insert into clientes (nome, email, cidade) values
('ana silva', 'ana.silva@email.com', 'são paulo'),
('bruno souza', 'bruno.souza@email.com', 'rio de janeiro'),
('carla costa', 'carla.costa@email.com', 'belo horizonte');

-- ===== códigos do vídeo =====

-- Ana Silva casou e mudou de nome
update clientes set nome = 'ana silva siqueira' where id = 1;
select * from clientes;

-- alterando duas colunas ao mesmo tempo: nome e cidade
update clientes set nome = 'ana silva siqueira', cidade = 'campo mourão' where id = 1;
select * from clientes;

-- ===== atividade =====

-- 1. o teclado gamer entrou em promoção: novo preço 129.90
update produtos set preco = 129.90 where id = 1;

-- 2. chegaram mais 10 mouses: estoque passa de 15 para 25
update produtos set estoque = 25 where id = 2;

-- 3. o monitor mudou de nome e de preço
update produtos set nome = 'monitor 24" full hd', preco = 850.00 where id = 3;

-- 4. a cadeira gamer mudou de categoria
update produtos set categoria = 'cadeiras' where id = 4;

-- 5. Bruno Souza trocou de e-mail
update clientes set email = 'bruno.souza@gmail.com' where id = 2;

-- 6. Carla Costa se mudou para Maringá
update clientes set cidade = 'maringá' where id = 3;

-- conferindo as tabelas atualizadas
select * from produtos;
select * from clientes;
