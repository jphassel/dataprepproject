# Projeto de Preparação e Transformação de Dados
---
## Equipe
João Pedro <br>
Kayque Mendes <br>
Laís Caniato

---
## Descrição
Este projeto contempla um caso de avaliação da disciplina de Data Preparation & Transformation, do curso de MBA em Engenharia de Dados, onde desenvolvemos um fluxo de preparação e transformação de um conjunto de dados brutos, extraído do Kaggle (https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce), que traz dados da rede de comércio digital Olist. Esse fluxo irá descrever desde a extração desses dados, disponibilizados em um arquivo compactado contendo diversos arquivos do tipo "csv", fornecendo dados de vendas, pedidos, produtos, entre outros, dessa rede de comércio, até a transformação, onde realizamos a definição de modelos lógicos e a unificação desses dados.
### Ferramentas utilizadas
Utilizamos o SQL para a definição de tabelas principais, como a tabela de dados transacional "transacional.sql", "wide.sql" e "star.sql", e também para definir os fluxos de carregamentos de dados.
Para a realização dos diagramas de modelos lógicos, como o Star Schema, e do fluxo geral do projeto, utilizamos o Draw.Io (https://app.diagrams.net).

---
## Primeira Etapa
Para a primeira etapa do projeto, foi realizada a criação do banco de dados transicional, baseado na documentação fornecida junto com os dados brutos da rede Olist. Esse banco de dados transacional foi nomeado de "transacional.sql", contemplando as tabelas que serão utilizadas na próxima etapa, onde definimos os modelos Wide Table e Star Schema. Também foi realizado um fluxo de dados para que o carregamento de dados desse banco de dados fosse possível.
```sql
BULK INSERT dbo.olist_customers_dataset
FROM 'C:\Users\jpsha\Downloads\archive\olist_customers_dataset.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2
);

BULK INSERT dbo.olist_order_items_dataset
FROM 'C:\Users\jpsha\Downloads\archive\olist_order_items_dataset.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2
);

BULK INSERT dbo.olist_orders_dataset
FROM 'C:\Users\jpsha\Downloads\archive\olist_orders_dataset.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2
);

BULK INSERT dbo.olist_products_dataset
FROM 'C:\Users\jpsha\Downloads\archive\olist_products_dataset.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2
);

BULK INSERT dbo.olist_sellers_dataset
FROM 'C:\Users\jpsha\Downloads\archive\olist_sellers_dataset.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2
);
```

---
## Segunda Etapa
Partindo para a segunda etapa, foram realizadas as criações dos modelos lógicos e físicos do tipo "Star Schema" e "Wide Table" utilizando a ferramenta para criação de diagramas online, Draw.Io, e a própria linguagem SQL, respectivamente.

O modelo lógico Star Schema foi construído da seguinte maneira:
### Modelo Star Schema

![star_schema drawio (1)](https://github.com/user-attachments/assets/ab4882aa-d203-428c-bd58-27332e467bbb)

A tabela "FactSales" se encontra no centro do modelo pelo fato de se relacionar com todas as demais tabelas, contendo pelo menos uma chave estrangeira de cada tabela dimensão dentro do modelo.

### Modelo Wide Table
O modelo físico Wide Table foi contemplado dentro do arquivo nomeado de "wide.sql", presente anexo neste repositório, onde unificamos dados de diversas tabelas presentes no banco de dados em uma só tabela, contendo informações de produtos, consumidores, vendedores, datas, etc.
```sql
CREATE TABLE [dbo].[wide_sales](
	[sales_id] [int] IDENTITY(1,1) NOT NULL,
	[year] [int] NULL,
	[month] [int] NULL,
	[product_id] [varchar](33) NULL,
	[product_category_name] [varchar](100) NULL,
	[customer_id] [varchar](33) NULL,
	[customer_city] [varchar](30) NULL,
	[customer_state] [char](2) NULL,
	[seller_id] [varchar](33) NULL,
	[seller_city] [varchar](30) NULL,
	[seller_state] [char](2) NULL,
	[price] [money] NULL,
	[freight_value] [money] NULL,
PRIMARY KEY CLUSTERED 
(
	[sales_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
```
---
## Terceira Etapa
Nessa etapa foi criado um fluxo, que aborda desde o início da coleta de dados bruta no arquivo compactado disponibilizado pelo Kaggle, até a definição dos modelos Wide Table e Star Schema.

![fluxo_dados drawio](https://github.com/user-attachments/assets/abb2422a-f1b0-4c9b-9d35-ce925e1bb73d)

Os arquivos do tipo "sql" anexos no repositório já contém os fluxos de carregamentos de dados, transformação das tabelas dimensão e fato, todas descritas no próprio código e realizadas utilizando somente a linguagem SQL.

---
## Quarta Etapa
Para a última etapa do projeto, será necessário decidir entre as abordagens Batch (lotes), Micro-Batch (lotes menores), e Fluxo Contínuo (conhecido como streaming). Levando em conta os dados que foram selecionados nos dois modelos finais, Star Schema e Wide Table, a abordagem de tempestividade dos dados mais adequada seria a de Streaming, visto que esses dados relacionados a vendas, produtos, etc. podem ser determinantes para uma equipe de negócios tomar uma decisão em cima desses dados. Traremos mais pontos positivos e negativos relacionados a essa decisão quanto a abordagem:
### Pontos positivos
1. Atualizações em Tempo Real <br>
Processa e entrega dados em tempo real, possibilitando análises e monitoramento desses dados.
2. Eficiência no Processamento Contínuo <br>
Fornece dados de maneira contínua sem a necessidade de aguardar grandes ou pequenos lotes.
3. Escalabilidade <br>
Devido a necessidade de infraestrutura dedicada, como o Kafka, torna o sistema altamente escalável para lidar com grandes quantidades de dados.

### Pontos negativos
1. Complexidade <br>
Também devido a necessidade da infraestrutura dedicada, torna o processo mais complexo de ser implementado.
2. Custos <br>
Seria necessário utilizar muito mais recursos para fornecer essa infraestrutura para o sistema, tornando-o mais custoso no final.
3. Estado dos dados <br>
Por conta do fornecimento de dados contínuo, fica difícil monitorar o estado e comportamento desses dados, tornando-o mais suscetível a falhas no futuro.
---
