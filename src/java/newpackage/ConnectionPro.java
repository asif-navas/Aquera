/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

package newpackage;
import java.sql.*;

/**
 *
 * @author 91963
 */
public class ConnectionPro {
    private static Connection con;
    
    public static Connection getConnection(){
        try{
            Class.forName("com.mysql.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/aquera","root","");
            
        }catch(ClassNotFoundException | SQLException e){
        }
        return con;
    }
    
}
