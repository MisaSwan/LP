/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.mack.DAO;

import edu.mack.entity.Usuario;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;

/**
 *
 * @author 1147171
 */
public class UsuarioDaoImpl implements UsuarioDao {

    @Override
    public List<Usuario> listarTodos() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public Usuario obterPorId(String id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean atualizar(Usuario usuario) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean remover(Usuario usuario) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean salvar(Usuario usuario) {
        try {
           Connection connection = UtilDAO.getConn();

            String sql = "INSERT INTO Users (name,cpf,login,password,email,gender,age) values(?,?,?,?,?,?,?)";
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setString(1, usuario.getNome());
            stmt.setString(2, usuario.getCpf());
            stmt.setString(3, usuario.getLogin());
            stmt.setString(4, usuario.getSenha());
            stmt.setString(5, usuario.getEmail());
            stmt.setString(6, usuario.getGender());
            stmt.setInt(7, usuario.getAge());

            stmt.execute();
            connection.commit();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
        //throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
    @Override
    public Usuario obterPorLogin(Usuario usuario) {

         try {
           Connection connection = UtilDAO.getConn();

            String sql = "Select * from Users where Login = ? AND Password =?";            
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setString(1, usuario.getLogin());
            stmt.setString(2, usuario.getSenha());           
            ResultSet rs = stmt.executeQuery();
           Usuario user = new Usuario();
            while (rs.next()) {                
                user.setId(rs.getInt("id"));
                user.setNome(rs.getString("Name"));
                user.setLogin(rs.getString("Login"));
                user.setSenha(rs.getString("Password"));
                user.setCpf(rs.getString("CPF"));
                user.setEmail(rs.getString("Email"));
                user.setGender(rs.getString("Gender"));
                user.setAge(rs.getInt("Age"));
            }
            return user;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
        
        
        
    }
    
    public static void main(String[] args) {
       
    }

    
}
