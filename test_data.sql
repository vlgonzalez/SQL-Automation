-- Criando as tabelas necessárias para os testes
CREATE TABLE Clientes (
    ID INT IDENTITY(1,1) PRIMARY KEY,
    Nome NVARCHAR(100) NOT NULL,
    Email NVARCHAR(100) UNIQUE NOT NULL,
    DataNascimento DATE
);

CREATE TABLE HistoricoClientes (
    ID INT IDENTITY(1,1) PRIMARY KEY,
    ClienteID INT,
    NomeAntigo NVARCHAR(100),
    NomeNovo NVARCHAR(100),
    DataModificacao DATETIME,
    FOREIGN KEY (ClienteID) REFERENCES Clientes(ID)
);

CREATE TABLE Pedidos (
    ID INT IDENTITY(1,1) PRIMARY KEY,
    ClienteID INT,
    DataPedido DATETIME DEFAULT GETDATE(),
    ValorTotal DECIMAL(10,2),
    FOREIGN KEY (ClienteID) REFERENCES Clientes(ID)
);

-- Inserindo alguns clientes de teste
INSERT INTO Clientes (Nome, Email, DataNascimento) VALUES 
('Ana Souza', 'ana.souza@email.com', '1990-05-15'),
('Carlos Mendes', 'carlos.mendes@email.com', '1985-09-22'),
('Fernanda Lima', 'fernanda.lima@email.com', '1995-03-10');

-- Inserindo pedidos de teste
INSERT INTO Pedidos (ClienteID, ValorTotal) VALUES
(1, 250.75),
(2, 500.00),
(1, 150.00),
(3, 320.30);

-- Testando a procedure AddCliente
EXEC AddCliente @Nome = 'Bruno Santos', @Email = 'bruno.santos@email.com';

-- Testando a procedure UpdateCliente
EXEC UpdateCliente @ClienteID = 1, @NovoNome = 'Ana Souza Silva';

-- Testando a função CalcularIdade
SELECT Nome, dbo.CalcularIdade(DataNascimento) AS Idade FROM Clientes;

-- Testando a função TotalPedidos
SELECT Nome, dbo.TotalPedidos(ID) AS TotalPedidos FROM Clientes;
