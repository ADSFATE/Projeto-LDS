package br.com.plds.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.plds.model.dao.FabricanteDAO;
import br.com.plds.model.dao.GabineteDAO;
import br.com.plds.model.dao.TecnicoDAO;
import br.com.plds.model.vo.Fabricante;
import br.com.plds.model.vo.Gabinete;
import br.com.plds.model.vo.Tecnico;

/**
 * Servlet implementation class AtribuirModemController
 */
public class AtribuirGabineteController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AtribuirGabineteController() {
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

		GabineteDAO mDAO = new GabineteDAO();
		Gabinete gab = new Gabinete();
		gab.setTipo(tipo);
		gab.setNumeroSerie(numSerie);
		gab.setFabricante(fabricante);
		gab.setMatTecnico(matTecnico);
		
		try {
			mDAO.atribuir(gab);
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}

	}

	public ArrayList<Gabinete> getTiposGabinetes() {

		GabineteDAO mDAO = new GabineteDAO();

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
			return tDAO.getFabricantes("GABINETE");
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
			return null;
		}

	}

}