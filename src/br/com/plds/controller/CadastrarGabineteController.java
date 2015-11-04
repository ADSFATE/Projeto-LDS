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
import br.com.plds.model.vo.Fabricante;
import br.com.plds.model.vo.Gabinete;

/**
 * Servlet implementation class CadastrarModemController
 */
public class CadastrarGabineteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CadastrarGabineteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String tipo = request.getParameter("txtTipo").trim().toUpperCase();
		String fabricante = request.getParameter("cmbFabricante");	
		
		Gabinete m = new Gabinete();
		m.setTipo(tipo);
		m.setFabricante(fabricante);
		
		GabineteDAO mDAO = new GabineteDAO();
		
		try {
			mDAO.cadastrar(m);
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
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
