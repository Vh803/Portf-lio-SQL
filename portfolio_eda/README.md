# Análise de Performance de Conteúdo — Instagram FCX (Excel + SQL)

Projeto de portfólio: pipeline de análise de dados de marketing a partir
de posts do Instagram, usando Excel e SQL como ferramentas principais.
Estrutura pensada para ser replicável com a base de outros clientes.

## Pergunta de negócio
Quais características de conteúdo (tema, formato) geram mais alcance e
engajamento no Instagram de um escritório de consultoria?

## Stack (fase atual)
Excel (limpeza + Tabelas Dinâmicas) → SQLite (armazenamento/consulta)

## Estrutura do projeto
```
data/       -> posts.csv (dado limpo, pronto para carga)
sql/        -> schema.sql (estrutura da tabela)
            -> analysis_queries.sql (as 8 consultas de negócio finais, documentadas)
            -> erros_e_correcoes.sql (tentativas erradas e o raciocínio da correção)
            -> full_dump.sql (dump completo para importar em qualquer SQLite)
excel/      -> analise_instagram_fcx.xlsx (Tabelas Dinâmicas respondendo as mesmas
               perguntas de negócio, com aba índice "Perguntas e respostas")
```

## Perguntas respondidas e resultado (SQL)

| Pergunta | Resposta | Ressalva |
|---|---|---|
| Top 5 posts por engajamento | Posts 1, 15, 3, 2, 11 | — |
| Desempenho por conta | conta_B 43 / conta_C 27 / conta_A 15 | conta_B e conta_C têm 1-2 posts só |
| Quais temas têm melhor engajamento? | Jurídico e institucional lideram em taxa; evento lidera em valor absoluto | Amostra pequena por tema (2-6 posts) |
| Quais tipos de post têm mais engajamento? | Reels, com vantagem pequena sobre carrossel/imagem | Só 3 reels na base |
| Qual o alcance médio
