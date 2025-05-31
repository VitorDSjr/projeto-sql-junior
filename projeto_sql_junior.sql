-- ANALISTA DE DADOS JÚNIOR - VITOR HUGO
-- PROJETO EM MYSQL | CONSULTAS EXPLORATÓRIAS

-- BASE: Tabela 'vendas' com colunas: id_venda, cliente, produto, categoria, quantidade, preco_unitario, data_venda, estado

-- =====================================================
-- EXERCÍCIO 1: Total de produtos vendidos por estado
SELECT estado, SUM(quantidade) AS itens_vendidos
FROM vendas
GROUP BY estado
ORDER BY itens_vendidos DESC;

-- =====================================================
-- EXERCÍCIO 2: Top clientes que mais gastaram em 2023
SELECT cliente, SUM(quantidade * preco_unitario) AS gastou
FROM vendas
WHERE YEAR(data_venda) = 2023
GROUP BY cliente
ORDER BY gastou DESC;

-- =====================================================
-- EXERCÍCIO 3: Clientes com compras acima de 5000
SELECT cliente, SUM(quantidade * preco_unitario) AS gastou
FROM vendas
GROUP BY cliente
HAVING gastou > 5000;

-- =====================================================
-- EXERCÍCIO 4: Produto mais vendido (em quantidade)
SELECT produto, SUM(quantidade) AS unidades
FROM vendas
GROUP BY produto
ORDER BY unidades DESC
LIMIT 1;

-- =====================================================
-- EXERCÍCIO 5: Faturamento total por categoria
SELECT categoria, SUM(quantidade * preco_unitario) AS faturamento
FROM vendas
GROUP BY categoria;

-- =====================================================
-- EXERCÍCIO 6: Faturamento mensal no ano de 2023
SELECT 
    MONTH(data_venda) AS mes,
    SUM(quantidade * preco_unitario) AS faturamento_mensal
FROM vendas
WHERE YEAR(data_venda) = 2023
GROUP BY mes
ORDER BY mes;

-- =====================================================
-- EXERCÍCIO 7: Faturamento por categoria entre 2022 e 2023
SELECT 
    YEAR(data_venda) AS ano,
    categoria,
    SUM(quantidade * preco_unitario) AS faturamento
FROM vendas
WHERE YEAR(data_venda) BETWEEN 2022 AND 2023
GROUP BY ano, categoria
ORDER BY ano, faturamento DESC;
