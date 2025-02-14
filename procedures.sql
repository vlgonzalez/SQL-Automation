-- Procedure para adicionar um cliente com validação de e-mail duplicado
CREATE PROCEDURE AddCliente
    @Nome NVARCHAR(100),
    @Email NVARCHAR(100)
AS
BEGIN
    -- Verifica se o e-mail já está cadastrado
    IF EXISTS (SELECT 1 FROM Clientes WHERE Email = @Email)
        THROW 50000, 'Este e-mail já está cadastrado!', 1;
    ELSE
        INSERT INTO Clientes (Nome, Email) VALUES (@Nome, @Email);
END;
GO

-- Procedure para atualizar o nome do cliente e registrar no histórico
CREATE PROCEDURE UpdateCliente
    @ClienteID INT,
    @NovoNome NVARCHAR(100)
AS
BEGIN
    -- Atualiza o nome do cliente e armazena a alteração no histórico
    DECLARE @NomeAntigo NVARCHAR(100);
    
    SELECT @NomeAntigo = Nome FROM Clientes WHERE ID = @ClienteID;
    
    UPDATE Clientes
    SET Nome = @NovoNome
    WHERE ID = @ClienteID;

    INSERT INTO HistoricoClientes (ClienteID, NomeAntigo, NomeNovo, DataModificacao)
    VALUES (@ClienteID, @NomeAntigo, @NovoNome, GETDATE());
END;
GO
