package dao;

import java.sql.Connection;
import java.sql.DriverManager;

public class SingletonConnection {
    private static String URL = "jdbc:mysql://localhost:3306/plateforme_soutien";
    private static String USER = "root";
    private static String PASSWORD = "roka1234";

    public static Connection getConnection(){
        Connection conn = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(URL,USER,PASSWORD);

        }catch(Exception e){
            throw new RuntimeException(e);

        }
        return conn;
    }

}
