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
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		String login = request.getParameter("txtLogin");
		String senha = request.getParameter("txtSenha");

		Usuario user = new Usuario();
		user.setLogin(login);
		user.setPassword(senha);

		AutenticacaoBO aut = new AutenticacaoBO();
		UsuarioDAO uDAO = new UsuarioDAO();
		MaterialDAO mDAO = new MaterialDAO();
		String totalMateriaisAtribuidos = "";
		String totalMateriaisStatusAtribuido = "";
		String totalMateriaisStatusBaixado = "";

		try {

			if (aut.autenticar(user)) {

				String role = uDAO.getRoleByUser(login);

				if (role.equals("supervisor")) {

					try {
						totalMateriaisAtribuidos = new Gson().toJson(mDAO
								.getcontagemMateriais());
						totalMateriaisStatusAtribuido = new Gson().toJson(mDAO
								.getcontagemMateriaisAtribuidos());
						totalMateriaisStatusBaixado = new Gson().toJson(mDAO
								.getcontagemMateriaisBaixados());
					} catch (SQLException e1) {
						e1.printStackTrace();
					}

					request.getSession().setAttribute("user", login);
					request.getSession().setAttribute("role", "supervisor");

					String nomeCompleto = "";

					String[] nome = this.nomeUsuario(login);
					for (int i = 0; i <= nome.length - 1; i++) {
						nomeCompleto += " " + nome[i];
					}

					request.getSession().setAttribute("nome", nome[0]);
					request.getSession().setAttribute("nome_completo",
							nomeCompleto.trim());

					totalMateriaisAtribuidos = totalMateriaisAtribuidos
							.replace("tipo", "label");
					totalMateriaisAtribuidos = totalMateriaisAtribuidos
							.replace("quantidade", "value");
					totalMateriaisStatusAtribuido = totalMateriaisStatusAtribuido
							.replace("tipo", "label");
					totalMateriaisStatusAtribuido = totalMateriaisStatusAtribuido
							.replace("quantidade", "value");
					totalMateriaisStatusBaixado = totalMateriaisStatusBaixado
							.replace("tipo", "label");
					totalMateriaisStatusBaixado = totalMateriaisStatusBaixado
							.replace("quantidade", "value");

					request.getSession().setAttribute("total_mat_atr",
							totalMateriaisAtribuidos);
					request.getSession().setAttribute("total_sts_atr",
							totalMateriaisStatusAtribuido);
					request.getSession().setAttribute("total_sts_bxo",
							totalMateriaisStatusBaixado);

					request.getRequestDispatcher("painelsup.jsp").forward(
							request, response);

				}

				else if (role.equals("tecnico")) {

					try {
						totalMateriaisAtribuidos = new Gson().toJson(mDAO
								.getcontagemMateriais());
						totalMateriaisStatusAtribuido = new Gson()
								.toJson(mDAO
										.getcontagemMateriaisAtribuidosPorTecnico(login));
						totalMateriaisStatusBaixado = new Gson().toJson(mDAO
								.getcontagemMateriaisBaixadosPorTecnico(login));
					
					} catch (SQLException e1) {
						e1.printStackTrace();
					}

					request.getSession().setAttribute("user", login);
					request.getSession().setAttribute("role", "tecnico");
					String nomeCompleto = "";
					String[] nome = this.nomeUsuario(login);
					for (int i = 0; i <= nome.length - 1; i++) {
						nomeCompleto += " " + nome[i];
					}
					
					totalMateriaisAtribuidos = totalMateriaisAtribuidos
							.replace("tipo", "label");
					totalMateriaisAtribuidos = totalMateriaisAtribuidos
							.replace("quantidade", "value");
					totalMateriaisStatusAtribuido = totalMateriaisStatusAtribuido
							.replace("tipo", "label");
					totalMateriaisStatusAtribuido = totalMateriaisStatusAtribuido
							.replace("quantidade", "value");
					totalMateriaisStatusBaixado = totalMateriaisStatusBaixado
							.replace("tipo", "label");
					totalMateriaisStatusBaixado = totalMateriaisStatusBaixado
							.replace("quantidade", "value");

					request.getSession().setAttribute("total_mat_atr",
							totalMateriaisAtribuidos);
					request.getSession().setAttribute("total_sts_atr",
							totalMateriaisStatusAtribuido);
					request.getSession().setAttribute("total_sts_bxo",
							totalMateriaisStatusBaixado);
					
					request.getSession().setAttribute("nome", nome[0]);
					request.getSession().setAttribute("nome_completo",
							nomeCompleto.trim());
					request.getRequestDispatcher("paineltec.jsp").forward(
							request, response);

				}

			} else {

				request.setAttribute("errorMessage",
						"Usuário ou senha incorreto(s)!");
				request.getRequestDispatcher("index.jsp").forward(request,
						response);

			}

		} catch (Exception e) {

			e.printStackTrace();
		}

	}

	public String[] nomeUsuario(String login) {

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
