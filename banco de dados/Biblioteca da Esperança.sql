-- 1. Criar o Banco de Dados
CREATE DATABASE Biblioteca;

-- 2. Selecionar o Banco de Dados
USE Biblioteca;

-- 3. Criar a Tabela de Usuários
CREATE TABLE Usuario (
    ID_Usuario INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(100) NOT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE,
    Telefone VARCHAR(15),
    Data_Nascimento DATE
);

-- 4. Criar a Tabela de Livros
CREATE TABLE Livro (
    ID_Livro INT PRIMARY KEY AUTO_INCREMENT,
    Titulo VARCHAR(200) NOT NULL,
    Autor VARCHAR(100) NOT NULL,
    ISBN VARCHAR(20) NOT NULL UNIQUE,
    Genero VARCHAR(50),
    Status ENUM('Disponível', 'Empréstimo') NOT NULL DEFAULT 'Disponível'
);

-- 5. Criar a Tabela de Empréstimos
CREATE TABLE Emprestimo (
    ID_Emprestimo INT PRIMARY KEY AUTO_INCREMENT,
    ID_Usuario INT,
    ID_Livro INT,
    Data_Emprestimo DATE NOT NULL,
    Data_Devolucao DATE,
    Status ENUM('Devolvido', 'Não Devolvido') NOT NULL DEFAULT 'Não Devolvido',
    FOREIGN KEY (ID_Usuario) REFERENCES Usuario(ID_Usuario),
    FOREIGN KEY (ID_Livro) REFERENCES Livro(ID_Livro)
);

-- 6. Inserir Usuários
INSERT INTO Usuario (Nome, Email, Telefone, Data_Nascimento)
VALUES 
('João da Silva', 'joao.silva@email.com', '11987654321', '1990-05-15'),
('Maria Oliveira', 'maria.oliveira@email.com', '11998765432', '1985-08-20');

-- 7. Inserir Livros
INSERT INTO Livro (Titulo, Autor, ISBN, Genero, Status)
VALUES 
('O Alquimista', 'Paulo Coelho', '9788573023103', 'Ficção', 'Disponível'),
('A Revolução dos Bichos', 'George Orwell', '9788535932053', 'Ficção', 'Disponível');

-- 8. Registrar Empréstimos
INSERT INTO Emprestimo (ID_Usuario, ID_Livro, Data_Emprestimo, Status)
VALUES 
(1, 1, CURDATE(), 'Não Devolvido'), -- João da Silva emprestou O Alquimista
(2, 2, CURDATE(), 'Não Devolvido'); -- Maria Oliveira emprestou A Revolução dos Bichos

