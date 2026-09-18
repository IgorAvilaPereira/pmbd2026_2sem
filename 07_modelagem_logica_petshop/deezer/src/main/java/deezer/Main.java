package deezer;

import java.sql.Connection;
import java.sql.Driver;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.swing.JOptionPane;

public class Main {
    public static void main(String[] args) throws SQLException {
        String host = "localhost";
        String dbname = "deezer";
        String username = "postgres";
        String password = "postgres";
        String port = "5432";

        String url = "jdbc:postgresql://"+host+":"+port+"/"+dbname;
        Connection conexao = DriverManager.getConnection(url, username, password);
        String sql = "SELECT * FROM artista;";
        PreparedStatement instrucaoSQL = conexao.prepareStatement(sql);
        ResultSet rs = instrucaoSQL.executeQuery();
        while (rs.next()) {
            // System.out.println(rs.getString("nome"));
            JOptionPane.showMessageDialog(null, rs.getString("nome"));
        }

        conexao.close();


    }
}