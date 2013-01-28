Brazil API
==========

Data validation through an API. I made this to be able to use a HTTPS validation tool. 
And because you don't need to add 5 javascripts to handle simple validations in the client-side. : )

Build Status
------------
[![Build Status](https://travis-ci.org/runeroniek/brazil-api.png?branch=master)](https://travis-ci.org/runeroniek/brazil-api)


Colaborate!
-----------

I wrote this to be open! If you have and need any new validation, open an issue and send a pull request! Just make sure the things are all-green :)
*Feel free to do anything you want with this!*


Current Implemented Validations
-------------------

* CEP
  `GET https://brazilapi.herokuapp.com/api?cep=78132-500`

* CPF
  `GET https://brazilapi.herokuapp.com/api?cpf=111.111.111-11`

* Email
  `GET https://brazilapi.herokuapp.com/api?email=exemplo@provedor.com.br`

* Validation with email, cpf and cep
  `GET https://brazilapi.herokuapp.com/api?email=exemplo@provedor.com.br&cep=78132-500`




