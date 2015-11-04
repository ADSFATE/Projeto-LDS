package br.com.plds.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.plds.model.dao.FabricanteDAO;
import br.com.plds.model.dao.RoteadorDAO;
import br.com.plds.model.vo.Fabricante;
import br.com.plds.model.vo.Roteador;

/**
 * Servlet implementation class CadastrarRoteadorController
 */

public class CadastrarRoteadorController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CadastrarRoteadorController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		String tipo = request.getParameter("txtTipo").trim().toUpperCase();
		String fabricante = request.getParameter("cmbFabricante");

		Roteador r = new Roteador();
		r.setTipo(tipo);
		r.setFabricante(fabricante);

		RoteadorDAO rDAO = new RoteadorDAO();
		try {
			rDAO.cadastrar(r);
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	public ArrayList<Fabricante> getFabricantes() {

		FabricanteDAO tDAO = new FabricanteDAO();

		try {
			return tDAO.getFabricantes("ROTEADOR");
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
			return null;
		}

	}

}
