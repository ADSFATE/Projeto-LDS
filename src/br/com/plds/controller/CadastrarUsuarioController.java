package br.com.plds.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.plds.model.bo.CipherBO;
import br.com.plds.model.dao.UsuarioDAO;
import br.com.plds.model.vo.Usuario;

/**
 * Servlet implementation class CadastrarUsuarioController
 */
public class CadastrarUsuarioController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CadastrarUsuarioController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String login = request.getParameter("txtLogin");
		String senha = request.getParameter("txtSenha");
		String nome = request.getParameter("txtNome");
		
		Usuario usuario = new Usuario();
		usuario.setLogin(login);
		
		try {
			senha = CipherBO.encrypt(senha);
		} catch (Exception e1) {

			e1.printStackTrace();
		}
		
		usuario.setPassword(senha);
		usuario.setNome(nome);
		usuario.setRole("tecnico");

		UsuarioDAO usuarioDAO = new UsuarioDAO();
		
		try {
			
		if(usuarioDAO.cadastrar(usuario)){
			
			response.sendRedirect("cadastroRealizado.jsp");
			
		}
		
		else{
			// pagina de erro

		}
		
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		
	}

}
