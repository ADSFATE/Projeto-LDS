package br.com.plds.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import br.com.plds.model.dao.ModemDAO;
import br.com.plds.model.vo.Modem;

@MultipartConfig(fileSizeThreshold=1024*1024*2, // 2MB
maxFileSize=1024*1024*10,      // 10MB
maxRequestSize=1024*1024*50)

public class BaixarModemController extends HttpServlet {
	private static final String SAVE_DIR="dados";
	private static final long serialVersionUID = 1L;

	public BaixarModemController() {
		super();
		
	}

	
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		response.setContentType("text/html;charset=UTF-8");
	    PrintWriter out = response.getWriter();
	        String savePath = "C:" + File.separator + SAVE_DIR;
	            File fileSaveDir=new File(savePath);
	            if(!fileSaveDir.exists()){
	                fileSaveDir.mkdir();
	            }
		
		String nserie = request.getParameter("cmbNserie");
		String cliente = request.getParameter("txtCliente");
		String circuito = request.getParameter("txtNcircuito");
		String nrat = request.getParameter("txtNRAT");
		String ratFrente = request.getParameter("fileRATFrente");
		String ratVerso = request.getParameter("fileRATVerso");
		
        Part part=request.getPart("fileRATFrente");
        String fileName=extractFileName(part);
        part.write(savePath + File.separator + fileName);
		
		Modem m = new Modem();
		m.setNumeroSerie(nserie);
		m.setCliente(cliente);
		m.setNumeroCircuito(circuito);
		m.setNumRat(nrat);
		m.setRatFrente(ratFrente);
		m.setRatVerso(ratVerso);
		
		this.baixarModem(m);
		response.sendRedirect("baixarmodem.jsp");

	}

	public ArrayList<Modem> getModemPorTecnico(String mat) {

		ModemDAO mDAO = new ModemDAO();

		try {
			return mDAO.getModensAtribuidosPorTecnico(mat);
		} catch (ClassNotFoundException | SQLException e) {

			e.printStackTrace();
			return null;
		}

	}

	public boolean baixarModem(Modem m) {

		ModemDAO mDAO = new ModemDAO();
		try {
			return mDAO.darBaixa(m);
		} catch (ClassNotFoundException | SQLException e) {

			e.printStackTrace();
			return false;
		}

	}
	
	private String extractFileName(Part part) {
	    String contentDisp = part.getHeader("content-disposition");
	    String[] items = contentDisp.split(";");
	    for (String s : items) {
	        if (s.trim().startsWith("filename")) {
	            return s.substring(s.indexOf("=") + 2, s.length()-1);
	        }
	    }
	    return "";
	}

}
