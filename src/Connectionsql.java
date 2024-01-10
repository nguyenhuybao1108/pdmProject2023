
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author baonguyen
 */
public class Connectionsql {
    public static Connection getConnection() throws SQLException{
        String connectionUrl = "jdbc:sqlserver://localhost;databaseName=restaurant;user=SA;password=qA13572468;trustServerCertificate=true";
        Connection con = DriverManager.getConnection(connectionUrl);
        return con;
    }
}
