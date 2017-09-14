require 'selenium-webdriver'
require 'rspec/expectations'

#@pesq = "Queijo"
#@titlepage = @pesq+" - Pesquisa Google"

Dado (/^que eu acesse o "(.*)"$/) do |url|
    @browser = Selenium::WebDriver.for :chrome
    @browser.get url
end

#When (/^pesquisar Queijo$/) do
Quando (/^pesquisar "(.*)"$/) do |pesquisa| 
    element = @browser.find_element :name => "q"
    element.send_keys(pesquisa)
    element.send_keys :enter
end

#Then (/^o titulo da página deve ser Queijo - Pesquisa Google$/) do 
Então (/^o titulo da página deve ser "(.*)"$/) do |titlepage| 
    titulo = @browser.title
    expect(titulo).to eq(titlepage)
end
