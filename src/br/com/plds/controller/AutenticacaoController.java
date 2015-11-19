package br.com.plds.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.plds.model.bo.AutenticacaoBO;
import br.com.plds.model.dao.MaterialDAO;
import br.com.plds.model.dao.UsuarioDAO;
import br.com.plds.model.vo.Usuario;

import com.google.gson.Gson;

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
		MaterialDAO mDAO = new MaterialDAO();
		String totalMateriaisAtribuidos = "";
				
		try {
			totalMateriaisAtribuidos = new Gson().toJson(mDAO.getcontagemMateriais());
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		try {
			
			if(aut.autenticar(user)){
				
				String role = uDAO.getRoleByUser(login);
				
				if(role.equals("supervisor")){
					
					request.getSession().setAttribute("user",login);				
					request.getSession().setAttribute("role","supervisor");
					String nomeCompleto = "";
					String [] nome = this.nomeUsuario(login);
					for(int i =0;i<= nome.length-1;i++ ){
						nomeCompleto+= " " + nome[i];
					}
					request.getSession().setAttribute("nome",nome[0]);
					request.getSession().setAttribute("nome_completo",nomeCompleto.trim());
					
					totalMateriaisAtribuidos = totalMateriaisAtribuidos.replace("tipo","label");
					totalMateriaisAtribuidos = totalMateriaisAtribuidos.replace("quantidade","value");
					request.getSession().setAttribute("total_mat_atr",totalMateriaisAtribuidos);
					
					request.getRequestDispatcher("painelsup.jsp").forward(request, response);
					
				}
				
				else if(role.equals("tecnico")){
					
					request.getSession().setAttribute("user",login);
					request.getSession().setAttribute("role","tecnico");
					String nomeCompleto = "";
					String [] nome = this.nomeUsuario(login);
					for(int i =0;i<= nome.length-1;i++ ){
						nomeCompleto+= " " + nome[i];
					}
					request.getSession().setAttribute("nome",nome[0]);
					request.getSession().setAttribute("nome_completo",nomeCompleto.trim());
					request.getRequestDispatcher("paineltec.jsp").forward(request, response);
					
				}
					
			}
			else{
				
				request.setAttribute("errorMessage","Usuário ou senha incorreto(s)!");
				request.getRequestDispatcher("index.jsp").forward(request, response);
				
			}
			
			
		} catch (Exception e) {

			e.printStackTrace();
		}
		
	}
	
	public String[] nomeUsuario(String login){
		
		UsuarioDAO uDAO = new UsuarioDAO();
		try {
			return uDAO.getNomeByUser(login).split(" ");
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
			
	}

}
