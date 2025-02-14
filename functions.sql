-- Função para calcular a idade com base na data de nascimento
CREATE-- Função para calcular a idade com base na data de nascimento
CREATE FUNCTION dbo.CalcularIdade (@DataNascimento DATE)
RETURNS INT
AS
BEGIN
    DECLARE @Idade INT;
    SET @Idade = DATEDIFF(YEAR, @DataNascimento, GETDATE()) 
                - CASE WHEN (MONTH(@DataNascimento) > MONTH(GETDATE())) 
                          OR (MONTH(@DataNascimento) = MONTH(GETDATE()) 
                          AND DAY(@DataNascimento) > DAY(GETDATE())) 
                       THEN 1 ELSE 0 END;
    RETURN @Idade;
END;
GO

-- Função para obter o total de pedidos de um cliente
CREATE FUNCTION dbo.TotalPedidos (@ClienteID INT)
RETURNS INT
AS
BEGIN
    DECLARE @Total INT;
    SELECT @Total = COUNT(*) FROM Pedidos WHERE FUNCTION dbo.CalcularIdade (@DataNascimento DATE)
RETURNS INT
AS
BEGIN
    DECLARE @Idade INT;
    SET @Idade = DATEDIFF(YEAR, @DataNascimento, GETDATE()) 
                - CASE WHEN (MONTH(@DataNascimento) > MONTH(GETDATE())) 
                          OR (MONTH(@DataNascimento) = MONTH(GETDATE()) 
                          AND DAY(@DataNascimento) > DAY(GETDATE())) 
                       THEN 1 ELSE 0 END;
    RETURN @Idade;
END;
GO

-- Função para obter o total de pedidos de um cliente
CREATE FUNCTION dbo.TotalPedidos (@ClienteID INT)
RETURNS INT
AS
BEGIN
    DECLARE @Total INT;
    SELECT @Total = COUNT(*) FROM Pedidos WHERE
