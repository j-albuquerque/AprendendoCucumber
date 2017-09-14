# language: pt

Funcionalidade: Aprendendo a usar o Cucumber com Ruby no UOL
    Começando a usar Cucumber

Cenario: Pesquisar Queijo
    Dado que eu acesse o "http://www.google.com.br"
    Quando pesquisar "Queijo"
    Então o titulo da página deve ser "Queijo - Pesquisa Google"

Cenario: Pesquisar Carne
    Dado que eu acesse o "http://www.google.com.br"
    Quando pesquisar "Carnee"
    Então o titulo da página deve ser "Carne - Pesquisa Google"