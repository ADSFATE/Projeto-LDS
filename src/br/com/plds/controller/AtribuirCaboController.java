package br.com.plds.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.plds.model.dao.FabricanteDAO;
import br.com.plds.model.dao.CaboDAO;
import br.com.plds.model.dao.TecnicoDAO;
import br.com.plds.model.vo.Fabricante;
import br.com.plds.model.vo.Cabo;
import br.com.plds.model.vo.Tecnico;

/**
 * Servlet implementation class AtribuirModemController
 */
public class AtribuirCaboController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AtribuirCaboController() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		String tipo = request.getParameter("cmbTipo");
		String numSerie = request.getParameter("txtNserie").trim();
		String fabricante = request.getParameter("cmbFabricante").trim();
		String tecnico = request.getParameter("cmbTecnico");
		String matTecnico = tecnico.split("-")[0];

		CaboDAO mDAO = new CaboDAO();
		Cabo cab = new Cabo();
		cab.setTipo(tipo);
		cab.setNumeroSerie(numSerie);
		cab.setFabricante(fabricante);
		cab.setMatTecnico(matTecnico);
		
		try {
			mDAO.atribuir(cab);
		} catch (ClassNotFoundException | SQLException e) {
			System.out.println(e);
			e.printStackTrace();
		}

	}

	public ArrayList<Cabo> getTiposCabos() {

		CaboDAO mDAO = new CaboDAO();

		try {
			return mDAO.getTipos();
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
			return null;
		}

	}

	public ArrayList<Tecnico> getTecnicos() {

		TecnicoDAO tDAO = new TecnicoDAO();

		try {
			return tDAO.getTecnicos();
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
			return null;
		}

	}

	public ArrayList<Fabricante> getFabricantes() {

		FabricanteDAO tDAO = new FabricanteDAO();

		try {
			return tDAO.getFabricantes("CABO");
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
			return null;
		}

	}

}