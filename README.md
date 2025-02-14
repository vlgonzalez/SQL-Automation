# 📌 Automação de Tarefas com Procedures e Triggers em SQL  

Este repositório contém exemplos práticos de **procedures**, **triggers** e **funções SQL** para automatizar tarefas no banco de dados, garantindo segurança, integridade e eficiência no processamento de dados.  

## 📂 Estrutura do Repositório  

- `procedures.sql` → Procedures para automação de tarefas repetitivas  
- `triggers.sql` → Triggers para auditoria e integridade de dados  
- `functions.sql` → Funções customizadas para facilitar consultas complexas  
- `test_data.sql` → Scripts para popular o banco e testar as automações  

## 🚀 Tecnologias Utilizadas  
✅ SQL Server | ✅ PostgreSQL | ✅ MySQL  

## ⚡ Exemplos  

### 🔹 Procedure: Cadastro de Cliente com Validação  
```sql
CREATE PROCEDURE AddCliente
    @Nome NVARCHAR(100),
    @Email NVARCHAR(100)
AS
BEGIN
    IF EXISTS (SELECT 1 FROM Clientes WHERE Email = @Email)
        THROW 50000, 'Este e-mail já está cadastrado!', 1;
    ELSE
        INSERT INTO Clientes (Nome, Email) VALUES (@Nome, @Email);
END;
