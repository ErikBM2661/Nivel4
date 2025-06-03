<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="cadastroee.model.Produto"%>
<%
    List<Produto> lista = (List<Produto>) request.getAttribute("lista");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <title>Lista de Produtos</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body class="container">

    <h1 class="my-4">Produtos</h1>


    <a href="ServletProdutoFC?acao=formIncluir" class="btn btn-primary m-2">Incluir Produto</a>


    <table class="table table-striped">
        <thead class="table-dark">
            <tr>
                <th>ID</th>
                <th>Nome</th>
                <th>Quantidade</th>
                <th>Preço</th>
                <th>Ações</th>
            </tr>
        </thead>
        <tbody>
            <% if (lista != null) {
                for (Produto p : lista) { %>
                    <tr>
                        <td><%= p.getIdProduto() %></td>
                        <td><%= p.getNome() %></td>
                        <td><%= p.getQuantidade() %></td>
                        <td><%= String.format("R$ %.2f", p.getPrecoVenda()) %></td>
                        <td>
                            <a href="ServletProdutoFC?acao=formAlterar&id=<%=p.getIdProduto()%>" 
                               class="btn btn-primary btn-sm">Alterar</a>
                            <a href="ServletProdutoFC?acao=excluir&id=<%=p.getIdProduto()%>" 
                               class="btn btn-danger btn-sm"
                               onclick="return confirm('Confirma exclusão?');">Excluir</a>
                        </td>
                    </tr>
            <%  }
               } else { %>
                <tr><td colspan="5">Nenhum produto cadastrado.</td></tr>
            <% } %>
        </tbody>
    </table>

</body>
</html>
