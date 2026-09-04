-- Schema da tabela principal do projeto.
-- Dados anonimizados: nomes de conta trocados por rótulos genéricos
-- (conta_A/B/C) e coluna `link` (identificava a conta publicamente)
-- removida. Números e temas mantidos como no dado original.

CREATE TABLE posts (
    post_id INTEGER,
    data TEXT,
    hora TEXT,
    conta TEXT,
    tipo_post TEXT,
    tema TEXT,
    visualizacoes INTEGER,
    alcance REAL,
    curtida INTEGER,
    comentarios INTEGER,
    compartilhamentos INTEGER,
    salvamentos INTEGER,
    seguidores REAL,
    engajamento INTEGER,
    taxa_engajamento REAL
);
