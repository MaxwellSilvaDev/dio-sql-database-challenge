# E-commerce SQL Database

Projeto de modelagem e implementação de um banco de dados relacional para um sistema de e-commerce, com foco em entidades, relacionamentos, chaves primárias, chaves estrangeiras e consultas SQL.

## 📊 Modelo do Banco

![Diagrama do Banco](ecommerce-database-diagram.png)

  ## Estrutura do Projeto

- `sql/schema.sql` → criação das tabelas e relacionamentos
- `sql/inserts.sql` → inserção de dados para testes
- `sql/queries.sql` → consultas SQL do projeto
- `ecommerce-database-diagram.png` → diagrama do banco de dados

  ## Tecnologias Utilizadas

- SQL
- SQL Server
- Git
- GitHub
- dbdiagram.io

  ## Consultas Implementadas

O projeto inclui consultas SQL para análise e manipulação dos dados do sistema de e-commerce, como:

- Listagem de produtos cadastrados
- Filtro de produtos por preço
- Ordenação de produtos por valor
- Consulta de pedidos com dados do cliente
- Consulta de itens de pedido com cálculo de valor total
- Soma do valor total dos pedidos

Essas consultas foram desenvolvidas para praticar comandos SQL fundamentais, como `SELECT`, `WHERE`, `ORDER BY`, `JOIN`, `SUM` e cálculos com colunas.

## Exemplos de Consultas SQL

### 1. Valor total de cada pedido

```sql
SELECT
    ip.id_pedido,
    SUM(ip.quantidade * ip.preco_unitario) AS valor_total_pedido
FROM Item_Pedido ip
GROUP BY ip.id_pedido
ORDER BY valor_total_pedido DESC;
```

### 2. Total gasto por cliente

```sql
SELECT
    c.nome AS cliente,
    SUM(ip.quantidade * ip.preco_unitario) AS total_gasto
FROM Cliente c
INNER JOIN Pedido pe ON c.id = pe.id_cliente
INNER JOIN Item_Pedido ip ON pe.id = ip.id_pedido
GROUP BY c.nome
ORDER BY total_gasto DESC;
```

### 3. Produtos que nunca foram vendidos

```sql
SELECT
    p.id,
    p.nome,
    p.preco
FROM Produto p
LEFT JOIN Item_Pedido ip ON p.id = ip.id_produto
WHERE ip.id_produto IS NULL;
```

  ## Como Executar o Projeto

1. Crie um banco de dados no SQL Server.
2. Execute o arquivo `sql/schema.sql` para criar as tabelas e relacionamentos.
3. Execute o arquivo `sql/inserts.sql` para inserir os dados de teste.
4. Execute o arquivo `sql/queries.sql` para visualizar as consultas do projeto.

## Objetivo do Projeto

Este projeto foi desenvolvido com o objetivo de praticar modelagem de dados, criação de tabelas, definição de chaves primárias e estrangeiras, inserção de dados e construção de consultas SQL em um cenário de e-commerce.

O banco simula um sistema de **e-commerce**, contendo:

- Cliente
- Produto
- Pedido
- Fornecedor
- Vendedor Terceirizado
- Estoque
- Pagamento
- Entrega


