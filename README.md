# Billinho

Neste repositório, temos o projeto desenvolvido durante o Onboarding para o 
time de Suporte Graduação. O projeto consiste em uma versão miniaturizada do 
produto Quero Pago, simulando uma API de gerenciamento das mensalidades pagas 
pelos alunos à instituição de ensino que ele estuda.

## Tabelas de Conteúdo

1.  [Instalação](#instalação)

    1.1.    [Pré-requisitos](#pré-requisitos)
    
    1.2.    [Configurando o ambiente](#configurando-o-ambiente)

2.  [Rodando a aplicação](#rodando-a-aplicação)

3.  [Funcionalidades](#funcionalidades)

    3.1.    [Criação (Método POST)](#criação)

    3.2.    [Listagem (Método GET)](#listagem)

## Instalação 

### Pré-requisitos

Para rodar esse projeto localmente, é necessário que a máquina tenha previamente 
instaladas algumas ferramentas e softwares, sendo: 

- Ruby

- Ruby on Rails

- PostgreSQL

- Postman (ou software semelhante, como Insomnia)

### Configurando o ambiente

Com os pré-requisitos instalados localmente, é necessário seguir os passos a seguir:

1. **Criar pasta para a aplicação:**

```
mkdir billinho_api
```

2. **Mudar o diretório no terminal:**

```
cd billinho_api
```

3. **Clonar o repositório:**

```
git clone https://github.com/gaschrader/billinho.git
```

4. **Instalar dependências:**

```
bundle install
```

5. **Iniciar o banco de dados, fazer as migrações e, opcionalmente, popular as tabelas:**

```
rails db:create
rails db:migrate
rails db:seed
```

Após esses passos, temos toda a configuração de ambiente feita, e a sua máquina agora está preparada para rodar a aplicação, que será mostrada na seção seguinte.

## Rodando a aplicação

Para rodar a aplicação, você primeiro precisa se assegurar de que está com o terminal aberto no local correto da aplicação, para isso, basta utilizar o seguinte comando:

```
cd caminho_da_aplicacao
```

Agora que o terminal está aberto no local correto, podemos agora usar o código a seguir: 

```ruby
rails server
```

Com esse comando, o servidor da aplicação é aberto e será possível utilizar todas as *features* disponíveis.

Agora, podemos finalmente abrir o software *Postman* e realizar as requisições desejadas para nossa API. Caso você não conheça o *software*, este [link](https://learning.postman.com/docs/introduction/overview/) te leva ao site que apresenta uma visão geral da ferramenta e sua documentação.

## Funcionalidades

Nesta seção, é mostrado como chamar e usar cada uma das funcionalidades presentes na aplicação.

A API desenvolvida neste projeto possui as seguintes funcionalidades:

- Listagem e criação de Instituições de Ensino;
- Listagem e criação de Alunos;
- Listagem e criação de Matrículas;
- Listagem e criação de Faturas;
- Listagem de Faturas para uma determinada Matrícula.

Algo que vale pontuar é que nesta aplicação utilizamos o estilo de arquitetura REST. Desta forma, a aplicação compreende os seguintes métodos HTTP: GET, POST, PUT, PATCH e DELETE. Apesar disso, será mostrado aqui apenas como usar os métodos GET e POST, que são os essenciais da aplicação.

<ins>Obs</ins>: Ao usar as funcionalidades disponíveis, atente-se às restrições impostas para cada ação possível. Além disso, não se esqueça de que a aplicação precisa estar rodando.

### Criação

Para criar um objeto em alguma tabela, basta utilizar o método POST no *Postman*, passando no *body* da requisição os parâmetros desejados. No *body*, é necessário escolher a opção *"raw"* e inserir na caixa de texto os parâmetros no formato JSON, com as chaves e os valores todos entre aspas duplas. 

Nesta operação, é estritamente necessário que o *body* apresente o nome dos atributos corretamente, além de respeitar as restrições e os tipos de dados passados para cada um dos atributos que compõem o objeto. Caso os atributos não sejam passados devidamente, o retorno da resposta do método retornará erro e o *status code* do erro. Caso queira saber dos códigos HTTP, veja neste [link](https://www.httpstatus.com.br/).

O formato do método POST, no *Postman*, é dessa maneira:

```
POST http://localhost:3000/api/v1/nome_entidade
```

Lembrando sempre de passar os parâmetros do método no *body* da requisição, com notação JSON, como segue abaixo:

```json
{
    "atributo1": "valor_atributo1",
    "atributo2": "valor_atributo2",
    "atributoN": "valor_atributoN"
}
```

### Listagem

A listagem é realmente simples de ser feita, podendo ser de dois tipos: listagem geral de uma tabela - retorna todos os elementos -, ou listagem específica - retorna um objeto específico da tabela. Para realizar tal operação, basta selecionar o método GET, no *Postman*, e inserir a URL desejada.

Para uma listagem geral, a URL tem o seguinte formato:

```
GET http://localhost:3000/api/v1/nome_entidade
```

As entidades que podem ser listadas são: *institutions*, *students*, *enrollments* e *bills*.

No caso de uma listagem específica, temos o seguinte URL:

```
GET http://localhost:3000/api/v1/nome_entidade/:id
```

Existe também, no caso da listagem específica, um modo de listar todas as Faturas relacionadas a uma Matrícula, que possui o seguinte formato:

```
GET http://localhost:3000/api/v1/enrollments/:id/bills
```