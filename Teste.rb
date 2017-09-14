require 'selenium-webdriver'
require 'rspec/expectations'

    pesq = "Queijo"
    titulo = pesq+" - Pesquisa Google"

    browser = Selenium::WebDriver.for :chrome
    browser.get "http://google.com.br"

    element = browser.find_element :name => "q"
    element.send_keys pesq
    element.send_keys :enter

    titlepage = browser.title

    if titlepage == titulo
        puts "O teste passou!"
    else
        puts "O teste FALHOU!"
    end