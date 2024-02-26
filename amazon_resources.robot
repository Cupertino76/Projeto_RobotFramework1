*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}                              https://www.amazon.com.br/ 
${LIVROS}                           //a[@href='/Livros/b/?ie=UTF8&node=6740748011&ref_=nav_cs_books'][contains(.,'Livros')]
${HEADER_LIVROS}                    //h2[contains(.,'Loja de Livros')]
${NOME_CATEGORIA}                   //img[contains(@alt,'Mais vendidos')]
${BUSCA}                            twotabsearchtextbox 
${BOTÃO}                            nav-search-submit-button
${IMAGEM}                           //img[@alt='Vai dar tudo certo']
${ADICIONAR}                         add-to-cart-button
${CARRINHO}                          nav-cart
${FECHAR_PEDIDO}                     proceedToRetailCheckout
${EMAIL}                             //input[@type='email'][contains(@id,'email')]

*** Keywords ***
Abrir o navegador
    Open Browser                     browser=chrome
    Maximize Browser Window
        
Fechar o navegador
    Close Browser

Acessar a home page do site Amazon.com.br
    Go To                             url=${URL} 
    Wait Until Element Is Visible     locator=${LIVROS}  

Entrar no menu "Livros"
    Click Element                      locator=${LIVROS} 
    
    
Verificar se aparece a frase "${TEXTO}"
    Wait Until Page Contains           text=${TEXTO}  
    Wait Until Element Is Visible      locator=${HEADER_LIVROS}
    

Verificar se o título da página fica "${TITULO_PAGE}"
    Title Should Be                     title=${TITULO_PAGE}
    

Verificar se aparece a categoria "Mais vendidos"
    Element Should Be Visible           locator=${NOME_CATEGORIA}
    Capture Page Screenshot

Digitar o nome de produto "${PRODUTO}" no campo de pesquisa
    Input Text                          locator=${BUSCA}    text=${PRODUTO}
    Capture Page Screenshot
Clicar no botão de pesquisa
    Click Element                       locator=${BOTÃO}
    Capture Page Screenshot

Clicar na Imagem
    Click Element                        locator=${IMAGEM} 
    Capture Page Screenshot

Adicinar o Livro no Carrinho
    Click Button                         locator=${ADICIONAR}
    Capture Page Screenshot

Verificar o carrinho
    Click Element                        locator=${CARRINHO} 
    Capture Page Screenshot
Fechar o Pedido
    Click Button                          locator=${FECHAR_PEDIDO}    
    Sleep    5
    Capture Page Screenshot


