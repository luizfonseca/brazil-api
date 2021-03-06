Brazil API
==========

Validação de dados via API usando HTTPS (importante se você estiver usando SSL). Ao invés de você inserir 2 libs pra verificar, você pode fazer um requisição a API. :)




Build Status
------------
[![Build Status](https://travis-ci.org/runeroniek/brazil-api.png?branch=master)](https://travis-ci.org/runeroniek/brazil-api) [![Code Climate](https://codeclimate.com/badge.png)](https://codeclimate.com/github/runeroniek/brazil-api)





___

Colabore!
---------

Escrevi isto pra ser open-source! Se você tem novas ideias de validações (ou até uma lib JS mínima que faça esses checks - ops!), abra um issue/envie um pull request! Só tenha certeza de que os testes passem (o que significa que você tem que escrever se implementar algo). 

**Sinta-se livre para fazer o que quiser com o projeto.**

____

O que você vai precisar?
------------------------

O que eu utilizei pra fazer a API? A lista do que você vai precisar pra rodar é a seguinte:

**Se você NÃO conhece ruby nem rails**
- Aqui tem um guia bem legal: http://www.maujor.com/railsgirlsguide/install.php


**Se você já conhece Ruby on Rails:**
- Ruby 1.9.3
- GIT
- Sinatra

**Após instalar Ruby & GIT**

- Clone o repositório: `git clone git://github.com/runeroniek/brazil-api` e entre no diretório /brazil-api
- Instale o sinatra: (`gem install sinatra`)
- Dentro do diretório da api, rode o comando `bundle install`
- Para rodar o servidor, use `shotgun api.rb`
- Pronto, a api está rodando no teu servidor local! Cheque a URL (geralmente `http://localhost:9393`)

**Para adicionar novas validações**

- Crie um teste para a validação no diretório `spec/`, seguindo o seguinte padrão: `validator_SUAVALIDACAO_spec.rb`
- Escreva os testes, antes de criar a validação e rode-os (os testes) usando `rspec spec`.
- Veja os testes falhar (já que não há implementação ainda) e aí sim: crie seu validador em `lib/validators/SUAVALIDACAO.rb`
- Faça um require da sua validação no arquivo `lib/validator.rb` ( algo como `require 'validators/SUAVALIDACAO'` )
- Certifique-se que sua validação possui o método `def as_json`, siga os exemplos dos outros validadores.
- Adicione a query string na classe que está em `lib/response.rb`, seguindo o mesmo formato. 
- Pronto, só fazer a validação na URL. Pode ficar assim: `http://localhost:9393/?validacao=SUA_VALIDACAO`.

___

Validações que já foram implementadas
-------------------

**Obs.:**  *Substitua XXX pelo valor que quiser checar*

**Busca por CEP**

**Exemplo:** Requisição GET para ```https://brazilapi.herokuapp.com/api?cep=XXX```
A resposta será um JSON se o CEP for válido e existir (no caso abaixo, utilizei o CEP `78132-500`:

```json
[{
  "cep": 
    {
      "valid":true,
      "result":true,
      "data":
        {
          "id": "4785",
          "cidade": "Várzea Grande",
          "logradouro": "Nove",
          "bairro": "Cohab Sete de Maio",
          "cep": "78132-500",
          "tp_logradouro": "Rua",
          "cidade_sem_acento": "varzea grande",
          "uf": "mt"
        },
      "message":""
    }
}]
```


**Validação de CPF**
**Exemplo:** Requisição GET para  ```https://brazilapi.herokuapp.com/api?cpf=XXX```
A resposta será um JSON:

```json
[{
  "cpf":
    {
      "valid": true,
      "value": "11111111111"
    }
  }]
```

**Validação de Email**
**Exemplo:** Requisição GET para ```https://brazilapi.herokuapp.com/api?email=XXX```
A resposta será um JSON:

```json
[{
  "email":
    {
      "valid": true,
      "value": "exemplo@provedor.com.br"
    }
  }]
```

**Verificar todos os anteriores**
**Exemplo:** Você pode usar todos os anteriores se quiser validar tudo de uma vez:
Requisição GET para ```https://brazilapi.herokuapp.com/api?email=XXXX&cep=XXX&cpf=XXX`

A resposta será um JSON com a união de todos os anteriores:

```json
[
  {
    "email":
      {
        "valid": true,
        "value":"exemplo@provedor.com.br"
      }
  },
  
  {
    "cep":
      {
        "valid": true,
        "result": true,
        "data":
          {
            "DADOS DO CEP"
          }
      }
  },
  
  {
    "cpf":
      {
        "valid": true,
        "value": "11111111111"
      }
  }]

```

