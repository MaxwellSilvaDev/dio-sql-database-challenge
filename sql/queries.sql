SELECT * FROM Produto;

SELECT *
FROM Produto
WHERE preco < 500;

SELECT *
FROM Produto
ORDER BY preco DESC;

SELECT Cliente.nome, Pedido.id, Pedido.data_pedido
FROM Pedido
JOIN Cliente
ON Pedido.id_cliente = Cliente.id;

SELECT 
id_pedido,
id_produto,
quantidade,
preco_unitario,
quantidade * preco_unitario AS valor_total
FROM Item_Pedido;

SELECT 
id_pedido,
SUM(quantidade * preco_unitario) AS total_pedido
FROM Item_Pedido
GROUP BY id_pedido;
