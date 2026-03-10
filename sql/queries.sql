-- CONSULTAS BÁSICAS
-- 1. Listar todos os clientes
SELECT * 
FROM Cliente;

-- 2. Listar todos os produtos
SELECT * 
FROM Produto;

-- 3. Listar todos os pedidos
SELECT * 
FROM Pedido;

-- FILTROS E ORDENAÇÃO
-- 4. Produtos com preço maior que 100
SELECT nome, preco
FROM Produto
WHERE preco > 100
ORDER BY preco DESC;

-- 5. Pedidos com status 'Em processamento'
SELECT id, data_pedido, status_pedido, endereco_entrega
FROM Pedido
WHERE status_pedido = 'Em processamento';



-- JOINS
-- 6. Listar produtos com fornecedor e vendedor terceirizado
SELECT 
    p.nome AS produto,
    p.preco,
    f.nome AS fornecedor,
    v.nome AS vendedor_terceirizado
FROM Produto p
INNER JOIN Fornecedor f ON p.id_fornecedor = f.id
INNER JOIN Vendedor_Terceirizado v ON p.id_vendedor = v.id;

-- 7. Listar pedidos com nome do cliente
SELECT
    pe.id AS id_pedido,
    c.nome AS cliente,
    pe.data_pedido,
    pe.status_pedido
FROM Pedido pe
INNER JOIN Cliente c ON pe.id_cliente = c.id
ORDER BY pe.data_pedido DESC;

-- 8. Listar itens do pedido com nome do produto e subtotal
SELECT
    ip.id_pedido,
    pr.nome AS produto,
    ip.quantidade,
    ip.preco_unitario,
    (ip.quantidade * ip.preco_unitario) AS subtotal
FROM Item_Pedido ip
INNER JOIN Produto pr ON ip.id_produto = pr.id
ORDER BY ip.id_pedido;



-- AGREGAÇÕES
-- 9. Quantidade de produtos cadastrados
SELECT COUNT(*) AS total_produtos
FROM Produto;

-- 10. Valor total de cada pedido
SELECT
    ip.id_pedido,
    SUM(ip.quantidade * ip.preco_unitario) AS valor_total_pedido
FROM Item_Pedido ip
GROUP BY ip.id_pedido
ORDER BY valor_total_pedido DESC;

-- 11. Quantidade de pedidos por status
SELECT
    status_pedido,
    COUNT(*) AS total_pedidos
FROM Pedido
GROUP BY status_pedido
ORDER BY total_pedidos DESC;

-- 12. Estoque total por produto
SELECT
    p.nome AS produto,
    SUM(e.quantidade) AS estoque_total
FROM Estoque e
INNER JOIN Produto p ON e.id_produto = p.id
GROUP BY p.nome
ORDER BY estoque_total DESC;



-- CONSULTAS MAIS FORTES PARA PORTFÓLIO
-- 13. Total gasto por cliente
SELECT
    c.nome AS cliente,
    SUM(ip.quantidade * ip.preco_unitario) AS total_gasto
FROM Cliente c
INNER JOIN Pedido pe ON c.id = pe.id_cliente
INNER JOIN Item_Pedido ip ON pe.id = ip.id_pedido
GROUP BY c.nome
ORDER BY total_gasto DESC;

-- 14. Produtos que nunca foram vendidos
SELECT
    p.id,
    p.nome,
    p.preco
FROM Produto p
LEFT JOIN Item_Pedido ip ON p.id = ip.id_produto
WHERE ip.id_produto IS NULL;

-- 15. Clientes que fizeram mais pedidos
SELECT
    c.nome AS cliente,
    COUNT(pe.id) AS quantidade_pedidos
FROM Cliente c
INNER JOIN Pedido pe ON c.id = pe.id_cliente
GROUP BY c.nome
ORDER BY quantidade_pedidos DESC;

-- 16. Pedido com entrega e código de rastreamento
SELECT
    pe.id AS pedido,
    pe.status_pedido,
    en.status_entrega,
    en.codigo_rastreamento
FROM Pedido pe
INNER JOIN Entrega en ON pe.id = en.id_pedido;

-- 17. Produtos com seus respectivos estoques, fornecedores e vendedores
SELECT
    p.nome AS produto,
    p.preco,
    e.quantidade,
    f.nome AS fornecedor,
    v.nome AS vendedor
FROM Produto p
INNER JOIN Estoque e ON p.id = e.id_produto
INNER JOIN Fornecedor f ON p.id_fornecedor = f.id
INNER JOIN Vendedor_Terceirizado v ON p.id_vendedor = v.id
ORDER BY p.nome;

-- 18. Média de valor dos produtos cadastrados
SELECT
    AVG(preco) AS media_preco_produtos
FROM Produto;
