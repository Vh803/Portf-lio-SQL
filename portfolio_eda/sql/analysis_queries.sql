-- =========================================================
-- Análise de performance de conteúdo — Instagram FCX
-- Perguntas de negócio respondidas neste arquivo
-- =========================================================


-- 1. Top 5 posts individuais por engajamento
SELECT post_id, tema, tipo_post, engajamento
FROM posts
ORDER BY engajamento DESC
LIMIT 5;
-- Resultado: posts 1, 15, 3, 2, 11.


-- 2. Desempenho por conta
SELECT conta,
       COUNT(post_id) AS n_posts,
       ROUND(AVG(engajamento), 1) AS engajamento_medio
FROM posts
GROUP BY conta
ORDER BY engajamento_medio DESC;
-- Resultado: conta_B 43 (n=2) / conta_C 27 (n=1) / conta_A 15 (n=16).
-- Ressalva: conta_B e conta_C têm amostra mínima (1-2 posts) —
-- a "média" ali é essencialmente o valor de um post isolado.
-- Nota: nomes de conta anonimizados (conta_A/B/C) — dados reais da
-- empresa; ver README para o critério de anonimização.


-- 3. Engajamento por tema
SELECT tema,
       COUNT(*) AS n_posts,
       COUNT(taxa_engajamento) AS n_com_taxa,
       ROUND(AVG(taxa_engajamento), 4) AS taxa_engajamento_media,
       ROUND(AVG(engajamento), 1) AS engajamento_medio_absoluto
FROM posts
GROUP BY tema
ORDER BY taxa_engajamento_media DESC;
-- Resultado: jurídico e institucional lideram em taxa; evento lidera
-- em valor absoluto. Amostra pequena por tema (2 a 6 posts).


-- 4. Engajamento por tipo de post
SELECT tipo_post,
       COUNT(*) AS n_posts,
       COUNT(taxa_engajamento) AS n_com_taxa,
       ROUND(AVG(engajamento), 1) AS engajamento_medio_absoluto,
       ROUND(AVG(taxa_engajamento), 4) AS taxa_engajamento_media
FROM posts
GROUP BY tipo_post
ORDER BY taxa_engajamento_media DESC;
-- Resultado: reels lidera (27.3), com vantagem pequena. Só 3 reels na base.


-- 5. Alcance médio por tipo de post
SELECT tipo_post,
       COUNT(*) AS n_posts,
       COUNT(alcance) AS n_com_alcance,
       ROUND(AVG(alcance), 1) AS alcance_medio
FROM posts
GROUP BY tipo_post
ORDER BY alcance_medio DESC;
-- Resultado: reels (344.5) > carrossel (203.9) > imagem (98.3).
-- reels tem n_com_alcance=2 de 3 posts — média vem de base bem pequena.


-- 6. Volume de posts por mês
SELECT strftime('%Y-%m', data) AS mes,
       COUNT(*) AS n_posts
FROM posts
GROUP BY mes
ORDER BY mes;
-- Resultado: cadência irregular — março concentrou 5 posts, depois
-- caiu para 1/mês em abril e maio.


-- 7. Temas recorrentes (mais de 2 posts)
SELECT tema, COUNT(post_id) AS contagem
FROM posts
GROUP BY tema
HAVING COUNT(post_id) > 2;
-- Resultado: educacional (6), evento (4), institucional (3).
-- Nota: usar COUNT(post_id) direto no HAVING (em vez do apelido
-- "contagem") é mais portável entre bancos diferentes.


-- 8. Posts com taxa de engajamento acima da média geral
SELECT post_id, conta, tema, taxa_engajamento
FROM posts
WHERE taxa_engajamento > (SELECT AVG(taxa_engajamento) FROM posts)
ORDER BY taxa_engajamento DESC;
-- Resultado: 7 posts acima da média (0.0844) — 17, 3, 16, 4, 5, 19, 13.
-- Ver sql/erros_e_correcoes.sql para as duas tentativas anteriores
-- que pareciam certas mas calculavam algo diferente do pedido.
