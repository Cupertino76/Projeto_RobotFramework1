*** Settings ***
Documentation   Essa suite testa o site da Amazon.com.br
Resource        amazon_resources.robot
Test Setup      Abrir o navegador
Test Teardown   Fechar o navegador

*** Test Cases ***
Caso de Teste 01 - Acesso ao menu "Eletrônicos"
    [Documentation]    Esse teste verifica o menu Livros do site da Amazon.com.br
    ...                e verifica a categoria Mias vendidos
    [Tags]             menus    categorias
    Acessar a home page do site Amazon.com.br
    Entrar no menu "Livros"
    Verificar se aparece a frase "Loja de Livros"
    Verificar se o título da página fica "Livros | Amazon.com.br"
    Verificar se aparece a categoria "Mais vendidos"

Caso de Teste 02 - Pesquisa de um Produto
    [Documentation]    Esse testes verifica a busca de um produto  
    [Tags]             busca_produtos    lista_busca
    Acessar a home page do site Amazon.com.br
    Digitar o nome de produto "Vai dar tudo certo" no campo de pesquisa
    Clicar no botão de pesquisa
    Clicar na Imagem
    Adicinar o Livro no Carrinho
    Verificar o carrinho
    Fechar o Pedido
