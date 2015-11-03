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
import br.com.plds.model.dao.TecnicoDAO;
import br.com.plds.model.vo.Fabricante;
import br.com.plds.model.vo.Roteador;
import br.com.plds.model.vo.Tecnico;


public class AtribuirRoteadorController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AtribuirRoteadorController() {
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

		RoteadorDAO mDAO = new RoteadorDAO();
		Roteador roteador = new Roteador();
		roteador.setTipo(tipo);
		roteador.setNumeroSerie(numSerie);
		roteador.setFabricante(fabricante);
		roteador.setMatTecnico(matTecnico);
		try {
			mDAO.atribuir(roteador);
		} catch (ClassNotFoundException | SQLException e) {
			System.out.println(e);
			e.printStackTrace();
		}

	}

	public ArrayList<Roteador> getTiposRoteadores() {

		RoteadorDAO mDAO = new RoteadorDAO();

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
			return tDAO.getFabricantes("ROTEADOR");
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
			return null;
		}

	}

}