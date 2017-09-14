require 'selenium-webdriver'
require 'rspec/expectations'

#Inicia o navegador e acessa página de pesquisa do Google
Dado (/^que eu acesse o "(.*)"$/) do |url|
    @browser = Selenium::WebDriver.for :chrome
    @browser.get url
end

#Insere um dado no campo de busca e realiza a busca
Quando (/^pesquisar "(.*)"$/) do |pesquisa| 
    element = @browser.find_element :name => "q"
    element.send_keys(pesquisa)
    element.send_keys :enter
end

#Verifica se a página de resultato tem o título do dado
#pesquisado + " - Pesquisa Google"
Entao (/^o titulo da página deve ser "(.*)"$/) do |titlepage| 
    titulo = @browser.title
    expect(titulo).to eq(titlepage)
end
