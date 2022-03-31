<%@page contentType="text/html" pageEncoding="UTF-8"%>
    <!DOCTYPE html>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>Selfish register</title>
            <link rel="shortcut icon" type="image/x-icon" href="img/logo.png">
            <link rel="stylesheet" href="css/style_register_user.css">
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css">
            <link href="https://fonts.googleapis.com/css2?family=Fjalla+One&display=swap" rel="stylesheet">
        </head>
        </head>
        <body>
            <div class="container">
                <div class="header">
                    <h1>Registrarse</h1>
                </div>
                <hr>
                <div class="inputs">
                    <form action="sv_main" class="form" method="post" name="f">
                        <div class="box-1">
                            <input type="text" class="form_input" name="txtLastnames" id="txtLastnames" required="required" autocomplete="off"/>
                            <label class="form_label">Apellidos completos</label>

                            <input type="text" class="form_input" name="txtNames" id="txtNames" required="required" autocomplete="off"/>
                            <label class="form_label">Nombres completos</label>
                        
                            <input type="text" class="form_input" name="txtDNI" id="txtDNI" required="required" autocomplete="off" onkeyup="verifyDataDNI(event)"/>
                            <label class="form_label">Número de DNI</label>
                            <h5 id="consoledni"></h5><br>

                            <input type="text" class="form_input" name="txtTelCel" id="txtTelCel" required="required" autocomplete="off"/>
                            <label class="form_label">Teléfono / celular</label>
                        </div>

                        <div class="box-2">
                            <input type="text" class="form_input" name="txtMail" id="txtMail" required="required" autocomplete="off" onkeyup="verifyDataMail(event)"/>
                            <label class="form_label">Correo electrónico</label>
                            <h5 id="consolemail"></h5><br>

                            <input type="text" class="form_input" name="txtUser" id="txtUser" required="required" autocomplete="off" onkeyup="verifyDataUser(event)"/>
                            <label class="form_label">Nombre de usuario</label>
                            <h5 id="consoleuser"></h5><br>

                            <input type="password" class="form_input" name="txtPass1" id="txtPass1" required="required" autocomplete="off" onkeyup="spaceWhite1(event)"/>
                            <label class="form_label">Contraseña de usuario</label>
                            <h5 id="console1"></h5><br>

                            <input type="password" class="form_input" name="txtPass2" id="txtPass2" required="required" autocomplete="off" onkeyup="equalsPassword(event)"/>
                            <label class="form_label">Repita contraseña</label>
                            <h5 id="console2"></h5><br>
                            <h5 id="console3"></h5><br>

                            <label class="form_checkbox">
                                <input type="checkbox" name="chbSP" id="chbSP" onclick="seePassword()">Ver contraseña
                                <i></i>
                            </label>
                        </div>
                        <div class="box-3">
                            <button class="form_button" name="acjsp" value="register_newuser">Registrarse</button>
                            <a href="sv_main?acjsp=register-return" class="form_a_btn">Volver</a>
                            <h3 align="center" id="consoleError">
                                <%
                                    if(request.getAttribute("errorMsg")!=null){
                                        out.println(request.getAttribute("errorMsg"));
                                    }
                                %>
                            </h3><br>
                        </div>
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
                            <h5>Página de prueba para el registro de usuarios</h5>
                        </li>
                    </ul>
                </div>
            </div>
            <script src="js/script_register_newuser.js"></script>
        </body>
    </html>
