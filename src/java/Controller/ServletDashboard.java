package Controller;

import Model.ModelRol;
import Model.ModelTienda;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/dashboard")
public class ServletDashboard extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        ModelRol modelRol = new ModelRol();
        ModelTienda modelTienda = new ModelTienda();

        request.setAttribute("roles", modelRol.listarRoles());
        request.setAttribute("tiendas", modelTienda.listarTiendas());

        request.getRequestDispatcher("dashboard.jsp").forward(request, response);
    }
}