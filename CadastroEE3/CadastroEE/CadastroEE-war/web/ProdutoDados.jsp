<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="cadastroee.model.Produto"%>
<%
    Produto produto = (Produto) request.getAttribute("produto");
    String acao = (produto == null) ? "incluir" : "alterar";
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <title><%= (acao.equals("incluir") ? "Incluir Produto" : "Alterar Produto") %></title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body class="container mt-4">

    <h1><%= (acao.equals("incluir") ? "Incluir Produto" : "Alterar Produto") %></h1>

    <form action="ServletProdutoFC" method="post" class="form">

        <input type="hidden" name="acao" value="<%= acao %>" />
        
        <% if (acao.equals("alterar")) { %>
            <input type="hidden" name="id" value="<%= produto.getIdProduto() %>" />
        <% } %>

        <div class="mb-3">
            <label for="nome" class="form-label">Nome:</label>
            <input type="text" id="nome" name="nome" 
                value="<%= (produto != null ? produto.getNome() : "") %>" 
                class="form-control" required />
        </div>

        <div class="mb-3">
            <label for="quantidade" class="form-label">Quantidade:</label>
            <input type="number" id="quantidade" name="quantidade" 
                value="<%= (produto != null ? produto.getQuantidade() : 0) %>" 
                class="form-control" min="0" required />
        </div>

        <div class="mb-3">
            <label for="precoVenda" class="form-label">Preço de Venda:</label>
            <input type="number" step="0.01" id="precoVenda" name="precoVenda" 
                value="<%= (produto != null ? produto.getPrecoVenda() : 0.0) %>" 
                class="form-control" min="0" required />
        </div>

        <button type="submit" class="btn btn-primary">
            <%= (acao.equals("incluir") ? "Incluir" : "Alterar") %>
        </button>

    </form>

</body>
</html>
