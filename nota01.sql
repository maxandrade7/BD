/*QUESTAO 1*/
CREATE TABLE Medico(
    CRM INT PRIMARY KEY,
    Nome VARCHAR(60),
    Especialidade TEXT
);

CREATE TABLE Setor(
    CodSetor INT PRIMARY KEY,
    Nome VARCHAR(60),
    Supervisor INT REFERENCES Medico (CRM)
);

CREATE TABLE SetorMedico(
    CodSetor INT PRIMARY KEY,
    CRM INT REFERENCES Medico(CRM)
);

CREATE TABLE Paciente(
    CodPaciente INT PRIMARY KEY,
    Nome VARCHAR(60),
    DataNascimento DATE
);

CREATE TABLE Atendimento(
    CodAtendimento INT PRIMARY KEY,
    Data DATE,
    Valor NUMERIC(4,2),
    Tipo TEXT,
    AtendAnterior INT,
    CRM INT REFERENCES Medico(CRM),
    CodPaciente INT REFERENCES Paciente(CodPaciente)
);

CREATE TABLE TelefoneMedico(
    Telefone BIGINT PRIMARY KEY,
    CRM INT REFERENCES Medico(CRM)
);

/*QUESTAO 02*/
INSERT INTO Medico VALUES 
(01112223330, 'Joao', 'Odontologista'),
(02223334440, 'Marcelo', 'Pediatra'),
(04445556660, 'Carlos', 'Oftamologista');

INSERT INTO Setor VALUES 
(010, 'Consulta', 01112223330),
(011, 'Pediatria', 02223334440),
(012,'Emergencia', 04445556660);

INSERT INTO SetorMedico VALUES 
(10, 01112223330),
(11, 02223334440),
(12, 04445556660);

INSERT INTO Paciente VALUES 
(1, 'Gustavo', '2002-04-19'),
(2, 'Jose', '2003-05-10'),
(3, 'Maria', '1999-01-03');

INSERT INTO Atendimento VALUES 
(01, '2019-05-02', 200.50, 'Limpeza', null, 01112223330, 1),
(02, '2019-04-30', 170.25, 'Pediatria', 01, 02223334440, 2),
(03, '2019-04-20', 500.75, 'Consulta', 02, 04445556660, 3);

INSERT INTO TelefoneMedico VALUES 
(40028922, 01112223330), 
(50028933, 02223334440), 
(60028955, 04445556660);

/*QUESTAO 03*/
SELECT CodPaciente FROM Paciente WHERE Paciente.Nome LIKE '%Maria';

/*QUESTAO 04*/
SELECT CRM, Especialidade FROM Medico WHERE Medico.Nome LIKE '%Joao';

/*QUESTAO 05*/
SELECT (Valor*0.15)+Valor From Atendimento;

/*QUESTAO 06*/
SELECT m.Nome
FROM Medico m
INNER JOIN Setor s
ON (m.CRM = s.Supervisor) WHERE s.Nome ='Pediatria';

/*QUESTAO 07*/
SELECT Nome from Setor where Supervisor = 04445556660;

/*QUESTAO 08*/
SELECT Telefone FROM TelefoneMedico WHERE CRM = 01112223330;
