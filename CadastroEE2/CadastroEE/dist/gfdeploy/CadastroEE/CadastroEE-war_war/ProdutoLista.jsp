<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*, cadastroee.model.Produto"%>
<!DOCTYPE html>
<html>
<head>
    <title>Lista de Produtos</title>
</head>
<body>
    <h1>Lista de Produtos</h1>

    <a href="ServletProdutoFC?acao=formIncluir">Novo Produto</a>

    <table border="1">
        <tr>
            <th>ID</th><th>Nome</th><th>Quantidade</th><th>Preço</th><th>Ações</th>
        </tr>
        <%
            List<Produto> lista = (List<Produto>) request.getAttribute("lista");
            if (lista != null) {
                for (Produto p : lista) {
        %>
        <tr>
            <td><%= p.getIdProduto() %></td>
            <td><%= p.getNome() %></td>
            <td><%= p.getQuantidade() %></td>
            <td><%= p.getPrecoVenda() %></td>
            <td>
                <a href="ServletProdutoFC?acao=formAlterar&id=<%= p.getIdProduto() %>">Alterar</a>
                <a href="ServletProdutoFC?acao=excluir&id=<%= p.getIdProduto() %>">Excluir</a>
            </td>
        </tr>
        <%
                }
            }
        %>
    </table>
</body>
</html>
