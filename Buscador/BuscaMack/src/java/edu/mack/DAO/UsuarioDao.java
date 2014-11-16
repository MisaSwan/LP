/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.mack.DAO;

import edu.mack.entity.Usuario;
import java.util.List;
/**
 *
 * @author Myer
 */
public interface UsuarioDao {
    public List<Usuario> listarTodos();
    
    public Usuario obterPorId(String id);
    
    public boolean salvar(Usuario usuario);
    
    public boolean atualizar(Usuario usuario);
    
    public boolean remover(Usuario usuario);
    
    public Usuario obterPorLogin(Usuario usuario);
}
