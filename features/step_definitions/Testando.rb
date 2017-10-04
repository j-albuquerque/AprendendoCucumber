require 'selenium-webdriver'
require 'rspec/expectations'

#Inicia o navegador e acessa página de pesquisa do Google
Dado (/^que eu acesse o "(.*)"$/) do |url|
    @browser = Selenium::WebDriver.for :chrome
    @browser.get url
end

#Insere um dado no campo de busca e realiza a busca
Quando (/^pesquisar "(.*)"$/) do |pesquisa| 
    #element = @browser.find_element :name => "q"
    element = @browser.find_element(:name, "q")
    element.send_keys(pesquisa)
    element.send_keys :enter
end

#Verifica se a página de resultato tem o título do dado
#pesquisado + " - Pesquisa Google"
Entao (/^o titulo da página deve ser "(.*)"$/) do |titlepage| 
    titulo = @browser.title
    expect(titulo).to eq(titlepage)
    @browser.close
end

Quando (/^selecionar a opção Gmail$/) do
    #Encrontra a opção Gmail e faz o click
    element = @browser.find_element(:link, "Gmail")
    element.click
end

E (/^logar na conta de e-mail$/) do
    #Usuário senha invalidos, deve ser alterado antes de rodar o teste
    user = "teste@gmail.com"
    pass = "teste2017"
    
    #Insere o usuário e clica em "Próxima" para fazer o login 
    #e espera 2 segundos para realizar a próxima ação
    usuario = @browser.find_element(:name, "identifier")
    usuario.send_keys(user)
    @browser.find_element(:css, "span.RveJvd.snByac").click
    sleep 2

    #Insere a senha e clica em "Próxima" para fazer o login
    senha = @browser.find_element(:name, "password")
    senha.send_keys(pass)
    @browser.find_element(:css, "span.RveJvd.snByac").click
end

E (/^selecionar a opção Escrever$/) do
    #Espera 2 segundos para carregar a caixa de entrada e então clicar em escrever
    sleep 2
    element = @browser.find_element(:id, ":yg")
    element.click

end

E (/^preencher destinatário, assunto e corpo do e-mail$/) do
    #Preenchendo destinatário
    destino = @browser.find_element(:name, "to")
    destino.send_keys("teste@email.com.br")

    #Preenchendo o assunto
    assunto = @browser.find_element(:name, "subjectbox")
    assunto.send_keys("Testando Cucumber")

    #Preenchendo o corpo da mensagem
    msg = @browser.find_element(:css, ".editable")
    msg.send_keys("Testando o Cucumber e usando Ruby para isso.")
end
    
Entao (/^deve exibir uma mensagem de enviado ao enviar o e-mail$/) do
    #Clica em enviar
    @browser.find_element(:css, ".editable").send_keys [:control, :enter]
    
end



=begin
Quando(/^ativar o hover do menu "(.*)"$/) do |menu|
    @browser.link(:text, menu).hover
    find(:css, 'a[title="Voltar ao topo"]').hover
    sleep 2
end
Então(/^viasualizo o header com a opção$/) do #|option|
    #element = @browser.li(:text, option)
    #element.click
    #expect(element).to eq.(option)
    #element = page.find('a', :text => option)
    find('li', :text => "Assine").hover
    sleep 2
    Capybara.current_session.driver.quit 
end
=end