Brazil API
==========

Validação de dados via API usando HTTPS (importante se você estiver usando SSL). Ao invés de você inserir 2 libs pra verificar, você pode fazer um requisição a API. :)




Build Status
------------
[![Build Status](https://travis-ci.org/runeroniek/brazil-api.png?branch=master)](https://travis-ci.org/runeroniek/brazil-api) [![Code Climate](https://codeclimate.com/badge.png)](https://codeclimate.com/github/runeroniek/brazil-api)




Colabore!
---------

Escrevi isto pra ser open-source! Se você tem novas ideias de validações (ou até uma lib JS mínima que faça esses checks - ops!), abra um issue/envie um pull request! Só tenha certeza de que os testes passem (o que significa que você tem que escrever se implementar algo). 

**Sinta-se livre para fazer o que quiser com o projeto.**




Validações que já foram implementadas
-------------------

* **Obs.:**  Substitua XXX pelo valor que quiser checar *

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


** Validação de CPF **
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

** Validação de Email **
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

** Verificar todos os anteriores **
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

