package semana_academica;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.swing.JOptionPane;

public class Main {
    public static void main(String[] args) throws SQLException {
        String username = "postgres";
        String password = "postgres";
        String host = "localhost";
        String dbname = "semana_academica";
        String port = "5432";

        String url = "jdbc:postgresql://"+host+":"+port+"/"+dbname;
        Connection conexao = DriverManager.getConnection(url, username, password);

        String novoNome = JOptionPane.showInputDialog("Digite o novo nome:");
        String novoCpf = JOptionPane.showInputDialog("Digite o novo cpf");
        String sqlInsert = "INSERT INTO pessoafisica(nome, cpf) values (?,?);";
        PreparedStatement instrucaoSQL = conexao.prepareStatement(sqlInsert);
        instrucaoSQL.setString(1, novoNome);
        instrucaoSQL.setString(2, novoCpf);
        instrucaoSQL.execute();

        String sql = "SELECT * FROM pessoa";
        ResultSet rs = conexao.prepareStatement(sql).executeQuery();
        String output = "";
        while (rs.next()) {
            output+=rs.getString("nome")+"\n";
        }
        JOptionPane.showMessageDialog(null, output);            

    }
}