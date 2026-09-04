-- =========================================================
-- Erros e correções — registro do processo de aprendizado
-- Mantido de propósito: mostra o raciocínio até chegar na
-- versão final que está em analysis_queries.sql.
-- =========================================================


-- ---------------------------------------------------------
-- Pergunta 1: Top 5 posts por engajamento
-- ---------------------------------------------------------

-- Tentativa 1 (funcionou por coincidência, não por estar certa):
SELECT *
FROM posts
GROUP BY engajamento
ORDER BY engajamento DESC
LIMIT 5;
-- Problema: GROUP BY engajamento colapsa posts que têm o mesmo valor
-- de engajamento em uma única linha. Na base há dois pares de posts
-- com engajamento igual (11 e 18) — nenhum deles caiu no top 5, então
-- o resultado bateu, mas com outra base essa query poderia esconder
-- posts silenciosamente. A pergunta pede "ordenar posts individuais",
-- não "agrupar por valor de engajamento" — não precisa de GROUP BY.

-- Versão final (analysis_queries.sql, pergunta 1):
SELECT post_id, tema, tipo_post, engajamento
FROM posts
ORDER BY engajamento DESC
LIMIT 5;


-- ---------------------------------------------------------
-- Pergunta 8: Posts acima da média geral de taxa_engajamento
-- ---------------------------------------------------------

-- Tentativa 1:
SELECT *, ROUND(AVG(taxa_engajamento), 1) AS media_tx_engajamento
FROM posts
GROUP BY post_id
HAVING media_tx_engajamento > 0.1;
-- Problema: post_id é único por linha, então cada "grupo" do GROUP BY
-- tem 1 post só — AVG(taxa_engajamento) vira apenas a taxa daquele
-- próprio post (arredondada), não uma média real de nada. A query não
-- compara com média nenhuma, só filtra por um limiar fixo (0.1).
-- Resultado (errado): só 2 posts (3 e 17) — porque o limiar 0.1 é
-- mais alto que a média real (0.0844) e mais exigente.

-- Tentativa 2 (resultado certo, mas por motivo frágil):
SELECT *, AVG(taxa_engajamento) AS media_tx_engajamento
FROM posts
GROUP BY post_id
HAVING media_tx_engajamento > 0.08437614476698267;
-- Mesmo problema estrutural da tentativa 1 (GROUP BY post_id não faz
-- média de nada). Só funcionou porque o valor 0.08437... foi calculado
-- à mão antes e colado direto na query. Se a base mudar (novos posts),
-- esse número fica desatualizado e a query passa a comparar com uma
-- média errada, sem avisar.

-- Versão final (analysis_queries.sql, pergunta 8):
SELECT post_id, conta, tema, taxa_engajamento
FROM posts
WHERE taxa_engajamento > (SELECT AVG(taxa_engajamento) FROM posts)
ORDER BY taxa_engajamento DESC;
-- A subquery recalcula a média toda vez que a query roda — não
-- depende de ninguém saber o valor de antemão nem de atualizar
-- manualmente quando a base crescer.
