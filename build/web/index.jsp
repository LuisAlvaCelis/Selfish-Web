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
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Selfish</title>
        <link rel="shortcut icon" type="image/x-icon" href="img/logo.png">
        <link rel="stylesheet" href="css/style_index.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css">
        <link href="https://fonts.googleapis.com/css2?family=Fjalla+One&display=swap" rel="stylesheet">
    </head>
    <body>
        <div class="container-main">
            
            <div class="container-header">
                <nav class="nav-main">
                    <ul class="nav-menu">
                        <li><a href="sv_main?acjsp=homepage" class="a1">Inicio</a></li>
                        <li><a href="sv_main?acjsp=place_orders">Realizar pedidos</a></li>
                    </ul>
                    <ul class="nav-menu-right">
                    <%
                        if(username==null){
                    %>
                            <li><a href="sv_main?acjsp=login">Ingresar</a></li>
                    <%
                        }else{
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
            <h2 class="h2_format">Menús disponibles:</h2>
            <div class="news-cards-menus">
                
            <%
            for(int i=0;i<MenuDAO.getMenuCategorys().size();i++){
                String category=MenuDAO.getMenuCategorys().get(i).toString();
                Statement statement=SourceCodes.openConnection().createStatement();
                ResultSet rs=statement.executeQuery("SELECT * FROM register_menu WHERE category LIKE '%"+category+"%'");
                while(rs.next()){
                    if(rs.getBoolean("status")==true){
            %>
                    <div>
                        <h4><%=rs.getString("name")%> - <%=category%></h4>
                        <img src="sv_img?idmenu=<%=rs.getString("id_menu")%>">
                    </div>
            <%  
                    }
                }
                rs.close();
                statement.close();
                SourceCodes.closeConnection();
            }
            %>
            </div>
            <hr>
            <h2 class="h2_format">Bebidas disponibles:</h2>
            <div class="news-cards-drinks">
            <%
            for(int i=0;i<DrinkDAO.getDrinkCategorys().size();i++){
                String category=DrinkDAO.getDrinkCategorys().get(i).toString();
                Statement statement=SourceCodes.openConnection().createStatement();
                ResultSet rs=statement.executeQuery("SELECT * FROM register_drinks WHERE category LIKE '%"+category+"%'");
                while(rs.next()){
                    if(rs.getInt("cant")>0){
            %>
                    <div>
                        <h4><%=rs.getString("name")%> - <%=category%></h4>
                        <img src="sv_img?iddrink=<%=rs.getString("id_drink")%>">
                    </div>
            <%  
                    }
                }
            }
            %>
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