<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Selfish login</title>
        <link rel="shortcut icon" type="image/x-icon" href="img/logo.png">
        <link rel="stylesheet" href="css/style_login.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css">
        <link href="https://fonts.googleapis.com/css2?family=Fjalla+One&display=swap" rel="stylesheet">
    </head>
    <body>
        <div class="container">
            <div class="header">
                <h1>Ingresar</h1>
            </div>
            <hr>
            <div class="inputs">
                <form action="sv_main" class="form" method="post">
                    <input type="hidden" name="acjsp" value="join"/>

                    <input type="text" class="form_input" name="txtUser" id="txtUser" required="required" autocomplete="off"/>
                    <label for="" class="form_label">Usuario</label>

                    <input type="password" class="form_input" name="txtPass" id="txtPass" required="required" autocomplete="off"/>
                    <label for="" class="form_label">Contraseña</label>
                

                    <label class="form_checkbox">
                        <input type="checkbox" name="chbSP" id="chbSP" onclick="seePassword()">Ver contraseña
                        <i></i>
                    </label>

                    <button class="form_button">Ingresar</button>

                    <a href="sv_main?acjsp=register" class="form_a_btn">Registrarse</a>
                    <a href="sv_main?acjsp=login-return" class="form_a_btn">Volver</a>
                    <h3 class="console" align="center">
                        <%
                            if(request.getAttribute("errorMsg")!=null){
                                out.println(request.getAttribute("errorMsg"));
                            }
                        %>
                    </h3><br>
                </form>
            </div>
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
                        <h5>Página de prueba para el ingreso a usuarios ya registrados</h5>
                    </li>
                </ul>
            </div>
        </div>
        <script src="js/script_login.js"></script>
    </body>
</html>
