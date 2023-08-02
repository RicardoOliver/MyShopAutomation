# language: pt
# encoding: utf-8
@Regressao @login
Funcionalidade: Acessar conta

Ao acessar a página de login, o usuário deve ser capaz de criar uma conta com sucesso.

Contexto: Acessar conta
Dado que eu estou na página de login

Cenario: Acessar conta com sucesso
Quando  eu insiro o email validos com sucesso
E clico no botão de create an account
Então eu visualizo a página de cadastro