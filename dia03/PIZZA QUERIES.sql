-- Databricks notebook source
-- qual a borda mais pedida?
SELECT
  descItem,
  count (*) as qtdPedido
FROM silver.pizza_query.item_pedido
WHERE descTipoItem = 'borda'
GROUP BY descItem
ORDER BY qtdPedido DESC
LIMIT 1

-- COMMAND ----------

-- qual a massa mais pedida?
SELECT
  descItem,
  count (*) as qtdPedido
FROM silver.pizza_query.item_pedido
WHERE descTipoItem = 'massa'
GROUP BY descItem
ORDER BY qtdPedido DESC
LIMIT 1

-- COMMAND ----------

-- qual o queijo mais pedido?
SELECT
  descItem,
  count (*) as qtdPedido
FROM silver.pizza_query.item_pedido
WHERE descTipoItem LIKE '%queijo%'
GROUP BY descItem
ORDER BY qtdPedido DESC
LIMIT 1

-- COMMAND ----------

-- qual os ingredientes mais pedidos?
SELECT
  descItem,
  count (*) as qtdPedido
FROM silver.pizza_query.item_pedido
WHERE descTipoItem LIKE '%ingrediente%'
GROUP BY descItem
ORDER BY qtdPedido DESC
LIMIT 5

-- COMMAND ----------

-- qual a bebida mais pedida?
SELECT
  descItem,
  count (*) as qtdPedido
FROM silver.pizza_query.item_pedido
WHERE descTipoItem = 'bebida'
GROUP BY descItem
ORDER BY qtdPedido DESC
LIMIT 1

-- COMMAND ----------

-- junto tudo pra ver o pedido top
(
  SELECT
    descItem,
    count (*) as qtdPedido
  FROM silver.pizza_query.item_pedido
  WHERE descTipoItem = 'borda'
  GROUP BY descItem
  ORDER BY qtdPedido DESC
  LIMIT 1
) UNION ALL (
  SELECT
    descItem,
    count (*) as qtdPedido
  FROM silver.pizza_query.item_pedido
  WHERE descTipoItem = 'massa'
  GROUP BY descItem
  ORDER BY qtdPedido DESC
  LIMIT 1
) UNION ALL (
  SELECT
    descItem,
    count (*) as qtdPedido
  FROM silver.pizza_query.item_pedido
  WHERE descTipoItem LIKE '%queijo%'
  GROUP BY descItem
  ORDER BY qtdPedido DESC
  LIMIT 1
) UNION ALL (
  SELECT
    descItem,
    count (*) as qtdPedido
  FROM silver.pizza_query.item_pedido
  WHERE descTipoItem LIKE '%ingrediente%'
  GROUP BY descItem
  ORDER BY qtdPedido DESC
  LIMIT 5
) UNION ALL (
  SELECT
    descItem,
    count (*) as qtdPedido
  FROM silver.pizza_query.item_pedido
  WHERE descTipoItem = 'bebida'
  GROUP BY descItem
  ORDER BY qtdPedido DESC
  LIMIT 1
)

-- COMMAND ----------

-- qual o preço?
SELECT sum(t2.vlPreco) as `Preço Total`
FROM (
  (
    SELECT
      descItem,
      count (*) as qtdPedido
    FROM silver.pizza_query.item_pedido
    WHERE descTipoItem = 'borda'
    GROUP BY descItem
    ORDER BY qtdPedido DESC
    LIMIT 1
  ) UNION ALL (
    SELECT
      descItem,
      count (*) as qtdPedido
    FROM silver.pizza_query.item_pedido
    WHERE descTipoItem = 'massa'
    GROUP BY descItem
    ORDER BY qtdPedido DESC
    LIMIT 1
  ) UNION ALL (
    SELECT
      descItem,
      count (*) as qtdPedido
    FROM silver.pizza_query.item_pedido
    WHERE descTipoItem LIKE '%queijo%'
    GROUP BY descItem
    ORDER BY qtdPedido DESC
    LIMIT 1
  ) UNION ALL (
    SELECT
      descItem,
      count (*) as qtdPedido
    FROM silver.pizza_query.item_pedido
    WHERE descTipoItem LIKE '%ingrediente%'
    GROUP BY descItem
    ORDER BY qtdPedido DESC
    LIMIT 5
  ) UNION ALL (
    SELECT
      descItem,
      count (*) as qtdPedido
    FROM silver.pizza_query.item_pedido
    WHERE descTipoItem = 'bebida'
    GROUP BY descItem
    ORDER BY qtdPedido DESC
    LIMIT 1
  )
) AS t1

LEFT JOIN silver.pizza_query.produto AS t2

ON t1.descItem = t2.descItem


-- COMMAND ----------


