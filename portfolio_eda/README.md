# Análise de Performance de Conteúdo — Instagram FCX

Projeto de portfólio: pipeline completo de análise de dados de marketing,
da planilha bruta ao dashboard, usando Excel, SQL, Python e Power BI.
Estrutura pensada para ser replicável com a base de outros clientes.

## Pergunta de negócio
Quais características de conteúdo (tema, formato) geram mais alcance e
engajamento no Instagram de um escritório de consultoria?

## Stack
Excel (limpeza) → SQLite (armazenamento/consulta) → Python/pandas (EDA) → Power BI (dashboard)

## Estrutura do projeto
```
data/       -> posts.csv (dado limpo, pronto para carga)
sql/        -> schema.sql (estrutura da tabela)
            -> analysis_queries.sql (as 8 consultas de negócio finais, documentadas)
            -> erros_e_correcoes.sql (tentativas erradas e o raciocínio da correção)
            -> full_dump.sql (dump completo para importar em qualquer SQLite)
notebooks/  -> EDA em Python (pandas, correlações, séries temporais)
dashboard/  -> arquivo Power BI (.pbix)
```

## Perguntas respondidas e resultado

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

## Processo de aprendizado
O arquivo `sql/erros_e_correcoes.sql` documenta duas tentativas que
pareciam corretas (rodavam sem erro, até davam o resultado certo por
coincidência) mas tinham um problema estrutural na lógica — por exemplo,
usar `GROUP BY post_id` para tentar calcular uma média, quando cada
grupo tinha 1 linha só. Mantido de propósito para mostrar o raciocínio,
não só a resposta final.

## Anonimização
Este projeto usa métricas reais das redes sociais da empresa onde
trabalho. Para publicação, os nomes de conta foram trocados por
rótulos genéricos (`conta_A`, `conta_B`, `conta_C`) e a coluna `link`
(que identificava a conta publicamente) foi removida. Números,
temas e tipos de post permanecem exatamente como no dado original.

## Limitações da base atual
- 19 posts é uma amostra pequena para conclusões estatísticas fortes.
- `alcance`, `seguidores` e `taxa_engajamento` só estão disponíveis para
  a conta `fcxconsultoria` (16 dos 19 posts).
- Resultados devem ser lidos como direção, não como fato estabelecido —
  a análise vai ganhar confiabilidade conforme mais posts entrarem na base.

## Próximos passos
- Repetir a extração mensalmente para aumentar a amostra.
- Adaptar o schema para receber a base de outro cliente (parametrizar
  nome de conta/tema).
