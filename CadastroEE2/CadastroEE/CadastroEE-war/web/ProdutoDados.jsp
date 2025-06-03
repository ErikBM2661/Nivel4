<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="cadastroee.model.Produto"%>
<%
    Produto produto = (Produto) request.getAttribute("produto");
    String acao = (produto == null) ? "incluir" : "alterar";
%>
<!DOCTYPE html>
<html>
<head>
    <title>Dados do Produto</title>
</head>
<body>
    <h1><%= (produto == null ? "Novo Produto" : "Alterar Produto") %></h1>

    <form action="ServletProdutoFC" method="post">
        <input type="hidden" name="acao" value="<%= acao %>"/>
        <% if (produto != null) { %>
            <input type="hidden" name="id" value="<%= produto.getIdProduto() %>"/>
        <% } %>

        Nome: <input type="text" name="nome" value="<%= (produto != null ? produto.getNome() : "") %>"/><br/>
        Quantidade: <input type="number" name="quantidade" value="<%= (produto != null ? produto.getQuantidade() : "") %>"/><br/>
        Preço de Venda: <input type="text" name="precoVenda" value="<%= (produto != null ? produto.getPrecoVenda() : "") %>"/><br/>
        
        <input type="submit" value="<%= (produto == null ? "Incluir" : "Alterar") %>"/>
    </form>

    <a href="ServletProdutoFC?acao=listar">Voltar</a>
</body>
</html>
