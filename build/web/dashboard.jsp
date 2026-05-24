<%-- 
    Document   : dashboard
    Created on : 22 abr. 2026, 2:41:41 p. m.
    Author     : USUARIO
--%>

<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<!--
Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Html.html to edit this template
-->
<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<title>Dashboard - SHOP-MAX</title>
<link rel="stylesheet" href="css/system/styles.css">
<link rel="stylesheet" href="css/system/users.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
</head>

<body>

<div class="dashboard">

  <!-- ===== SIDEBAR ===== -->
  <aside class="sidebar">

    <!-- TOP -->
    <div class="sidebar-top">
      <img src="images/logo/logo_blanco.png">
      <h2>Sistema SHOP-MAX</h2>
    </div>

    <div class="divider"></div>

    <!-- MENU -->
    <div class="sidebar-menu">

      <button class="menu-item active" id="btnDashboard">
        <i class="fa-solid fa-chart-line"></i> Dashboard
      </button>

      <button class="menu-item" id="btnSales">
        <i class="fa-solid fa-cart-shopping"></i> Ventas
      </button>

      <button class="menu-item" id="btnStore">
        <i class="fa-solid fa-box"></i> Inventario
      </button>

      <button class="menu-item" id="btnCustomers">
        <i class="fa-solid fa-users"></i> Clientes
      </button>

      <button class="menu-item" id="btnSuppliers">
        <i class="fa-solid fa-truck"></i> Proveedores
      </button>

      <button class="menu-item" id="btnPurchases">
        <i class="fa-solid fa-file-invoice"></i> Compras
      </button>

      <button class="menu-item" id="btnReports">
        <i class="fa-solid fa-chart-pie"></i> Reportes
      </button>
        
      <button class="menu-item" id="btnUsers">
        <i class="fa-solid fa-user-gear"></i> Usuarios
      </button>

    </div>

    <div class="divider"></div>

    <!-- LOGOUT -->
    <div class="sidebar-bottom">
      <button class="logout">
        <i class="fa-solid fa-right-from-bracket"></i> Cerrar Sesión
      </button>
    </div>

  </aside>

  <!-- ===== CONTENIDO ===== -->
  <main class="main">

    <!-- TOPBAR -->
    <div class="topbar">
      <div class="datetime-box">
        <i class="fa-regular fa-clock"></i>
        <div class="datetime-text">
          <span id="time"></span>
          <small id="date"></small>
        </div>
      </div>

      <div class="user">
        <div>
          <strong>Admin</strong>
          <p>Administrador</p>
        </div>
        <div class="avatar">A</div>
      </div>
    </div>

    <!-- CONTENIDO -->
    <div class="content">
        
        <!-- DASHBOARD -->
        <section id="dashboard-module">

            <h1>Bienvenido, Administrador</h1>

            <!-- CARDS -->
            <div class="cards">

              <div class="card card1">
                <i class="fa-solid fa-dollar-sign"></i>
                <h3>Ventas de Hoy</h3>
                <h2>S/. 5,240.00</h2>
                <p>23 transacciones</p>
              </div>

              <div class="card card2">
                <i class="fa-solid fa-box"></i>
                <h3>Productos</h3>
                <h2>324</h2>
                <p>En inventario</p>
              </div>

              <div class="card card3">
                <i class="fa-solid fa-users"></i>
                <h3>Clientes</h3>
                <h2>1,284</h2>
                <p>Registrados</p>
              </div>

            </div>

            <!-- ACCESOS -->
            <div class="quick">

              <h2>Accesos Rápidos</h2>

              <div class="quick-grid">

                <button><i class="fa-solid fa-cart-shopping"></i> Ventas</button>
                <button><i class="fa-solid fa-box"></i> Inventario</button>
                <button><i class="fa-solid fa-users"></i> Clientes</button>
                <button><i class="fa-solid fa-truck"></i> Proveedores</button>
                <button><i class="fa-solid fa-file-invoice"></i> Compras</button>
                <button><i class="fa-solid fa-chart-pie"></i> Reportes</button>

              </div>

            </div>
        </section>
      
        <section class="users-module" id="users-module" style="display: none;">
            <!-- HEADER -->
            <div class="users-header">
              <h2 class="gradient-text">Gestión de Usuarios</h2>
              <button class="btn-add-user">
                <i class="fa-solid fa-plus"></i>
                Agregar Usuario
              </button>
            </div>

            <!-- STATS -->
            <div class="users-stats">
              <div class="stat-card total">
                <p>Total de Usuarios</p>
                <h3 id="totalUsers">3</h3>
              </div>

              <div class="stat-card active">
                <p>Usuarios Activos</p>
                <h3 id="activeUsers">2</h3>
              </div>

              <div class="stat-card inactive">
                <p>Usuarios Inactivos</p>
                <h3 id="inactiveUsers">1</h3>
              </div>
            </div>

            <!-- FILTROS -->
            <div class="users-filters">

                <div class="search-box">
                  <i class="fa fa-search"></i>
                  <input type="text" id="searchUser" placeholder="Buscar usuarios...">
                </div>

                <select id="roleFilter">
                  <option value="all">🔎 Todos</option>
                  <option value="admin">Administrador(a)</option>
                  <option value="seller">Vendedor(a)</option>
                </select>
            </div>

            <!-- GRID -->
            <div class="users-grid" id="usersGrid"></div>

            <!-- PAGINACIÓN -->
            <div class="pagination">
              <button id="prevUsers">⬅ Anterior</button>
              <button id="nextUsers">Siguiente ➡</button>
            </div>
        </section>
      

    </div>

  </main>

</div>

    <!-- ===== MODAL AGREGAR USUARIO ===== -->
<div class="modal-overlay" id="userModal">
    <div class="modal">
        <form method="POST" action="ServletMantenimientoUsuario" id="formUser">
            <h2>Agregar Usuario</h2>

            <!-- Nombre -->
            <label>Nombre de Usuario</label>
            <input type="text" name="nombre" placeholder="Ingrese nombre" required>

            <!-- Tipo -->
            <label>Tipo de Usuario</label>
            <select name="rol" required>

                <%
                ArrayList<HashMap<String,String>> roles =
                    (ArrayList<HashMap<String,String>>) request.getAttribute("roles");

                if(roles != null){
                    for(HashMap<String,String> r : roles){
                %>

                <option value="<%= r.get("id") %>">
                    <%= r.get("nombre") %>
                </option>

                <%
                    }
                }
                %>

            </select>

            <!-- Email -->
            <label>Email</label>
            <input type="email" name="email" placeholder="Ingrese email" required>

            <!-- Contraseña -->
            <label>Contraseña</label>
            <input type="password" name="contrasena" placeholder="Ingrese contraseña" required>

            <!-- Tienda -->
            <label>Tienda</label>
            <select name="tienda" required>

                <%
                    ArrayList<HashMap<String,String>> tiendas =
                        (ArrayList<HashMap<String,String>>) request.getAttribute("tiendas");

                    if(tiendas != null){
                        for(HashMap<String,String> t : tiendas){
                %>

                    <option value="<%= t.get("id") %>">
                        <%= t.get("nombre") %>
                    </option>

                <%
                    }
                }
                %>

            </select>

            <div class="modal-buttons">
                <button type="submit" class="btn-save">Agregar</button>
                <button type="button" class="btn-cancel">Cancelar</button>
            </div>
        </form>
    </div>
    
</div>

<script>
    function actualizarFechaHora() {
      const now = new Date();

      const opcionesFecha = {
        weekday: "long",
        year: "numeric",
        month: "long",
        day: "numeric"
      };

      const fecha = now.toLocaleDateString("es-PE", opcionesFecha);
      const hora = now.toLocaleTimeString("es-PE");

      document.getElementById("time").textContent = hora;
      document.getElementById("date").textContent = fecha;
    }

    // ejecutar al cargar
    actualizarFechaHora();

    // actualizar cada segundo
    setInterval(actualizarFechaHora, 1000);
    

</script>
<script src="js/system/data-users.js"></script>
<script src="js/system/modules.js"></script>
<script src="js/system/modal-users.js"></script>
</body>
</html>

