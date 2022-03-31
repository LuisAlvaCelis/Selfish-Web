package me.mvc.model;

import java.io.OutputStream;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletResponse;
import static me.utils.SourceCodes.closeConnection;
import static me.utils.SourceCodes.openConnection;

public class MenuDAO {
    
    public static List getMenuCategorys(){
        List<String> list=new ArrayList<>();
        try {
            Statement statement=openConnection().createStatement();
            ResultSet rs=statement.executeQuery("SELECT * FROM register_category_menu");
            while(rs.next()){
                list.add(rs.getString("category"));
            }
            rs.close();
            closeConnection();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    
    public static void getListMenuImgs(String idmenu,HttpServletResponse response){
        try {
            response.setContentType("image/png");
            OutputStream os=response.getOutputStream();
            PreparedStatement ps=openConnection().prepareStatement("SELECT * FROM register_menu WHERE id_menu='"+idmenu+"'");
            ResultSet rs=ps.executeQuery();
            if(rs!=null){
                if(rs.next()){
                    byte[] buffer=rs.getBytes("image");
                    if(buffer!=null){
                        os.write(buffer);
                        os.flush();
                        os.close();
                    }
                }
                rs.close();
                ps.close();
            }
            closeConnection();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
