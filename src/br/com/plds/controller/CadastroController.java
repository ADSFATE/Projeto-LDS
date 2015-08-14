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
 * Servlet implementation class CadastroController
 */
public class CadastroController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CadastroController() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

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

		UsuarioDAO usuarioDAO = new UsuarioDAO();
		try {
			usuarioDAO.cadastrar(usuario);
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}

	}

}
