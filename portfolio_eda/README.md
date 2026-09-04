# Análise de Performance de Conteúdo — Instagram (Excel + SQL)

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
data/       -> posts_dados.csv (dado limpo, pronto para carga)
sql/        -> schema.sql (estrutura da tabela)
            -> analysis_queries.sql (as 8 consultas de negócio finais, documentadas)
            -> erros_e_correcoes.sql (tentativas erradas e o raciocínio da correção)
            -> full_dump.sql (dump completo para importar em qualquer SQLite)
excel/      -> tabeladinamica_queries.xlsx (Tabelas Dinâmicas respondendo as mesmas
               perguntas de negócio, com aba índice "Perguntas e respostas")
```

## Perguntas respondidas e resultado (SQL)

| Pergunta | Resposta | Ressalva |
|---|---|---|
| Top 5 posts por engajamento | Posts 1, 15, 3, 2, 11 | — |
| Desempenho por conta | conta_B 43 / conta_C 27 / conta_A 15 | conta_B e conta_C têm 1-2 posts só |
| Quais temas têm melhor engajamento? | Jurídico e institucional lideram em taxa; evento lidera em valor absoluto | Amostra pequena por tema (2-6 posts) |
| Quais tipos de post têm mais engajamento? | Reels, com vantagem pequena sobre carrossel/imagem | Só 3 reels na base |
| Qual o alcance médio por tipo de post? | Reels (344) > Carrossel (204) > Imagem (98) | — |
| Quais tipos de post trazem mais seguidores? | Dado insuficiente (2 seguidores ganhos em 19 posts) | Não é possível concluir com esta amostra |
| Volume de posts por mês | Cadência irregular (5 posts em março, 1/mês em abril-maio) | — |
| Temas recorrentes (>2 posts) | Educacional (6), evento (4), institucional (3) | — |
| Posts acima da média de taxa de engajamento | 7 posts: 17, 3, 16, 4, 5, 19, 13 | Ver `sql/erros_e_correcoes.sql` para o processo até a query certa |

## Perguntas respondidas no Excel (Tabelas Dinâmicas)
Mesmas perguntas de negócio, resolvidas com Tabela Dinâmica em vez de SQL —
os números batem exatamente com a tabela acima.

| Pergunta | Método | Nota |
|---|---|---|
| Top 5 posts por engajamento | Filtro nativo "Top 5" na Tabela Dinâmica | Dinâmico — recalcula sozinho se a base mudar |
| Desempenho por conta | Tabela Dinâmica (Contagem + Média) | conta_B e conta_C têm 1-2 posts só |
| Engajamento por tema/tipo, alcance por tipo | Tabela Dinâmica (Média) | — |
| Temas recorrentes (>2 posts) | Tabela Dinâmica (Contagem) | — |
| Posts acima da média de taxa de engajamento | Filtro de valor "Maior que" | Valor da média (0,0844) digitado à mão — não recalcula sozinho se a base mudar |

## Processo de aprendizado
O arquivo `sql/erros_e_correcoes.sql` documenta duas tentativas que
pareciam corretas (rodavam sem erro, até davam o resultado certo por
coincidência) mas tinham um problema estrutural na lógica — por exemplo,
usar `GROUP BY post_id` para tentar calcular uma média, quando cada
grupo tinha 1 linha só. Mantido de propósito para mostrar o raciocínio,
não só a resposta final.

## Anonimização
Este projeto usa métricas reais das redes sociais, com autorização prévia. 
Os nomes de conta foram trocados por rótulos genéricos (`conta_A`, `conta_B`, `conta_C`) 
e a coluna `link` (que identificava a conta publicamente) foi removida — em `data/posts.csv`
e em `excel/analise_instagram_fcx.xlsx`. Números, temas e tipos de post
permanecem exatamente como no dado original.

## Limitações da base atual
- 19 posts é uma amostra pequena para conclusões estatísticas fortes.
- `alcance`, `seguidores` e `taxa_engajamento` só estão disponíveis para
  a conta `conta_A` (16 dos 19 posts).
- Resultados devem ser lidos como direção, não como fato estabelecido —
  a análise vai ganhar confiabilidade conforme mais posts entrarem na base.

## Próximas fases
Este projeto está sendo construído em etapas, publicadas conforme ficam
prontas:
- [x] Fase 1 — Excel (limpeza + Tabelas Dinâmicas)
- [x] Fase 1 — SQL (schema, consultas de negócio, correções documentadas)
- [ ] Fase 2 — Python (EDA com pandas, notebook comentado)
- [ ] Fase 3 — Power BI (dashboard conectado ao banco SQL)
- [ ] Fase 4 — Parametrizar para reuso com a base de outros clientes
