
package Controller;

/**
 *
 * @author USUARIO
 */
import Entity.Usuario;
import Model.ModelUsuario;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "ServletMantenimientoUsuario", urlPatterns = {"/ServletMantenimientoUsuario"})
public class ServletMantenimientoUsuario extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {

            System.out.println("🔥 REGISTRO USUARIO");

            // DATOS DEL FORM
            int idRol = Integer.parseInt(request.getParameter("rol"));
            int idTienda = Integer.parseInt(request.getParameter("tienda"));

            String nombre = request.getParameter("nombre");
            String email = request.getParameter("email");
            String contrasena = request.getParameter("contrasena");

            // PROCESO
            
            Usuario u = new Usuario();
            u.setId_rol(idRol);
            u.setId_tienda(idTienda);
            u.setNombre(nombre);
            u.setEmail(email);
            u.setContrasena(contrasena);
            u.setEstado(1);
            
            ModelUsuario model = new ModelUsuario();
            boolean ok = model.saveUsuario(u);

            System.out.println("RESULTADO INSERT USER: " + ok);

            // (OPCIONAL) puedes redirigir o recargar módulo
            response.sendRedirect("dashboard");

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("ERROR: " + e.getMessage());
        }
    }
}
