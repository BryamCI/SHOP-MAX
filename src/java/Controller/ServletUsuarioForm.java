
package Controller;

/**
 *
 * @author USUARIO
 */
import Model.ModelRol;
import Model.ModelTienda;
import Model.ModelUsuario;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

@WebServlet("/UsuarioForm")
public class ServletUsuarioForm extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        ModelRol modelRol = new ModelRol();
        ModelTienda modelTienda = new ModelTienda();

        request.setAttribute("roles", modelRol.listarRoles());
        request.setAttribute("tiendas", modelTienda.listarTiendas());
        
        ModelUsuario model = new ModelUsuario();

        ArrayList<HashMap<String, String>> roles = model.getRoles();

        request.setAttribute("roles", roles);

        request.getRequestDispatcher("dashboard.jsp").forward(request, response);
    }
}