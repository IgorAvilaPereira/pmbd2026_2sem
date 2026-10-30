package biblioteca;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Scanner;

import javax.print.DocFlavor.STRING;

public class Main {
    public static void main(String[] args) throws SQLException {
        String host = "localhost";
        String dbname = "biblioteca_pmbd2026_2sem";
        String port = "5432";
        String username = "postgres";
        String password = "postgres";
        String url = "jdbc:postgresql://"+host+":"+port+"/"+dbname;
        Connection conexao = DriverManager.getConnection(url, username, password);
        Scanner entrada = new Scanner(System.in);

        // exemplo DELETE
        String sqlDelete = "DELETE FROM autor WHERE id = ?;";
        System.out.println("Digite o id do autor que deseja apagar:");
        int id = entrada.nextInt();
        PreparedStatement instrucaoDelete = conexao.prepareStatement(sqlDelete);
        instrucaoDelete.setInt(1, id);
        instrucaoDelete.execute();
        
        // exemplo INSERT
        String sqlInsert = "INSERT INTO autor (nome) VALUES (?);";
        System.out.println("Digite o nome do novo autor:");
        String nomeAutor = entrada.next();
        PreparedStatement instrucaoInsert = conexao.prepareStatement(sqlInsert);
        instrucaoInsert.setString(1, nomeAutor);
        instrucaoInsert.execute();
        entrada.close();


        // exemplo de SELECT
        String sql = "SELECT * FROM autor ORDER BY id;";
        PreparedStatement instrucao = conexao.prepareStatement(sql);
        ResultSet rs = instrucao.executeQuery();
        while(rs.next()){
            System.out.println(rs.getString("nome"));
        }
        conexao.close();
    }
}