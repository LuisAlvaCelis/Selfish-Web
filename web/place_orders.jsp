<%@page import="me.mvc.model.DrinkDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="me.utils.SourceCodes"%>
<%@page import="java.sql.Statement"%>
<%@page import="me.mvc.model.MenuDAO"%>
<%
    String dni=null,lastnames=null,names=null,telcel=null,username=null,password=null,idrol=null;
    HttpSession sesionOK=request.getSession();
    if(sesionOK.getAttribute("username")!=null && sesionOK.getAttribute("dni")!=null){
        dni=(String)sesionOK.getAttribute("dni");
        lastnames=(String)sesionOK.getAttribute("lastnames");
        names=(String)sesionOK.getAttribute("names");
        telcel=(String)sesionOK.getAttribute("telcel");
        username=(String)sesionOK.getAttribute("username");
        password=(String)sesionOK.getAttribute("password");
        idrol=(String)sesionOK.getAttribute("idrol");
    }else{
        request.setAttribute("errorMsg", "Error: Tiene que loguearse para poder realizar un pedido");
        SourceCodes.openNewJSP(request, response, "login.jsp");
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Selfish</title>
        <link rel="shortcut icon" type="image/x-icon" href="img/logo.png">
        <link rel="stylesheet" href="css/style_place_order.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css">
        <link href="https://fonts.googleapis.com/css2?family=Fjalla+One&display=swap" rel="stylesheet">
    </head>
    <body>
        <div class="container-main">
            <div class="container-header">
                <nav class="nav-main">
                    <ul class="nav-menu">
                        <li><a href="sv_main?acjsp=homepage">Inicio</a></li>
                        <li><a href="sv_main?acjsp=place_orders" class="a1">Realizar pedidos</a></li>
                    </ul>
                    <ul class="nav-menu-right">
                        <%
                        if(lastnames!=null && names!=null){
                        %>
                            <li class="li-names"><%=lastnames.toUpperCase() +" "+ names.toUpperCase() %></li>
                            <li><a href="sv_main?acjsp=logout"<%=username%>>Cerrar sesión</a></li>
                        <%
                        }
                        %>
                    </ul>
                </nav>
            </div>
            <hr>
            <section class="cards-banners">
                <div class="content">
                    <h2>30% de descuento</h2>
                    <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Alias consequatur laborum itaque maiores sit! Magnam earum architecto corporis, repellat, cupiditate doloribus in, quia quo asperiores magni tenetur accusamus quos temporibus.</p>
                    <!--<a href="#" class="btn">Leer mas <i class="fas fa-angle-double-down"></i></a>-->
                </div>
            </section>
            <hr>
            <div class="container-center">
                <h2>Menus</h2>
                <table class="table table-fixed">
                    <thead>
                        <tr>
                            <th class="colum-table">Categoría</th>
                            <th class="colum-table">Nombre</th>
                            <th class="colum-table">Costo</th>
                            <th class="colum-table">Imagen</th>
                            <th class="colum-table"> </th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            Statement statemet=SourceCodes.openConnection().createStatement();
                            ResultSet rs=statemet.executeQuery("SELECT * FROM register_menu");
                            while(rs.next()){
                                if(rs.getBoolean("status")==true){
                        %>
                                <tr>
                                    <td class="row-table"><%=rs.getString("category")%></td>
                                    <td class="row-table"><%=rs.getString("name")%></td>
                                    <td class="row-table"><%=rs.getDouble("cost")%></td>
                                    <td class="row-table"><img src="sv_img?idmenu=<%=rs.getString("id_menu")%>" width="100" height="50"></td>
                                    <td class="row-table"><input type="submit" value="Añadir al carrito"></td>
                                </tr>
                        <%   
                                }
                            }
                            rs.close();
                            statemet.close();
                            SourceCodes.closeConnection();
                        %>
                    </tbody>
                </table>
                <h2>Bebidas</h2>
            </div>
            <hr>
            <section class="social">
                <p>Selfish</p>
                <a href="https://web.facebook.com/AlvaCelisLuis" target="_blank">
                    <i class="fab fa-facebook-f"></i>
                </a>
                <a href="https://twitter.com/alvacelisluis" target="_blank">
                    <i class="fab fa-twitter"></i>
                </a>
            </section>
            <div class="footer-links">
                <div class="footer-container">
                    <ul>
                        <li>
                            <h5>Página de prueba principal</h5>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </body>
</html>