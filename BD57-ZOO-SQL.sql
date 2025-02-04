drop table pessoas cascade constraints;
drop table funcionarios cascade constraints;
drop table visitantes cascade constraints;
drop table limpadores cascade constraints;
drop table vendedores  cascade constraints;
drop table tratadores  cascade constraints;
drop table animadores cascade constraints;
drop table vendedoresB  cascade constraints;
drop table vendedoresL  cascade constraints;
drop table lojas cascade constraints;
drop table animais cascade constraints;
drop table especies  cascade constraints;
drop table bilheteiras  cascade constraints;
drop table jaulas cascade constraints;
drop table espetaculos cascade constraints;
drop table bilhetes  cascade constraints;
drop table tiposBilhete  cascade constraints;
drop table limpamJ cascade constraints;
drop table vendemEm  cascade constraints;
drop table vendemB  cascade constraints;
drop table participam cascade constraints;
drop table tratam cascade constraints;
drop table recebem  cascade constraints;
drop table lucros  cascade constraints;
drop table compramB  cascade constraints;
drop sequence seqCodeA;
drop sequence seqBilhetes;
drop sequence seqBilheteiras;
drop sequence seqJaula;
drop sequence seqEspetaculos;

create table compramB (
    NIF number(11,0),
    numBilhete number(11,0)
);

create table lucros (
    nomeL VARCHAR(30),
    mes NUMBER(2,0),
    ano NUMBER(4,0),
    valor NUMBER
);

create table pessoas(
  NIF number(11,0),
  nome varchar(30)
);

create table funcionarios(
  NIF number (11,0),
  horario varchar(15),
  salario number(7,3),
  IBAN varchar(26)
);

create table visitantes(
  NIF number(11,0),
  dataNascimento varchar(15)
  );

create table limpadores(
   NIF number(11,0)
);

create table vendedores (
 NIF number(11,0)
);

create table tratadores (
 NIF number(11,0)
);

create table animadores (
  NIF number(11,0)
);

create table vendedoresB  (
 NIF number(11,0)
);

create table vendedoresL  (
  NIF number(11,0),
  nomeL varchar(30)
);
create table lojas  (
   nomeL varchar(30),
   nFuncionarios number(2,0),
   horarioA varchar(5),
   horarioT varchar(5)
);

create table animais  (
  codA number(15,0),
  dataNasc varchar(15),
  genero varchar(2),
  dieta varchar(500),
  nomeA varchar(30),
  nomeEspecie varchar(30),
  localizacao varchar(30)
);
create table especies  (
  nomeEspecie varchar(30)
);
create table bilheteiras  (
 numB number(2,0),
 abertura varchar(5),
 encerramento varchar(5)
);
create table jaulas  (
  localizacao varchar(30),
  minimoAgua number(3,2),
  minimoComida number(3,2)
);
create table espetaculos  (
  idEspetaculo number(11,0),
  horas varchar(7),
  tema varchar(300),
  limitePessoas number(5,0)
);
create table bilhetes  (
numBilhete number(11,0),
dataCompra varchar(30),
tipoB varchar(30),
numB number(2,0)
);
CREATE TABLE tiposBilhete (
    tipoB VARCHAR(300),
    precoB NUMBER(10,2)
);
create table limpamJ  (
  localizacao varchar(30),
  NIF number(11,0), 
  diaLimpeza varchar(30)
);

create table vendemEm  (
  NIF number(9,0),
  numB number(2,0)
);

create table participam  (
 NIF number(9,0),
 codA VARCHAR(9), 
 idEspetaculo number(9,0)
);
create table tratam  (
 codA VARCHAR(9), 
 NIF number(9,0)
);
create table recebem  (
  NIF number(9,0),
  nomeL varchar(30)
);

-- Chaves primárias
ALTER TABLE pessoas ADD CONSTRAINT PK_Pessoas PRIMARY KEY (NIF);
ALTER TABLE funcionarios ADD CONSTRAINT PK_Funcionarios PRIMARY KEY (NIF);
ALTER TABLE visitantes ADD CONSTRAINT PK_Visitantes PRIMARY KEY (NIF);
ALTER TABLE limpadores ADD CONSTRAINT PK_Limpadores PRIMARY KEY (NIF);
ALTER TABLE vendedores ADD CONSTRAINT PK_Vendedores PRIMARY KEY (NIF);
ALTER TABLE tratadores ADD CONSTRAINT PK_Tratadores PRIMARY KEY (NIF);
ALTER TABLE animadores ADD CONSTRAINT PK_Animadores PRIMARY KEY (NIF);
ALTER TABLE vendedoresB ADD CONSTRAINT PK_VendedoresB PRIMARY KEY (NIF);
ALTER TABLE vendedoresL ADD CONSTRAINT PK_VendedoresL PRIMARY KEY (NIF);
ALTER TABLE lojas ADD CONSTRAINT PK_Lojas PRIMARY KEY (nomeL);
ALTER TABLE animais ADD CONSTRAINT PK_Animais PRIMARY KEY (codA);
ALTER TABLE especies ADD CONSTRAINT PK_Especies PRIMARY KEY (nomeEspecie);
ALTER TABLE bilheteiras ADD CONSTRAINT PK_Bilheteiras PRIMARY KEY (numB); 
ALTER TABLE jaulas ADD CONSTRAINT PK_Jaulas PRIMARY KEY (localizacao);
ALTER TABLE espetaculos ADD CONSTRAINT PK_Espetaculos PRIMARY KEY (idEspetaculo);
ALTER TABLE bilhetes ADD CONSTRAINT PK_Bilhetes PRIMARY KEY (numBilhete);
ALTER TABLE tiposBilhete ADD CONSTRAINT PK_TiposBilhete PRIMARY KEY (tipoB);
ALTER TABLE limpamJ ADD CONSTRAINT PK_LimpamJ PRIMARY KEY (localizacao, NIF);
ALTER TABLE vendemEm ADD CONSTRAINT PK_VendemEm PRIMARY KEY (NIF, numB);
ALTER TABLE participam ADD CONSTRAINT PK_Participam PRIMARY KEY (NIF, codA, idEspetaculo); 
ALTER TABLE tratam ADD CONSTRAINT PK_Tratam PRIMARY KEY (codA, NIF);
ALTER TABLE recebem ADD CONSTRAINT PK_Recebem PRIMARY KEY (NIF, nomeL);


-- Chaves candidatas e estrangeiras
ALTER TABLE lucros ADD CONSTRAINT FK_Lucros_Lojas FOREIGN KEY (nomeL) REFERENCES lojas(nomeL);
ALTER TABLE funcionarios ADD CONSTRAINT FK_Funcionarios_Pessoas FOREIGN KEY (NIF) REFERENCES pessoas(NIF);
ALTER TABLE visitantes ADD CONSTRAINT FK_Visitantes_Pessoas FOREIGN KEY (NIF) REFERENCES pessoas(NIF);
ALTER TABLE limpadores ADD CONSTRAINT FK_Limpadores_Funcionarios FOREIGN KEY (NIF) REFERENCES funcionarios(NIF);
ALTER TABLE vendedores ADD CONSTRAINT FK_Vendedores_Funcionarios FOREIGN KEY (NIF) REFERENCES funcionarios(NIF);
ALTER TABLE tratadores ADD CONSTRAINT FK_Tratadores_Funcionarios FOREIGN KEY (NIF) REFERENCES funcionarios(NIF);
ALTER TABLE animadores ADD CONSTRAINT FK_Animadores_Funcionarios FOREIGN KEY (NIF) REFERENCES funcionarios(NIF);
ALTER TABLE vendedoresB ADD CONSTRAINT FK_VendedoresB_Vendedores FOREIGN KEY (NIF) REFERENCES vendedores(NIF);
ALTER TABLE vendedoresL ADD CONSTRAINT FK_VendedoresL_Vendedores FOREIGN KEY (NIF) REFERENCES vendedores(NIF);
ALTER TABLE vendedoresL ADD CONSTRAINT FK_VendedoresL_Lojas FOREIGN KEY (nomeL) REFERENCES lojas(nomeL);
ALTER TABLE animais ADD CONSTRAINT FK_Animais_Especies FOREIGN KEY (nomeEspecie) REFERENCES especies(nomeEspecie);
ALTER TABLE animais ADD CONSTRAINT FK_Animais_Jaulas FOREIGN KEY (localizacao) REFERENCES jaulas(localizacao);
ALTER TABLE bilhetes ADD CONSTRAINT FK_Bilhetes_TiposBilhete FOREIGN KEY (tipoB) REFERENCES tiposBilhete(tipoB);
ALTER TABLE bilhetes ADD CONSTRAINT FK_Bilhetes_Bilheteira FOREIGN KEY (numB) REFERENCES bilheteiras(numB);
ALTER TABLE limpamJ ADD CONSTRAINT FK_LimpamJ_Limpadores FOREIGN KEY (NIF) REFERENCES limpadores(NIF);
ALTER TABLE limpamJ ADD CONSTRAINT FK_LimpamJ_Jaulas FOREIGN KEY (localizacao) REFERENCES jaulas(localizacao);
ALTER TABLE vendemEm ADD CONSTRAINT FK_VendemEm_VendedoresB FOREIGN KEY (NIF) REFERENCES vendedoresB(NIF);
ALTER TABLE vendemEm ADD CONSTRAINT FK_VendemEm_Bilheteiras FOREIGN KEY (num_B) REFERENCES bilheteiras(num_B);
ALTER TABLE participam ADD CONSTRAINT FK_Participam_Animadores FOREIGN KEY (NIF) REFERENCES animadores(NIF);
ALTER TABLE participam ADD CONSTRAINT FK_Participam_Animais FOREIGN KEY (codA) REFERENCES animais(codA);
ALTER TABLE participam ADD CONSTRAINT FK_Participam_Espetaculos FOREIGN KEY (idEspetaculo) REFERENCES espetaculos(idEspetaculo);
ALTER TABLE tratam ADD CONSTRAINT FK_Tratam_Animais FOREIGN KEY (codA) REFERENCES animais(codA);
ALTER TABLE tratam ADD CONSTRAINT FK_Tratam_Tratadores FOREIGN KEY (NIF) REFERENCES tratadores(NIF);
ALTER TABLE recebem ADD CONSTRAINT FK_Recebem_Lojas FOREIGN KEY (nomeL) REFERENCES lojas(nomeL);
ALTER TABLE recebem ADD CONSTRAINT FK_Recebem_Lojas FOREIGN KEY (NIF) REFERENCES lojas(NIF);
ALTER TABLE compramB ADD CONSTRAINT FK_CompramB_NIF FOREIGN KEY (NIF) REFERENCES visitantes(NIF);
ALTER TABLE compramB ADD CONSTRAINT FK_CompramB_numBilhete FOREIGN KEY (numBilhete) REFERENCES bilhetes(numBilhete);

ALTER TABLE funcionarios ADD CONSTRAINT CK_Funcionários_NIF UNIQUE (NIF);
ALTER TABLE visitantes ADD CONSTRAINT CK_Visitantes_NIF UNIQUE (NIF);
ALTER TABLE limpadores ADD CONSTRAINT CK_Limpadores_NIF UNIQUE (NIF);
ALTER TABLE vendedores ADD CONSTRAINT CK_Vendedores_NIF UNIQUE (NIF);
ALTER TABLE tratadores ADD CONSTRAINT CK_Tratadores_NIF UNIQUE (NIF);
ALTER TABLE animadores ADD CONSTRAINT CK_Animadores_NIF UNIQUE (NIF);
ALTER TABLE vendedoresB ADD CONSTRAINT CK_VendedoresB_NIF UNIQUE (NIF);
ALTER TABLE vendedoresL ADD CONSTRAINT CK_VendedoresL_NIF UNIQUE (NIF);
ALTER TABLE vendedoresL ADD CONSTRAINT CK_VendedoresL_nomeL UNIQUE (nomeL);
ALTER TABLE lojas ADD CONSTRAINT CK_Lojas_nomeL UNIQUE (nomeL);
ALTER TABLE especies ADD CONSTRAINT CK_Espécies_nomeEspécie UNIQUE (nomeEspecie);
ALTER TABLE bilheteiras ADD CONSTRAINT CK_Bilheteiras_numB UNIQUE (num_B);
ALTER TABLE jaulas ADD CONSTRAINT CK_Jaulas_localizacao UNIQUE (localizacao);
ALTER TABLE espetaculos ADD CONSTRAINT CK_Espetaculos_idEspetaculo UNIQUE (idEspetaculo);
ALTER TABLE bilhetes ADD CONSTRAINT CK_Bilhetes_numBilhete UNIQUE (numBilhete);
ALTER TABLE tiposBilhete ADD CONSTRAINT CK_TiposBilhete_tipoB UNIQUE (tipoB);
ALTER TABLE limpamJ ADD CONSTRAINT CK_LimpamJ UNIQUE (localizacao, NIF);
ALTER TABLE vendemEm ADD CONSTRAINT CK_VendemEm UNIQUE (NIF, num_B);
ALTER TABLE participam ADD CONSTRAINT CK_Participam UNIQUE (NIF, codA, idEspetaculo);
ALTER TABLE tratam ADD CONSTRAINT CK_Tratam UNIQUE (codA, NIF);
ALTER TABLE recebem ADD CONSTRAINT CK_Recebem UNIQUE (NIF, nomeL);

GRANT ALL PRIVILEGES ON ZOO

--quando inserimos um animal se a especie nao existir entao adicionamos a especia na tabela especies
CREATE OR REPLACE TRIGGER add_new_especie
ON animais
AFTER INSERT
AS
BEGIN
 SET NOCOUNT ON;
    INSERT INTO especies(
    nomeEspecie
    )
END;

--Apenas pessoas já registradas na tabela pessoas podem ser inseridas nas tabelas funcionarios ou visitantes
create or replace trigger check_if_person
before insert on funcionarios, visitantes
for each row
declare Exists number
begin
    select count(*) into Existe
    from pessoas where NIF = :new.NIF
    if Existe = 0
        then RAISE_APPLICATION_ERROR(-20100, ‘Pessoa não está na base de dados’)
END IF;
End;
/

--Se tentarmos adicionar um visitante ou funcionário que não esteja registado como pessoa então não é adicionado
CREATE OR REPLACE TRIGGER check_if_person_visitante
BEFORE INSERT ON visitants
FOR EACH ROW
DECLARE
    Exists NUMBER;
BEGIN
    SELECT COUNT(*) INTO Exists
    FROM pessoas
    WHERE NIF = :NEW.NIF;

    IF Exists = 0 THEN
        RAISE_APPLICATION_ERROR(-20100, 'Pessoa não está na base de dados');
    END IF;
END;
/

--Esta parte e para meter as restricoes
alter table pessoas add constraint NIF CHECK (LENGTH(TO_CHAR(NIF)) = 9);
alter table funcionarios add constraint NIF CHECK (LENGTH(TO_CHAR(NIF)) = 9);
alter table visitantes add constraint NIF CHECK (LENGTH(TO_CHAR(NIF)) = 9);

--Inserir os dados na tabela pessoas
delete from pessoas;

INSERT INTO pessoas (NIF, nome) VALUES (473892741, 'João Silva');
INSERT INTO pessoas (NIF, nome) VALUES (392846273, 'Maria Oliveira');
INSERT INTO pessoas (NIF, nome) VALUES (817263945, 'Ana Sousa');
INSERT INTO pessoas (NIF, nome) VALUES (126349587, 'Carlos Pereira');
INSERT INTO pessoas (NIF, nome) VALUES (647382951, 'José Fernandes');
INSERT INTO pessoas (NIF, nome) VALUES (529847613, 'Rui Costa');
INSERT INTO pessoas (NIF, nome) VALUES (783912465, 'Paula Martins');
INSERT INTO pessoas (NIF, nome) VALUES (364958172, 'Miguel Ferreira');
INSERT INTO pessoas (NIF, nome) VALUES (294837615, 'Sandra Gomes');
INSERT INTO pessoas (NIF, nome) VALUES (915837264, 'João Pinto');
INSERT INTO pessoas (NIF, nome) VALUES (825394671, 'Helena Carvalho');
INSERT INTO pessoas (NIF, nome) VALUES (134958762, 'Ricardo Rocha');
INSERT INTO pessoas (NIF, nome) VALUES (912384765, 'Sofia Lopes');
INSERT INTO pessoas (NIF, nome) VALUES (372891546, 'Pedro Santos');
INSERT INTO pessoas (NIF, nome) VALUES (849376512, 'Mariana Rodrigues');
INSERT INTO pessoas (NIF, nome) VALUES (581239746, 'Vítor Almeida');
INSERT INTO pessoas (NIF, nome) VALUES (648291735, 'Isabel Ribeiro');
INSERT INTO pessoas (NIF, nome) VALUES (273846195, 'André Costa');
INSERT INTO pessoas (NIF, nome) VALUES (594837261, 'Cátia Monteiro');
INSERT INTO pessoas (NIF, nome) VALUES (729384651, 'Luís Cardoso');
INSERT INTO pessoas (NIF, nome) VALUES (182736495, 'Cristina Marques');
INSERT INTO pessoas (NIF, nome) VALUES (534829671, 'Fernando Moreira');
INSERT INTO pessoas (NIF, nome) VALUES (982364751, 'Patrícia Antunes');
INSERT INTO pessoas (NIF, nome) VALUES (621394758, 'Bruno Silva');
INSERT INTO pessoas (NIF, nome) VALUES (847362195, 'Vanessa Sousa');
INSERT INTO pessoas (NIF, nome) VALUES (321948576, 'Rafael Nunes');
INSERT INTO pessoas (NIF, nome) VALUES (947283165, 'Teresa Fernandes');
INSERT INTO pessoas (NIF, nome) VALUES (675194382, 'Fábio Teixeira');
INSERT INTO pessoas (NIF, nome) VALUES (238947615, 'Liliana Costa');
INSERT INTO pessoas (NIF, nome) VALUES (184739265, 'Joana Almeida');
INSERT INTO pessoas (NIF, nome) VALUES (491827356, 'Sérgio Ribeiro');
INSERT INTO pessoas (NIF, nome) VALUES (756284931, 'Beatriz Vieira');
INSERT INTO pessoas (NIF, nome) VALUES (375294681, 'Eduardo Correia');
INSERT INTO pessoas (NIF, nome) VALUES (612394875, 'Susana Mendes');
INSERT INTO pessoas (NIF, nome) VALUES (859237416, 'Gonçalo Dias');
INSERT INTO pessoas (NIF, nome) VALUES (739485261, 'Marta Mota');
INSERT INTO pessoas (NIF, nome) VALUES (296183745, 'Nuno Carvalho');
INSERT INTO pessoas (NIF, nome) VALUES (614839725, 'Inês Matos');
INSERT INTO pessoas (NIF, nome) VALUES (348291657, 'Leandro Sousa');
INSERT INTO pessoas (NIF, nome) VALUES (895172346, 'Diana Pereira');
INSERT INTO pessoas (NIF, nome) VALUES (231984765, 'Alexandre Martins');
INSERT INTO pessoas (NIF, nome) VALUES (857319462, 'Filipa Rodrigues');
INSERT INTO pessoas (NIF, nome) VALUES (291847536, 'Raquel Ferreira');
INSERT INTO pessoas (NIF, nome) VALUES (438192675, 'Artur Gomes');
INSERT INTO pessoas (NIF, nome) VALUES (926384157, 'Camila Dias');
INSERT INTO pessoas (NIF, nome) VALUES (158473926, 'Diogo Pinto');
INSERT INTO pessoas (NIF, nome) VALUES (571839264, 'Margarida Teixeira');
INSERT INTO pessoas (NIF, nome) VALUES (619384725, 'Henrique Silva');
INSERT INTO pessoas (NIF, nome) VALUES (384716295, 'Manuela Moreira');
INSERT INTO pessoas (NIF, nome) VALUES (285394761, 'Bernardo Ferreira');
INSERT INTO pessoas (NIF, nome) VALUES (817263945, 'Rita Santos');
INSERT INTO pessoas (NIF, nome) VALUES (671928354, 'Alexandra Costa');
INSERT INTO pessoas (NIF, nome) VALUES (823619475, 'Rodrigo Pereira');
INSERT INTO pessoas (NIF, nome) VALUES (597283164, 'Vera Rodrigues');
INSERT INTO pessoas (NIF, nome) VALUES (918234756, 'Mateus Fernandes');
INSERT INTO pessoas (NIF, nome) VALUES (482739615, 'Gabriela Gomes');
INSERT INTO pessoas (NIF, nome) VALUES (375294861, 'Tomás Carvalho');
INSERT INTO pessoas (NIF, nome) VALUES (917263845, 'Daniela Sousa');
INSERT INTO pessoas (NIF, nome) VALUES (138495672, 'Juliana Rocha');
INSERT INTO pessoas (NIF, nome) VALUES (749382165, 'Filipe Costa');
INSERT INTO pessoas (NIF, nome) VALUES (682394751, 'Helder Silva');
INSERT INTO pessoas (NIF, nome) VALUES (294857316, 'Leonor Moreira');
INSERT INTO pessoas (NIF, nome) VALUES (573829416, 'Tânia Almeida');
INSERT INTO pessoas (NIF, nome) VALUES (648291357, 'Samuel Ribeiro');
INSERT INTO pessoas (NIF, nome) VALUES (938217465, 'Cláudia Teixeira');
INSERT INTO pessoas (NIF, nome) VALUES (276384951, 'Marcos Santos');
INSERT INTO pessoas (NIF, nome) VALUES (851273946, 'Sónia Costa');
INSERT INTO pessoas (NIF, nome) VALUES (237948561, 'António Rodrigues');
INSERT INTO pessoas (NIF, nome) VALUES (794582361, 'Sara Carvalho');
INSERT INTO pessoas (NIF, nome) VALUES (523891476, 'Francisco Pereira');
INSERT INTO pessoas (NIF, nome) VALUES (918234765, 'Tatiana Gomes');
INSERT INTO pessoas (NIF, nome) VALUES (274936851, 'Rogério Fernandes');
INSERT INTO pessoas (NIF, nome) VALUES (837294651, 'Joana Sousa');
INSERT INTO pessoas (NIF, nome) VALUES (648291357, 'Luís Silva');
INSERT INTO pessoas (NIF, nome) VALUES (912374658, 'Carolina Costa');
INSERT INTO pessoas (NIF, nome) VALUES (736284915, 'Paulo Rodrigues');
INSERT INTO pessoas (NIF, nome) VALUES (291847536, 'Cecília Almeida');
INSERT INTO pessoas (NIF, nome) VALUES (193847625, 'David Teixeira');
INSERT INTO pessoas (NIF, nome) VALUES (918374652, 'Mara Moreira');
INSERT INTO pessoas (NIF, nome) VALUES (527138946, 'Augusto Ferreira');
INSERT INTO pessoas (NIF, nome) VALUES (639184725, 'Sílvia Pereira');
INSERT INTO pessoas (NIF, nome) VALUES (482793615, 'Jorge Rodrigues');
INSERT INTO pessoas (NIF, nome) VALUES (917264835, 'Tatiana Silva');
INSERT INTO pessoas (NIF, nome) VALUES (674391825, 'Ricardo Costa');
INSERT INTO pessoas (NIF, nome) VALUES (583491726, 'Lúcia Carvalho');
INSERT INTO pessoas (NIF, nome) VALUES (759382146, 'Márcio Fernandes');
INSERT INTO pessoas (NIF, nome) VALUES (923874561, 'Renata Gomes');
INSERT INTO pessoas (NIF, nome) VALUES (193847265, 'Aline Teixeira');
INSERT INTO pessoas (NIF, nome) VALUES (918374562, 'Miguel Silva');
INSERT INTO pessoas (NIF, nome) VALUES (837294651, 'Inês Moreira');
INSERT INTO pessoas (NIF, nome) VALUES (927183465, 'Ana Almeida');
INSERT INTO pessoas (NIF, nome) VALUES (648291735, 'Pedro Carvalho');
INSERT INTO pessoas (NIF, nome) VALUES (827193465, 'Francisca Sousa');
INSERT INTO pessoas (NIF, nome) VALUES (291837465, 'Rui Rodrigues');
INSERT INTO pessoas (NIF, nome) VALUES (573829416, 'Elisa Ferreira');
INSERT INTO pessoas (NIF, nome) VALUES (481726395, 'Fábio Pereira');
INSERT INTO pessoas (NIF, nome) VALUES (584927163, 'Tânia Costa');
INSERT INTO pessoas (NIF, nome) VALUES (748291635, 'Lourenço Almeida');
INSERT INTO pessoas (NIF, nome) VALUES (923847156, 'Beatriz Carvalho');


--Preencher tabela funcionários
delete from funcionarios;

INSERT INTO funcionarios (NIF, horario, salario, IBAN) VALUES (473892741, '08:00-16:00', 1500.50, 'PT50000201234567890123456');
INSERT INTO funcionarios (NIF, horario, salario, IBAN) VALUES (392846273, '09:00-17:00', 1800.75, 'PT50000209876543210987654');
INSERT INTO funcionarios (NIF, horario, salario, IBAN) VALUES (817263945, '10:00-18:00', 1750.25, 'PT50000201239876543210987');
INSERT INTO funcionarios (NIF, horario, salario, IBAN) VALUES (126349587, '08:30-16:30', 1600.00, 'PT50000207654321098765432');
INSERT INTO funcionarios (NIF, horario, salario, IBAN) VALUES (647382951, '11:00-19:00', 1400.90, 'PT50000201230987654321098');
INSERT INTO funcionarios (NIF, horario, salario, IBAN) VALUES (529847613, '09:30-17:30', 1650.60, 'PT50000205432109876543210');
INSERT INTO funcionarios (NIF, horario, salario, IBAN) VALUES (783912465, '12:00-20:00', 1550.30, 'PT50000201234567890987654');
INSERT INTO funcionarios (NIF, horario, salario, IBAN) VALUES (364958172, '13:00-21:00', 1450.75, 'PT50000207654321091234567');
INSERT INTO funcionarios (NIF, horario, salario, IBAN) VALUES (294837615, '14:00-22:00', 1700.80, 'PT50000201239876543210987');
INSERT INTO funcionarios (NIF, horario, salario, IBAN) VALUES (915837264, '15:00-23:00', 1300.00, 'PT50000201239876543211234');
INSERT INTO funcionarios (NIF, horario, salario, IBAN) VALUES (825394671, '16:00-00:00', 1800.90, 'PT50000206543210987654321');
INSERT INTO funcionarios (NIF, horario, salario, IBAN) VALUES (134958762, '17:00-01:00', 1750.40, 'PT50000201234567893456789');
INSERT INTO funcionarios (NIF, horario, salario, IBAN) VALUES (912384765, '18:00-02:00', 1600.70, 'PT50000207654321091239876');
INSERT INTO funcionarios (NIF, horario, salario, IBAN) VALUES (372891546, '19:00-03:00', 1500.20, 'PT50000201234567890987654');
INSERT INTO funcionarios (NIF, horario, salario, IBAN) VALUES (849376512, '20:00-04:00', 1700.90, 'PT50000201239876543210987');
INSERT INTO funcionarios (NIF, horario, salario, IBAN) VALUES (581239746, '21:00-05:00', 1650.30, 'PT50000201234567890123456');
INSERT INTO funcionarios (NIF, horario, salario, IBAN) VALUES (648291735, '22:00-06:00', 1400.50, 'PT50000207654321098765432');
INSERT INTO funcionarios (NIF, horario, salario, IBAN) VALUES (273846195, '23:00-07:00', 1500.60, 'PT50000201234567891234567');
INSERT INTO funcionarios (NIF, horario, salario, IBAN) VALUES (594837261, '07:00-15:00', 1800.75, 'PT50000201234567890987654');
INSERT INTO funcionarios (NIF, horario, salario, IBAN) VALUES (729384651, '06:00-14:00', 1750.20, 'PT50000201239876543210987');


--Preencher tabela visitantes
delete from visitantes;

INSERT INTO visitantes (NIF, dataNascimento) VALUES (473892741, '1993.11.21');
INSERT INTO visitantes (NIF, dataNascimento) VALUES (392846273, '1993.11.21');
INSERT INTO visitantes (NIF, dataNascimento) VALUES (817263945, '1975.06.30');
INSERT INTO visitantes (NIF, dataNascimento) VALUES (126349587, '1980.08.09');
INSERT INTO visitantes (NIF, dataNascimento) VALUES (647382951, '1991.03.14');
INSERT INTO visitantes (NIF, dataNascimento) VALUES (529847613, '1985.07.22');
INSERT INTO visitantes (NIF, dataNascimento) VALUES (783912465, '1992.02.10');
INSERT INTO visitantes (NIF, dataNascimento) VALUES (364958172, '1988.05.18');
INSERT INTO visitantes (NIF, dataNascimento) VALUES (294837615, '1976.10.27');
INSERT INTO visitantes (NIF, dataNascimento) VALUES (915837264, '1983.12.05');
INSERT INTO visitantes (NIF, dataNascimento) VALUES (825394671, '1990.01.30');
INSERT INTO visitantes (NIF, dataNascimento) VALUES (134958762, '1982.09.25');
INSERT INTO visitantes (NIF, dataNascimento) VALUES (912384765, '1995.06.13');
INSERT INTO visitantes (NIF, dataNascimento) VALUES (372891546, '1979.04.28');
INSERT INTO visitantes (NIF, dataNascimento) VALUES (849376512, '1986.11.16');
INSERT INTO visitantes (NIF, dataNascimento) VALUES (581239746, '1994.07.08');
INSERT INTO visitantes (NIF, dataNascimento) VALUES (648291735, '1989.03.22');
INSERT INTO visitantes (NIF, dataNascimento) VALUES (273846195, '1977.10.14');
INSERT INTO visitantes (NIF, dataNascimento) VALUES (594837261, '1992.05.05');
INSERT INTO visitantes (NIF, dataNascimento) VALUES (729384651, '1983.09.17');
INSERT INTO visitantes (NIF, dataNascimento) VALUES (182736495, '1984.11.23');
INSERT INTO visitantes (NIF, dataNascimento) VALUES (534829671, '1991.12.12');
INSERT INTO visitantes (NIF, dataNascimento) VALUES (982364751, '1978.06.03');
INSERT INTO visitantes (NIF, dataNascimento) VALUES (621394758, '1985.08.19');
INSERT INTO visitantes (NIF, dataNascimento) VALUES (847362195, '1990.02.27');
INSERT INTO visitantes (NIF, dataNascimento) VALUES (321948576, '1979.05.09');
INSERT INTO visitantes (NIF, dataNascimento) VALUES (947283165, '1986.07.21');
INSERT INTO visitantes (NIF, dataNascimento) VALUES (675194382, '1994.01.11');
INSERT INTO visitantes (NIF, dataNascimento) VALUES (238947615, '1987.03.24');
INSERT INTO visitantes (NIF, dataNascimento) VALUES (184739265, '1992.11.13');
INSERT INTO visitantes (NIF, dataNascimento) VALUES (491827356, '1978.08.26');
INSERT INTO visitantes (NIF, dataNascimento) VALUES (756284931, '1985.04.30');
INSERT INTO visitantes (NIF, dataNascimento) VALUES (375294681, '1991.07.10');
INSERT INTO visitantes (NIF, dataNascimento) VALUES (612394875, '1982.12.01');
INSERT INTO visitantes (NIF, dataNascimento) VALUES (859237416, '1977.09.05');
INSERT INTO visitantes (NIF, dataNascimento) VALUES (739485261, '1990.10.22');
INSERT INTO visitantes (NIF, dataNascimento) VALUES (296183745, '1983.06.17');
INSERT INTO visitantes (NIF, dataNascimento) VALUES (614839725, '1976.11.30');
INSERT INTO visitantes (NIF, dataNascimento) VALUES (348291657, '1987.08.05');
INSERT INTO visitantes (NIF, dataNascimento) VALUES (895172346, '1993.05.19');
INSERT INTO visitantes (NIF, dataNascimento) VALUES (231984765, '1979.03.28');
INSERT INTO visitantes (NIF, dataNascimento) VALUES (857319462, '1984.07.09');
INSERT INTO visitantes (NIF, dataNascimento) VALUES (291847536, '1995.01.23');
INSERT INTO visitantes (NIF, dataNascimento) VALUES (438192675, '1988.06.15');
INSERT INTO visitantes (NIF, dataNascimento) VALUES (926384157, '1991.09.04');
INSERT INTO visitantes (NIF, dataNascimento) VALUES (158473926, '1977.12.12');
INSERT INTO visitantes (NIF, dataNascimento) VALUES (571839264, '1983.02.18');
INSERT INTO visitantes (NIF, dataNascimento) VALUES (619384725, '1990.04.27');
INSERT INTO visitantes (NIF, dataNascimento) VALUES (384716295, '1989.11.30');
INSERT INTO visitantes (NIF, dataNascimento) VALUES (285394761, '1992.03.08');
INSERT INTO visitantes (NIF, dataNascimento) VALUES (817263945, '1994.06.23');
INSERT INTO visitantes (NIF, dataNascimento) VALUES (671928354, '1976.09.10');
INSERT INTO visitantes (NIF, dataNascimento) VALUES (823619475, '1980.07.04');
INSERT INTO visitantes (NIF, dataNascimento) VALUES (597283164, '1993.12.17');
INSERT INTO visitantes (NIF, dataNascimento) VALUES (918234756, '1988.05.27');
INSERT INTO visitantes (NIF, dataNascimento) VALUES (482739615, '1991.10.14');
INSERT INTO visitantes (NIF, dataNascimento) VALUES (375294861, '1985.03.26');

GRANT SELECT ON seqCodeA TO animais;

--Sequence para o codigo dos animais
CREATE SEQUENCE seqCodeA
start with 1
increment by 1;

--garante que, ao inserir um novo animal na tabela animais, a espécie do animal também será inserida na tabela especies, caso ainda não esteja presente. 
CREATE OR REPLACE TRIGGER insert_species_trigger
BEFORE INSERT ON animais
FOR EACH ROW
DECLARE
    v_species_count NUMBER;
BEGIN
    SELECT COUNT(*)
    INTO v_species_count
    FROM especies
    WHERE nomeEspecie = :NEW.nomeEspecie;

    IF v_species_count = 0 THEN
        INSERT INTO especies (nomeEspecie)
        VALUES (:NEW.nomeEspecie);
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        NULL;
END;
/

-- Conceder permissão de SELECT 
GRANT SELECT ON seqJaula TO jaulas;

--Sequence para o codigo da jaula
CREATE SEQUENCE seqJaula
start with 1
increment by 1;

-- Inserir dados na tabela jaulas
delete from jaulas;

INSERT INTO jaulas (localizacao, minimoAgua, minimoComida) VALUES (CONCAT('Jaula: ',seqJaula.nextval), 3.2, 5.1);
INSERT INTO jaulas (localizacao, minimoAgua, minimoComida) VALUES (CONCAT('Jaula: ', seqJaula.nextval), 3.4, 5.3);
INSERT INTO jaulas (localizacao, minimoAgua, minimoComida) VALUES (CONCAT('Jaula: ', seqJaula.nextval), 3.1, 5.0);
INSERT INTO jaulas (localizacao, minimoAgua, minimoComida) VALUES (CONCAT('Jaula: ', seqJaula.nextval), 3.5, 5.2);
INSERT INTO jaulas (localizacao, minimoAgua, minimoComida) VALUES (CONCAT('Jaula: ', seqJaula.nextval), 3.3, 5.4);
INSERT INTO jaulas (localizacao, minimoAgua, minimoComida) VALUES (CONCAT('Jaula: ', seqJaula.nextval), 3.0, 5.1);
INSERT INTO jaulas (localizacao, minimoAgua, minimoComida) VALUES (CONCAT('Jaula: ', seqJaula.nextval), 3.6, 5.0);
INSERT INTO jaulas (localizacao, minimoAgua, minimoComida) VALUES (CONCAT('Jaula: ', seqJaula.nextval), 3.2, 5.2);
INSERT INTO jaulas (localizacao, minimoAgua, minimoComida) VALUES (CONCAT('Jaula: ', seqJaula.nextval), 3.4, 5.5);
INSERT INTO jaulas (localizacao, minimoAgua, minimoComida) VALUES (CONCAT('Jaula: ', seqJaula.nextval), 3.3, 5.1);
INSERT INTO jaulas (localizacao, minimoAgua, minimoComida) VALUES (CONCAT('Jaula: ', seqJaula.nextval), 3.1, 5.4);
INSERT INTO jaulas (localizacao, minimoAgua, minimoComida) VALUES (CONCAT('Jaula: ', seqJaula.nextval), 3.2, 5.0);
INSERT INTO jaulas (localizacao, minimoAgua, minimoComida) VALUES (CONCAT('Jaula: ', seqJaula.nextval), 3.5, 5.3);
INSERT INTO jaulas (localizacao, minimoAgua, minimoComida) VALUES (CONCAT('Jaula: ', seqJaula.nextval), 3.0, 5.5);
INSERT INTO jaulas (localizacao, minimoAgua, minimoComida) VALUES (CONCAT('Jaula: ', seqJaula.nextval), 3.6, 5.1);
INSERT INTO jaulas (localizacao, minimoAgua, minimoComida) VALUES (CONCAT('Jaula: ', seqJaula.nextval), 3.3, 5.2);
INSERT INTO jaulas (localizacao, minimoAgua, minimoComida) VALUES (CONCAT('Jaula: ', seqJaula.nextval), 3.1, 5.3);
INSERT INTO jaulas (localizacao, minimoAgua, minimoComida) VALUES (CONCAT('Jaula: ', seqJaula.nextval), 3.4, 5.0);

--Apagar tabela especies
delete from especies;



--Preencher tabela animais
delete from animais;

INSERT INTO animais (codA, dataNasc, genero, dieta, nomeA, nomeEspecie, localizacao) VALUES (seqCodeA.NEXTVAL, '1993.11.21', 'M', 'Bambu', 'Mario', 'Panda-Gigante', 'Jaula: 4');
INSERT INTO animais (codA, dataNasc, genero, dieta, nomeA, nomeEspecie, localizacao) VALUES (seqCodeA.nextval, '2015.02.10', 'M', 'Carne', 'Luna', 'Leão', 'Jaula: 7');
INSERT INTO animais (codA, dataNasc, genero, dieta, nomeA, nomeEspecie, localizacao) VALUES (seqCodeA.nextval, '2010.06.25', 'M', 'Folhas', 'Benny', 'Elefante-Africano', 'Jaula: 2');
INSERT INTO animais (codA, dataNasc, genero, dieta, nomeA, nomeEspecie, localizacao) VALUES (seqCodeA.nextval, '2018.08.30', 'F', 'Peixes', 'Daisy', 'Pinguim', 'Jaula: 10');
INSERT INTO animais (codA, dataNasc, genero, dieta, nomeA, nomeEspecie, localizacao) VALUES (seqCodeA.nextval, '2012.12.15', 'M', 'Insectos', 'Spike', 'Armadillo', 'Jaula: 8');
INSERT INTO animais (codA, dataNasc, genero, dieta, nomeA, nomeEspecie, localizacao) VALUES (seqCodeA.nextval, '2017.03.14', 'F', 'Frutas', 'Bella', 'Macaco', 'Jaula: 3');
INSERT INTO animais (codA, dataNasc, genero, dieta, nomeA, nomeEspecie, localizacao) VALUES (seqCodeA.nextval, '2014.09.21', 'M', 'Carne', 'Simba', 'Tigre', 'Jaula: 6');
INSERT INTO animais (codA, dataNasc, genero, dieta, nomeA, nomeEspecie, localizacao) VALUES (seqCodeA.nextval, '2011.05.17', 'F', 'Bambu', 'Maya', 'Panda-Vermelho', 'Jaula: 1');
INSERT INTO animais (codA, dataNasc, genero, dieta, nomeA, nomeEspecie, localizacao) VALUES (seqCodeA.nextval, '2009.11.03', 'M', 'Peixes', 'Rocky', 'Foca', 'Jaula: 5');
INSERT INTO animais (codA, dataNasc, genero, dieta, nomeA, nomeEspecie, localizacao) VALUES (seqCodeA.nextval, '2016.07.29', 'F', 'Carne', 'Nala', 'Pantera', 'Jaula: 9');
INSERT INTO animais (codA, dataNasc, genero, dieta, nomeA, nomeEspecie, localizacao) VALUES (seqCodeA.nextval, '2013.01.12', 'M', 'Erva', 'Harry', 'Cavalo', 'Jaula: 3');
INSERT INTO animais (codA, dataNasc, genero, dieta, nomeA, nomeEspecie, localizacao) VALUES (seqCodeA.nextval, '2008.04.19', 'F', 'Frutas', 'Molly', 'Gorila', 'Jaula: 8');
INSERT INTO animais (codA, dataNasc, genero, dieta, nomeA, nomeEspecie, localizacao) VALUES (seqCodeA.nextval, '2019.06.08', 'M', 'Bambu', 'Polo', 'Panda-Gigante', 'Jaula: 4');
INSERT INTO animais (codA, dataNasc, genero, dieta, nomeA, nomeEspecie, localizacao) VALUES (seqCodeA.nextval, '2010.10.22', 'F', 'Carne', 'Lily', 'Leopardo', 'Jaula: 6');
INSERT INTO animais (codA, dataNasc, genero, dieta, nomeA, nomeEspecie, localizacao) VALUES (seqCodeA.nextval, '2011.02.05', 'M', 'Plantas', 'Max', 'Canguru', 'Jaula: 2');
INSERT INTO animais (codA, dataNasc, genero, dieta, nomeA, nomeEspecie, localizacao) VALUES (seqCodeA.nextval, '2015.08.15', 'F', 'Peixes', 'Coral', 'Golfinho', 'Jaula: 5');
INSERT INTO animais (codA, dataNasc, genero, dieta, nomeA, nomeEspecie, localizacao) VALUES (seqCodeA.nextval, '2012.07.07', 'M', 'Folhas', 'Rex', 'Girafa', 'Jaula: 7');

--Preencher tabela lojas
delete from lojas;

INSERT INTO lojas (nomeL, nFuncionarios, horarioA, horarioT) VALUES ('Loja A', 10, '08:00', '18:00');
INSERT INTO lojas (nomeL, nFuncionarios, horarioA, horarioT) VALUES ('Loja B', 8, '09:00', '19:00');
INSERT INTO lojas (nomeL, nFuncionarios, horarioA, horarioT) VALUES ('Loja C', 12, '10:00', '20:00');
INSERT INTO lojas (nomeL, nFuncionarios, horarioA, horarioT) VALUES ('Loja D', 15, '08:30', '17:30');
INSERT INTO lojas (nomeL, nFuncionarios, horarioA, horarioT) VALUES ('Loja E', 9, '07:00', '16:00');

-- Inserir dados na tabela lucro
delete from lucros;

INSERT INTO lucros (nomeL, mes, ano, valor) VALUES ('Loja A',12, 2024, 280000);
INSERT INTO lucros (nomeL, mes, ano, valor) VALUES ('Loja B',04, 2024, 320000);
INSERT INTO lucros (nomeL, mes, ano, valor) VALUES ('Loja C',10, 2022, 275000);
INSERT INTO lucros (nomeL,mes, ano, valor) VALUES ('Loja A',12, 2024, 310000);
INSERT INTO lucros (nomeL,mes, ano, valor) VALUES ('Loja B', 04, 2024, 290000);
INSERT INTO lucros (nomeL,mes, ano, valor) VALUES ('Loja A', 06, 2023, 265000);
INSERT INTO lucros (nomeL,mes, ano, valor) VALUES ('Loja B',08, 2024, 310000);
INSERT INTO lucros (nomeL,mes, ano, valor) VALUES ('Loja C',03, 2022, 290000);
INSERT INTO lucros (nomeL,mes, ano, valor) VALUES ('Loja A',11, 2024, 295000);
INSERT INTO lucros (nomeL,mes, ano, valor) VALUES ('Loja B', 02, 2023, 280000);
INSERT INTO lucros (nomeL,mes, ano, valor) VALUES ('Loja C',09, 2022, 275000);
INSERT INTO lucros (nomeL,mes, ano, valor) VALUES ('Loja A',07, 2024, 290000);
INSERT INTO lucros (nomeL,mes, ano, valor) VALUES ('Loja B',05, 2023, 300000);
INSERT INTO lucros (nomeL,mes, ano, valor) VALUES ('Loja C',12, 2022, 285000);
INSERT INTO lucros (nomeL,mes, ano, valor) VALUES ('Loja A',01, 2024, 295000);

--Preencher tabela limpadores
delete from limpadores;

INSERT INTO limpadores (NIF) VALUES (473892741);
INSERT INTO limpadores (NIF) VALUES (392846273);
INSERT INTO limpadores (NIF) VALUES (817263945);
INSERT INTO limpadores (NIF) VALUES (126349587);

-- Preenchimento da tabela limpamJ com dias da semana
delete from limpamJ;

INSERT INTO limpamJ (localizacao, NIF, diaLimpeza) VALUES ('Jaula: 1', 473892741, 'Segunda');
INSERT INTO limpamJ (localizacao, NIF, diaLimpeza) VALUES ('Jaula: 2', 392846273, 'Terça');
INSERT INTO limpamJ (localizacao, NIF, diaLimpeza) VALUES ('Jaula: 3', 817263945, 'Quarta');
INSERT INTO limpamJ (localizacao, NIF, diaLimpeza) VALUES ('Jaula: 4', 126349587, 'Quinta');
INSERT INTO limpamJ (localizacao, NIF, diaLimpeza) VALUES ('Jaula: 5', 473892741, 'Sexta');
INSERT INTO limpamJ (localizacao, NIF, diaLimpeza) VALUES ('Jaula: 6', 392846273, 'Sábado');
INSERT INTO limpamJ (localizacao, NIF, diaLimpeza) VALUES ('Jaula: 7', 817263945, 'Domingo');
INSERT INTO limpamJ (localizacao, NIF, diaLimpeza) VALUES ('Jaula: 8', 126349587, 'Segunda');
INSERT INTO limpamJ (localizacao, NIF, diaLimpeza) VALUES ('Jaula: 9', 473892741, 'Terça');
INSERT INTO limpamJ (localizacao, NIF, diaLimpeza) VALUES ('Jaula: 10', 392846273, 'Quarta');
INSERT INTO limpamJ (localizacao, NIF, diaLimpeza) VALUES ('Jaula: 11', 817263945, 'Quinta');
INSERT INTO limpamJ (localizacao, NIF, diaLimpeza) VALUES ('Jaula: 12', 126349587, 'Sexta');
INSERT INTO limpamJ (localizacao, NIF, diaLimpeza) VALUES ('Jaula: 13', 473892741, 'Sábado');
INSERT INTO limpamJ (localizacao, NIF, diaLimpeza) VALUES ('Jaula: 14', 392846273, 'Domingo');
INSERT INTO limpamJ (localizacao, NIF, diaLimpeza) VALUES ('Jaula: 15', 817263945, 'Segunda');
INSERT INTO limpamJ (localizacao, NIF, diaLimpeza) VALUES ('Jaula: 16', 126349587, 'Terça');
INSERT INTO limpamJ (localizacao, NIF, diaLimpeza) VALUES ('Jaula: 17', 473892741, 'Quarta');
INSERT INTO limpamJ (localizacao, NIF, diaLimpeza) VALUES ('Jaula: 18', 392846273, 'Quinta');

--Preencher vendedores 
delete from vendedores;

INSERT INTO vendedores (NIF) VALUES (825394671);
INSERT INTO vendedores (NIF) VALUES (134958762);
INSERT INTO vendedores (NIF) VALUES (912384765);
INSERT INTO vendedores (NIF) VALUES (372891546);
INSERT INTO vendedores (NIF) VALUES (849376512);
INSERT INTO vendedores (NIF) VALUES (581239746);
INSERT INTO vendedores (NIF) VALUES (648291735);
INSERT INTO vendedores (NIF) VALUES (273846195);
INSERT INTO vendedores (NIF) VALUES (594837261);
INSERT INTO vendedores (NIF) VALUES (729384651);

--Preencher vendedoresB 
delete from vendedoresB;

INSERT INTO vendedoresB (NIF) VALUES (825394671);
INSERT INTO vendedoresB (NIF) VALUES (134958762);
INSERT INTO vendedoresB (NIF) VALUES (912384765);
INSERT INTO vendedoresB (NIF) VALUES (372891546);
INSERT INTO vendedoresB (NIF) VALUES (849376512);

--Preencher vendedoresL 
delete from vendedoresL;

INSERT INTO vendedoresL (NIF, nomeL) VALUES (581239746, 'Loja A');
INSERT INTO vendedoresL (NIF, nomeL) VALUES (648291735, 'Loja B');
INSERT INTO vendedoresL (NIF, nomeL) VALUES (273846195, 'Loja C');
INSERT INTO vendedoresL (NIF, nomeL) VALUES (594837261, 'Loja D');
INSERT INTO vendedoresL (NIF, nomeL) VALUES (729384651, 'Loja E');

--Preencher tabela tratadores
delete from tratadores;

INSERT INTO tratadores (NIF) VALUES (647382951);
INSERT INTO tratadores (NIF) VALUES (529847613);
INSERT INTO tratadores (NIF) VALUES (783912465);
INSERT INTO tratadores (NIF) VALUES (364958172);

-- Inserir dados na tabela tratam
delete from tratam;

INSERT INTO tratam (codA, NIF) VALUES (1, 473892741);
INSERT INTO tratam (codA, NIF) VALUES (2, 392846273);
INSERT INTO tratam (codA, NIF) VALUES (3, 817263945);
INSERT INTO tratam (codA, NIF) VALUES (4, 126349587);
INSERT INTO tratam (codA, NIF) VALUES (5, 647382951);
INSERT INTO tratam (codA, NIF) VALUES (5, 529847613);
INSERT INTO tratam (codA, NIF) VALUES (999, 473892741);
INSERT INTO tratam (codA, NIF) VALUES (1, 999999999);



--Preencher tabela animadores
delete from animadores;

INSERT INTO animadores (NIF) VALUES (294837615);
INSERT INTO animadores (NIF) VALUES (915837264);

--Preencher tabela tiposBilhete
delete from tiposBilhete;

INSERT INTO tiposBilhete (tipoB, precoB) VALUES ('Criança', 17.00);
INSERT INTO tiposBilhete (tipoB, precoB) VALUES ('Adulto', 28.00);
INSERT INTO tiposBilhete (tipoB, precoB) VALUES ('Idoso', 20.00);

GRANT SELECT ON seqBilheteiras TO bilheteiras;

--Sequence para o codigo dos bilheteiras
CREATE SEQUENCE seqBilheteiras
start with 1
increment by 1;

--Preencher tabela bilheteiras
delete from bilheteiras;

INSERT INTO bilheteiras (numB, abertura, encerramento) VALUES (seqBilheteiras.NEXTVAL, '09:00', '18:00');
INSERT INTO bilheteiras (numB, abertura, encerramento) VALUES (seqBilheteiras.NEXTVAL, '09:30', '18:30');
INSERT INTO bilheteiras (numB, abertura, encerramento) VALUES (seqBilheteiras.NEXTVAL, '10:00', '19:00');
INSERT INTO bilheteiras (numB, abertura, encerramento) VALUES (seqBilheteiras.NEXTVAL, '10:30', '19:30');
INSERT INTO bilheteiras (numB, abertura, encerramento) VALUES (seqBilheteiras.NEXTVAL, '11:00', '20:00');

GRANT SELECT ON seqBilhetes TO bilhetes;

--Sequence para o codigo dos bilhetes
CREATE SEQUENCE seqBilhetes
start with 1
increment by 1;

--Preencher tabela bilhetes
delete from bilhetes;

INSERT INTO bilhetes (numBilhete, dataCompra, tipoB, numB) VALUES (seqBilhetes.NEXTVAL, '2023.06.08', 'Criança', 1);
INSERT INTO bilhetes (numBilhete, dataCompra, tipoB, numB) VALUES (seqBilhetes.NEXTVAL, '2023.02.04', 'Adulto', 2);
INSERT INTO bilhetes (numBilhete, dataCompra, tipoB, numB) VALUES (seqBilhetes.NEXTVAL, '2023.01.09', 'Idoso', 1);
INSERT INTO bilhetes (numBilhete, dataCompra, tipoB, numB) VALUES (seqBilhetes.NEXTVAL, '2023.07.15', 'Adulto', 1);
INSERT INTO bilhetes (numBilhete, dataCompra, tipoB, numB) VALUES (seqBilhetes.NEXTVAL, '2023.08.21', 'Criança', 3);
INSERT INTO bilhetes (numBilhete, dataCompra, tipoB, numB) VALUES (seqBilhetes.NEXTVAL, '2023.09.05', 'Idoso', 1);
INSERT INTO bilhetes (numBilhete, dataCompra, tipoB, numB) VALUES (seqBilhetes.NEXTVAL, '2023.10.12', 'Adulto', 2);
INSERT INTO bilhetes (numBilhete, dataCompra, tipoB, numB) VALUES (seqBilhetes.NEXTVAL, '2023.11.03', 'Criança', 1);
INSERT INTO bilhetes (numBilhete, dataCompra, tipoB, numB) VALUES (seqBilhetes.NEXTVAL, '2023.12.25', 'Idoso', 3);
INSERT INTO bilhetes (numBilhete, dataCompra, tipoB, numB) VALUES (seqBilhetes.NEXTVAL, '2024.01.01', 'Adulto', 4);
INSERT INTO bilhetes (numBilhete, dataCompra, tipoB, numB) VALUES (seqBilhetes.NEXTVAL, '2024.02.14', 'Criança', 5);
INSERT INTO bilhetes (numBilhete, dataCompra, tipoB, numB) VALUES (seqBilhetes.NEXTVAL, '2024.03.18', 'Idoso', 5);
INSERT INTO bilhetes (numBilhete, dataCompra, tipoB, numB) VALUES (seqBilhetes.NEXTVAL, '2024.04.22', 'Adulto', 5);
INSERT INTO bilhetes (numBilhete, dataCompra, tipoB, numB) VALUES (seqBilhetes.NEXTVAL, '2024.05.30', 'Criança', 5);
INSERT INTO bilhetes (numBilhete, dataCompra, tipoB, numB) VALUES (seqBilhetes.NEXTVAL, '2023.06.14', 'Idoso', 5);
INSERT INTO bilhetes (numBilhete, dataCompra, tipoB, numB) VALUES (seqBilhetes.NEXTVAL, '2023.07.29', 'Adulto', 5);
INSERT INTO bilhetes (numBilhete, dataCompra, tipoB, numB) VALUES (seqBilhetes.NEXTVAL, '2023.08.10', 'Criança', 5);
INSERT INTO bilhetes (numBilhete, dataCompra, tipoB, numB) VALUES (seqBilhetes.NEXTVAL, '2023.09.20', 'Idoso', 5);
INSERT INTO bilhetes (numBilhete, dataCompra, tipoB, numB) VALUES (seqBilhetes.NEXTVAL, '2023.10.05', 'Adulto', 4);
INSERT INTO bilhetes (numBilhete, dataCompra, tipoB, numB) VALUES (seqBilhetes.NEXTVAL, '2023.11.17', 'Criança', 2);
INSERT INTO bilhetes (numBilhete, dataCompra, tipoB, numB) VALUES (seqBilhetes.NEXTVAL, '2023.12.30', 'Idoso', 5);
INSERT INTO bilhetes (numBilhete, dataCompra, tipoB, numB) VALUES (seqBilhetes.NEXTVAL, '2023.05.08', 'Criança', 1);
INSERT INTO bilhetes (numBilhete, dataCompra, tipoB, numB) VALUES (seqBilhetes.NEXTVAL, '2023.07.08', 'Criança', 1);

-- Conceder permissão de SELECT na sequência seqEspetaculos ao usuário espetaculos
GRANT SELECT ON seqEspetaculos TO espetaculos;

-- Criar a sequência para o id dos espetaculos
CREATE SEQUENCE seqEspetaculos
start with 1
increment by 1;

-- Inserir dados na tabela espetaculos
delete from espetaculos;

INSERT INTO espetaculos (idEspetaculo, horas, tema, limitePessoas) VALUES (seqEspetaculos.NEXTVAL, '10:00', 'Espetaculo de Golfinhos', 200);
INSERT INTO espetaculos (idEspetaculo, horas, tema, limitePessoas) VALUES (seqEspetaculos.NEXTVAL, '11:30', 'Show de Leões Marinhos', 150);
INSERT INTO espetaculos (idEspetaculo, horas, tema, limitePessoas) VALUES (seqEspetaculos.NEXTVAL, '13:00', 'Apresentação de Pássaros Exóticos', 100);
INSERT INTO espetaculos (idEspetaculo, horas, tema, limitePessoas) VALUES (seqEspetaculos.NEXTVAL, '14:30', 'Show de Acrobacias Aquáticas', 250);
INSERT INTO espetaculos (idEspetaculo, horas, tema, limitePessoas) VALUES (seqEspetaculos.NEXTVAL, '16:00', 'Apresentação de Animais Selvagens', 180);
INSERT INTO espetaculos (idEspetaculo, horas, tema, limitePessoas) VALUES (seqEspetaculos.NEXTVAL, '17:30', 'Espetáculo de Encerramento com Fogos de Artifício', 300);

INSERT INTO participam (idEspetaculo, codA, NIF) VALUES (1, 3, 915837264);
INSERT INTO participam (idEspetaculo, codA, NIF) VALUES (2, 3, 915837264);
INSERT INTO participam (idEspetaculo, codA, NIF) VALUES (3, 4, 915837264);
INSERT INTO participam (idEspetaculo, codA, NIF) VALUES (4, 5, 915837264);
INSERT INTO participam (idEspetaculo, codA, NIF) VALUES (5, 6, 915837264);
INSERT INTO participam (idEspetaculo, codA, NIF) VALUES (6, 3, 915837264);

INSERT INTO compramB (NIF, numBilhete) VALUES (473892741, 1);
INSERT INTO compramB (NIF, numBilhete) VALUES (473892741, 22);
INSERT INTO compramB (NIF, numBilhete) VALUES (473892741, 23);
