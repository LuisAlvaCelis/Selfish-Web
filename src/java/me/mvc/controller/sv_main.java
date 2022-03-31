package me.mvc.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import me.mvc.model.UserDAO;
import me.utils.SourceCodes;

public class sv_main extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String action=request.getParameter("acjsp");
        if(action.equals("login")){
            SourceCodes.openNewJSP(request, response, "login.jsp");
        }else if(action.equals("register")){
            SourceCodes.openNewJSP(request, response, "register_user.jsp");
        }else if(action.equals("register-return")){
            SourceCodes.openNewJSP(request, response, "login.jsp");
        }else if(action.equals("login-return")){
            SourceCodes.openNewJSP(request, response, "index.jsp");
        }else if(action.equals("register_newuser")){
            String lastnames=request.getParameter("txtLastnames");
            String names=request.getParameter("txtNames");
            String dni=request.getParameter("txtDNI");
            String telcel=request.getParameter("txtTelCel");
            String mail=request.getParameter("txtMail");
            String user=request.getParameter("txtUser");
            String pass1=request.getParameter("txtPass1");
            String pass2=request.getParameter("txtPass2");
            UserDAO newuser=new UserDAO(1, lastnames, names, dni, telcel, mail, user, pass1);
            if(newuser.verifyDNI()==false){
                if(dni.length()==8){
                    if(newuser.verifyMail()==false){
                        if(newuser.verifyUser()==false){
                            if(pass2.equals(pass1)){
                                if(newuser.registerNewUser()==true){
                                    request.setAttribute("errorMsg", "¡Usuario registrado con éxito!\nIngrese su cuenta");
                                    SourceCodes.openNewJSP(request, response, "login.jsp");
                                }else{
                                    request.setAttribute("errorMsg", "Error: No se pudo registrar el nuevo usuario, vuelva a intentarlo.");
                                    SourceCodes.openNewJSP(request, response, "register_user.jsp");
                                }
                            }else{
                                request.setAttribute("errorMsg", "Error: Contraseñas no coinciden, vuelva a intentarlo.");
                                SourceCodes.openNewJSP(request, response, "register_user.jsp");
                            }
                        }else{
                            request.setAttribute("errorMsg", "Error: Usuario ya registrado anteriormente, vuelva a intentarlo.");
                            SourceCodes.openNewJSP(request, response, "register_user.jsp");
                        }
                    }else{
                        request.setAttribute("errorMsg", "Error: Email ya registrado anteriormente, vuelva a intentarlo.");
                        SourceCodes.openNewJSP(request, response, "register_user.jsp");
                    }
                }else{
                    request.setAttribute("errorMsg", "Error: Email ya registrado anteriormente, vuelva a intentarlo.");
                    SourceCodes.openNewJSP(request, response, "register_user.jsp");
                }
            }else{
                request.setAttribute("errorMsg", "Error: DNI ya registrado anteriormente, vuelva a intentarlo.");
                SourceCodes.openNewJSP(request, response, "register_user.jsp");
            }
        }else if(action.equals("join")){
            String user=request.getParameter("txtUser");
            String pass=request.getParameter("txtPass");
            try {
                Statement statement=SourceCodes.openConnection().createStatement();
                ResultSet rs=statement.executeQuery("SELECT * FROM register_users WHERE username LIKE '%"+user+"%'");
                while(rs.next()){
                    if(rs.getString("username").equalsIgnoreCase(user) && rs.getString("password").equalsIgnoreCase(pass)){
                        HttpSession hs=request.getSession();
                        hs.setAttribute("dni", rs.getString("dni"));
                        hs.setAttribute("lastnames", rs.getString("lastnames"));
                        hs.setAttribute("names", rs.getString("names"));
                        hs.setAttribute("telcel", rs.getString("tel_cel"));
                        hs.setAttribute("username", rs.getString("username"));
                        hs.setAttribute("password", rs.getString("password"));
                        SourceCodes.openNewJSP(request, response, "index.jsp");
                    }else{
                        request.setAttribute("errorMsg", "Error: Contraseña incorrecta, vuelva a intentarlo. ");
                        SourceCodes.openNewJSP(request, response, "login.jsp");
                    }
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }else if(action.equals("logout")){
            HttpSession hs=request.getSession();
            request.getSession().removeAttribute("dni");
            request.getSession().removeAttribute("lastnames");
            request.getSession().removeAttribute("names");
            request.getSession().removeAttribute("telcel");
            request.getSession().removeAttribute("username");
            request.getSession().removeAttribute("password");
            request.getSession().removeAttribute("idrol");
            hs.invalidate();
            SourceCodes.openNewJSP(request, response, "index.jsp");
        }else if(action.equals("homepage")){
            SourceCodes.openNewJSP(request, response, "index.jsp");
        }else if(action.equals("place_orders")){
            SourceCodes.openNewJSP(request, response, "place_orders.jsp");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
