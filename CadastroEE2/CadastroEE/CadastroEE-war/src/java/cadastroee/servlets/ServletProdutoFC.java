package cadastroee.servlets;

import cadastroee.model.Produto;
import cadastroee.controller.ProdutoFacadeLocal;
import jakarta.ejb.EJB;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ServletProdutoFC", urlPatterns = {"/ServletProdutoFC"})
public class ServletProdutoFC extends HttpServlet {

    @EJB
    private ProdutoFacadeLocal facade;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String acao = request.getParameter("acao");
        String destino = "ProdutoLista.jsp";

        if (null == acao) {
            List<Produto> produtos = facade.findAll();
            request.setAttribute("lista", produtos);

        } else switch (acao) {
            case "listar" -> {
                List<Produto> produtos = facade.findAll();
                request.setAttribute("lista", produtos);
            }
            case "formIncluir" -> destino = "ProdutoDados.jsp";
            case "formAlterar" ->                 {
                    int id = Integer.parseInt(request.getParameter("id"));
                    Produto p = facade.find(id);
                    request.setAttribute("produto", p);
                    destino = "ProdutoDados.jsp";
                }
            case "excluir" ->                 {
                    int id = Integer.parseInt(request.getParameter("id"));
                    Produto p = facade.find(id);
                    facade.remove(p);
                    request.setAttribute("lista", facade.findAll());
                }
            case "alterar" ->                 {
                    int id = Integer.parseInt(request.getParameter("id"));
                    Produto p = facade.find(id);
                    p.setNome(request.getParameter("nome"));
                    p.setQuantidade(Integer.valueOf(request.getParameter("quantidade")));
                    p.setPrecoVenda((float) Double.parseDouble(request.getParameter("precoVenda")));
                    facade.edit(p);
                    request.setAttribute("lista", facade.findAll());
                }
            case "incluir" ->                 {
                    Produto p = new Produto();
                    p.setNome(request.getParameter("nome"));
                    p.setQuantidade(Integer.valueOf(request.getParameter("quantidade")));
                    p.setPrecoVenda((float) Double.parseDouble(request.getParameter("precoVenda")));
                    facade.create(p);
                    request.setAttribute("lista", facade.findAll());
                }
            default -> {
            }
        }

        RequestDispatcher rd = request.getRequestDispatcher(destino);
        rd.forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
}
