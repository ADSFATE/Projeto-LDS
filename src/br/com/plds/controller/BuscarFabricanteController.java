package br.com.plds.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.plds.model.dao.FabricanteDAO;

/**
 * Servlet implementation class BuscarFabricanteController
 */
@WebServlet("/BuscarFabricanteController")
public class BuscarFabricanteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BuscarFabricanteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String nserie = request.getParameter("cmbNserie");
		String especie = request.getParameter("especie");
		
		String fabricante = this.getFabricantesPorMaterial(nserie, especie);
		response.getWriter().write(fabricante);
		
	}
	
	public String getFabricantesPorMaterial(String nserie,String especie){
		
		FabricanteDAO fDAO = new FabricanteDAO();
		
		try {
			return fDAO.getFabricantesPorMaterial(nserie, especie);
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return "";
		}
		
	}

}
