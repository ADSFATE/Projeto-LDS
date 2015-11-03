package br.com.plds.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sun.misc.Request;
import br.com.plds.model.dao.FabricanteDAO;
import br.com.plds.model.dao.ModemDAO;
import br.com.plds.model.dao.TecnicoDAO;
import br.com.plds.model.vo.Fabricante;
import br.com.plds.model.vo.Modem;
import br.com.plds.model.vo.Tecnico;

/**
 * Servlet implementation class AtribuirModemController
 */
public class AtribuirModemController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AtribuirModemController() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		String tipo = request.getParameter("cmbTipo");
		String numSerie = request.getParameter("txtNserie").trim();
		String fabricante = request.getParameter("cmbFabricante").trim();
		String tecnico = request.getParameter("cmbTecnico");
		String atribuir = request.getParameter("btnAtribuirModem");
		String matTecnico = tecnico.split("-")[0];

		ModemDAO mDAO = new ModemDAO();
		Modem modem = new Modem();
		modem.setTipo(tipo);
		modem.setNumeroSerie(numSerie);
		modem.setFabricante(fabricante);
		modem.setMatTecnico(matTecnico);
		try {
			mDAO.atribuir(modem);
		} catch (ClassNotFoundException | SQLException e) {
			System.out.println(e);
			e.printStackTrace();
		}

		// }

	}

	public ArrayList<Modem> getTiposModens() {

		ModemDAO mDAO = new ModemDAO();

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
			return tDAO.getFabricantes("MODEM");
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
			return null;
		}

	}

	// public ArrayList<Modem> getModensAtribuidosPorTecnico(){

	// ModemDAO mDAO = new ModemDAO();
	// ArrayList<Modem> modensAtribuidos =
	// mDAO.getModensAtribuidosPorTecnico(request.)

	// }

}