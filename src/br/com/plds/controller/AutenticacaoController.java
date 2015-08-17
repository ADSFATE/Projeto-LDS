package br.com.plds.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.plds.model.bo.AutenticacaoBO;
import br.com.plds.model.vo.Usuario;

/**
 * Servlet implementation class AutenticacaoController
 */
public class AutenticacaoController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String login = request.getParameter("txtLogin");
		String senha = request.getParameter("txtSenha");
		
		Usuario user = new Usuario();
		user.setLogin(login);
		user.setPassword(senha);
		
		AutenticacaoBO aut = new AutenticacaoBO();
		
		try {
			if(aut.autenticar(user)){
				
				request.getRequestDispatcher("painel.jsp").forward(request, response);
				
			}
		} catch (Exception e) {

			e.printStackTrace();
		}

		
	}

}
