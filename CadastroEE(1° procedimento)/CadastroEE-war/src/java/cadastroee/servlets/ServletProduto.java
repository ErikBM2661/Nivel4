package cadastroee.servlets;

import jakarta.ejb.EJB;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import cadastroee.controller.ProdutoFacadeLocal;
import cadastroee.model.Produto;
import jakarta.servlet.annotation.WebServlet;

@WebServlet(name = "ServletProduto", urlPatterns = {"/ServletProduto"})
public class ServletProduto extends HttpServlet {

    @EJB
    private ProdutoFacadeLocal facade;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println("Facade é nulo? " + (facade == null));


        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            List<Produto> produtos = facade.findAll();

            out.println("<html><body>");
            out.println("<h2>Lista de Produtos</h2>");
            out.println("<ul>");
            for (Produto p : produtos) {
                out.println("<li>" + p.getIdProduto() + " - " + p.getNome() + " - R$" + p.getPrecoVenda() + "</li>");
            }
            out.println("</ul>");
            out.println("</body></html>");
        }
    }
}
