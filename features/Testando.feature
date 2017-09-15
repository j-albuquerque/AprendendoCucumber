# encoding: utf-8
# language: pt

Funcionalidade: Aprendendo a usar o Cucumber com Ruby
    Acesso a páginas do google para realizar pesquisa e login no gemail

Cenario: Pesquisar Queijo
    Dado que eu acesse o "http://www.google.com.br"
    Quando pesquisar "Queijo"
    Então o titulo da página deve ser "Queijo - Pesquisa Google"

Cenario: Acessar Gmail
    Dado que eu acesse o "http://www.google.com.br"
    Quando selecionar a opção Gmail
    Então o titulo da página deve ser "Gmail"

Cenario: Enviar E-mail
    Dado que eu acesse o "http://www.google.com.br"
    Quando selecionar a opção Gmail
    E logar na conta de e-mail
    E selecionar a opção Escrever
    E preencher destinatário, assunto e corpo do e-mail
    Entao deve exibir uma mensagem de enviado ao enviar o e-mail