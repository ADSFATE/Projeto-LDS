package br.com.plds.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.plds.model.bo.AutenticacaoBO;
import br.com.plds.model.dao.UsuarioDAO;
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
		UsuarioDAO uDAO = new UsuarioDAO();
		
		try {
			
			if(aut.autenticar(user)){
				
				String role = uDAO.getRoleByUser(login);
				
				if(role.equals("supervisor")){
					
					request.getSession().setAttribute("user",login);
					request.getSession().setAttribute("nome",this.primeiroNome(login).toUpperCase());
					request.getSession().setAttribute("role","supervisor");
					request.getRequestDispatcher("painelsup.jsp").forward(request, response);
					
				}
				
				else if(role.equals("tecnico")){
					
					request.getSession().setAttribute("user",login);
					request.getSession().setAttribute("role","tecnico");
					request.getSession().setAttribute("nome",this.primeiroNome(login));
					request.getRequestDispatcher("paineltec.jsp").forward(request, response);
					
				}
					
			}
			else{
				
				request.setAttribute("errorMessage","Usu�rio ou senha incorreto(s)!");
				request.getRequestDispatcher("index.jsp").forward(request, response);
				
			}
			
			
		} catch (Exception e) {

			e.printStackTrace();
		}
		
	}
	
	public String primeiroNome(String login){
		
		UsuarioDAO uDAO = new UsuarioDAO();
		try {
			String[] nome = uDAO.getNomeByUser(login).split(" ");
			return nome[0];
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return "";
		}
		
		
	}

}
