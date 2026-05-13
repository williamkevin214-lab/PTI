CREATE TABLE Pessoa (
    id_pessoa INT NOT NULL PRIMARY KEY,
    tipo_pessoa CHAR(2) NOT NULL,
    CONSTRAINT CK_Pessoa_Tipo CHECK (tipo_pessoa IN ('PF', 'PJ'))
);

--------------------------------------------------

CREATE TABLE Pessoa_Fisica (
    id_pessoa INT NOT NULL PRIMARY KEY,
    nome NVARCHAR(100) NOT NULL,
    cpf VARCHAR(14) NOT NULL UNIQUE,
    data_nascimento DATE,
    telefone VARCHAR(20),
    email NVARCHAR(100),

    CONSTRAINT FK_Pessoa_Fisica_Pessoa
    FOREIGN KEY (id_pessoa)
    REFERENCES Pessoa(id_pessoa)
);

--------------------------------------------------

CREATE TABLE Aluno (
    id_pessoa INT NOT NULL PRIMARY KEY,
    matricula VARCHAR(20) NOT NULL UNIQUE,
    curso NVARCHAR(100),
    semestre INT,
    status_aluno NVARCHAR(20) DEFAULT 'Ativo',

    CONSTRAINT FK_Aluno_Pessoa_Fisica
    FOREIGN KEY (id_pessoa)
    REFERENCES Pessoa_Fisica(id_pessoa)
);

--------------------------------------------------

INSERT INTO Pessoa VALUES (1, 'PF');

INSERT INTO Pessoa_Fisica
VALUES (
1,
'João Silva',
'123.456.789-00',
'2000-05-10',
'(11) 99999-1111',
'joao@email.com'
);

INSERT INTO Aluno
VALUES (
1,
'A2026001',
'Análise e Desenvolvimento de Sistemas',
3,
'Ativo'
);