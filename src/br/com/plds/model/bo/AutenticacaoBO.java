package br.com.plds.model.bo;

import br.com.plds.model.dao.UsuarioDAO;
import br.com.plds.model.vo.Usuario;

public class AutenticacaoBO {
	/* Recebe um usu�rio (usuario,senha) por parametro e compara as informa��es passadas pelo usu�rio com 
	 * as gravadas no banco de dados.
	 */
	public boolean autenticar(Usuario usuario) throws Exception{
		
		String userSender = usuario.getLogin();
		String passEncrypt = CipherBO.encrypt(usuario.getPassword());
		
		UsuarioDAO usuarioDAO = new UsuarioDAO();
		
		String passDB = usuarioDAO.getSenhaByUser(userSender);
		
		return passDB.equals(passEncrypt);
		
	}
	

}
