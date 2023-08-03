USE MASTER

GO

IF EXISTS(SELECT * FROM sys.databases WHERE NAME = 'Aula')

DROP DATABASE Aula

GO

CREATE DATABASE Aula

GO

USE Aula

GO

CREATE TABLE Aluno
(
	id_aluno INT PRIMARY KEY IDENTITY NOT NULL,
	nome VARCHAR(50) NOT NULL,
	data_mascimento DATE NOT NULL,
	sexo CHAR(1) NOT NULL,
	data_cadastro DATETIME NOT NULL,
	login_cadastro VARCHAR(max) NOT NULL,
	idade INT NOT NULL,
);

CREATE TABLE Cursos
(
	id_curso INT PRIMARY KEY IDENTITY NOT NULL,
	nome_curso VARCHAR(50) NOT NULL,
	data_cadastro DATETIME NOT NULL,
	login_cadastro VARCHAR(15) NOT NULL
);

CREATE TABLE Situacao
(
	id_situacao INT PRIMARY KEY IDENTITY NOT NULL,
	situacao VARCHAR(50) NOT NULL,
	data_cadastro DATETIME,
	login_cadastro VARCHAR(15)
);

CREATE TABLE Turmas
(
	id_turma INT PRIMARY KEY IDENTITY NOT NULL,
	id_aluno INT NOT NULL,
	id_curso INT NOT NULL,
	valor_turma NUMERIC(15,2) NOT NULL,
	desconto NUMERIC(3,2) NOT NULL,
	data_inicio DATE NOT NULL,
	data_termino DATE,
	data_cadastro DATETIME NOT NULL,
	login_cadastro VARCHAR(15)

	FOREIGN KEY (id_aluno)
	REFERENCES Aluno(id_aluno),
	FOREIGN KEY (id_curso)
	REFERENCES Cursos(id_curso)

);

CREATE TABLE Registro_Presenca
(
	id_turma INT NOT NULL,
	id_aluno INT NOT NULL,
	id_situacao INT NOT NULL,
	data_presenca DATE NOT NULL,
	data_cadastro DATETIME NOT NULL,
	login_cadstro VARCHAR(15) NOT NULL,

	FOREIGN KEY (id_aluno)
	REFERENCES Aluno(id_aluno),
	FOREIGN KEY (id_turma)
	REFERENCES Turmas(id_turma),
	FOREIGN KEY (id_situacao)
	REFERENCES Situacao(id_situacao)
);

INSERT INTO Aluno VALUES
('Gabriel','08/05/2003','M',GETDATE(),'gabriel.amorim',20),
('Emilly','02/03/2001','F',GETDATE(),'emilly.castro',22),
('Richard','17/03/2002','M',GETDATE(),'ricardo.kruppa',21),
('Luqueta','02/03/2001','F',GETDATE(),'lucas.silva',22)

INSERT INTO Cursos VALUES
('Banco de dados e Sistemas IoT',GETDATE(),'Senai'),
('Lógica de programação',GETDATE(),'Allan'),
('Desenvolvimento de Sistemas',GETDATE(),'PcAluno'),
('Redes',GETDATE(),'ADM')

INSERT INTO Situacao VALUES
('Presente',GETDATE(),'Senai'),
('Ausente',GETDATE(),'Senai'),
('Atestado',GETDATE(),'Senai')

INSERT INTO Turmas VALUES
(1,1,'500','0.5','19/08/2020','25/08/2020',GETDATE(),'Senai'),
(2,2,'600','0.7','23/10/2021','10/11/2021',GETDATE(),'Senai'),
(3,3,'700','0.8','08/05/2022','15/07/2022',GETDATE(),'Senai'),
(4,4,'800','0.1','30/03/2023','22/05/2023',GETDATE(),'Senai')

INSERT INTO Registro_Presenca VALUES
(1,1,1,GETDATE(),GETDATE(),'gabriel.amorim'),
(2,2,1,GETDATE(),GETDATE(),'emilly.castro'),
(3,3,3,GETDATE(),GETDATE(),'ricardo.kruppa'),
(4,4,2,GETDATE(),GETDATE(),'lucas.silva')

/*
SELECT * FROM Aluno
INNER JOIN Turmas
ON  Aluno.id_aluno = Turmas.id_turma 

SELECT * FROM Turmas
LEFT JOIN  Cursos
ON  Turmas.id_turma = Cursos.id_curso  

SELECT * FROM Situacao
RIGHT JOIN Registro_Presenca
ON  Situacao.id_situacao = Registro_Presenca.id_aluno  

SELECT * FROM Aluno
FULL JOIN Cursos
ON  Aluno.id_aluno = Cursos.id_curso 
*/

SELECT Count(idade) AS conta from Aluno
WHERE Aluno.idade = 21
