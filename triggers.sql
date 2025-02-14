CREATE TRIGGER trg_AfterUpdate ON Clientes
AFTER UPDATE
AS
BEGIN
    INSERT INTO HistoricoClientes (ClienteID, NomeAntigo, NomeNovo, DataModificacao)
    SELECT i.ID, d.Nome, i.Nome, GETDATE()
    FROM inserted i
    JOIN deleted d ON i.ID = d.ID;
END;
