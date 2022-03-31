package me.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

public class SourceCodes {
    
    private static Connection connection;
    
    public static Connection openConnection(){
        try {
            Class.forName("org.gjt.mm.mysql.Driver");
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3307/selfish","root","157855");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return connection;
    }
    
    public static void closeConnection(){
        try {
            if(!connection.isClosed()){
                connection.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public static void openNewJSP(HttpServletRequest request,HttpServletResponse response,String name){
        try {
            request.getRequestDispatcher(name).forward(request, response);
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, e,"New JSP",0);
        }
    }
    
    public static boolean verifyIfIsNumber(String num){
        boolean status=false;
        try {
            Integer.parseInt(num);
            status=true;
        } catch (Exception e) {
            status=false;
        }
        return status;
    }
    
}
