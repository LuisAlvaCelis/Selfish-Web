package me.mvc.model;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import me.utils.SourceCodes;

public class UserDAO {
    
    private String lastnames,names, dni, telcel, mail, user, pass;
    private int rol;

    public UserDAO(int rol,String lastnames, String names, String dni, String telcel, String mail, String user, String pass) {
        this.rol=rol;
        this.lastnames = lastnames;
        this.names = names;
        this.dni = dni;
        this.telcel = telcel;
        this.mail = mail;
        this.user = user;
        this.pass = pass;
    }
    
    public boolean verifyMail(){
        boolean status=false;
        try {
            Statement statement=SourceCodes.openConnection().createStatement();
            ResultSet rs=statement.executeQuery("SELECT * FROM register_users WHERE mail='"+mail+"'");
            if(rs.next()){
                status=true;
            }else{
                status=false;
            }
            rs.close();
            statement.close();
            SourceCodes.closeConnection();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }
    
    public boolean verifyUser(){
        boolean status=false;
        try {
            Statement statement=SourceCodes.openConnection().createStatement();
            ResultSet rs=statement.executeQuery("SELECT * FROM register_users WHERE username='"+user+"'");
            if(rs.next()){
                status=true;
            }else{
                status=false;
            }
            rs.close();
            statement.close();
            SourceCodes.closeConnection();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }
    
    public boolean verifyDNI(){
        boolean status=false;
        try {
            Statement statement=SourceCodes.openConnection().createStatement();
            ResultSet rs=statement.executeQuery("SELECT * FROM register_users WHERE dni='"+dni+"'");
            if(rs.next()){
                status=true;
            }else{
                status=false;
            }
            rs.close();
            statement.close();
            SourceCodes.closeConnection();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }
    
    public boolean registerNewUser(){
        boolean status=false;
        try {
            PreparedStatement ps=SourceCodes.openConnection().prepareStatement("INSERT INTO register_users(dni,id_rol,lastnames,names,tel_cel,username,password,mail) VALUES(?,?,?,?,?,?,?,?)");
            ps.setString(1, dni);
            ps.setInt(2, rol);
            ps.setString(3, lastnames);
            ps.setString(4, names);
            ps.setString(5, telcel);
            ps.setString(6, user);
            ps.setString(7, pass);
            ps.setString(8, mail);
            int result=ps.executeUpdate();
            if(result>0){
                status=true;
            }else{
                status=false;
            }
            ps.close();
            SourceCodes.closeConnection();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }
}
