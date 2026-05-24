
package Model;

import Entity.Usuario;
import Utils.MysqlDBConexion;
import java.sql.Connection;
import java.sql.PreparedStatement;

/**
 *
 * @author USUARIO
 */
import Entity.Usuario;
import Utils.MysqlDBConexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;

public class ModelUsuario {

    public ArrayList<HashMap<String, String>> getRoles() {

        ArrayList<HashMap<String, String>> lista = new ArrayList<>();

        Connection cn = null;
        ResultSet rs = null;
        PreparedStatement ps = null;

        try {
            String sql = "SELECT id_rol, nombre FROM rol";

            cn = MysqlDBConexion.getConexion();
            ps = cn.prepareStatement(sql);
            rs = ps.executeQuery();

            while(rs.next()) {
                HashMap<String, String> map = new HashMap<>();
                map.put("id", rs.getString("id_rol"));
                map.put("nombre", rs.getString("nombre"));

                lista.add(map);
            }

        } catch(Exception e) {
            e.printStackTrace();
        } 

        return lista;
    }
    
    public boolean saveUsuario(Usuario u) {

        Connection cn = null;
        PreparedStatement ps = null;

        try {

            String sql = "INSERT INTO usuario "
                    + "(id_rol, id_tienda, nombre, email, contrasena, estado) "
                    + "VALUES (?,?,?,?,?,1)";

            cn = MysqlDBConexion.getConexion();
            ps = cn.prepareStatement(sql);

            // 🔥 AQUÍ YA SON IDs (NO TEXTOS)
            ps.setInt(1, u.getId_rol());
            ps.setInt(2, u.getId_tienda());
            ps.setString(3, u.getNombre());
            ps.setString(4, u.getEmail());
            ps.setString(5, u.getContrasena());

            ps.executeUpdate();

            return true;

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (ps != null) ps.close();
                if (cn != null) cn.close();
            } catch (Exception e2) {
                e2.printStackTrace();
            }
        }

        return false;
    }
}