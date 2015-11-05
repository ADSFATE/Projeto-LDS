package br.com.plds.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.FilenameUtils;

import br.com.plds.model.dao.GabineteDAO;
import br.com.plds.model.vo.Gabinete;

@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
maxFileSize = 1024 * 1024 * 10, // 10MB
maxRequestSize = 1024 * 1024 * 50)
public class BaixarGabineteController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public BaixarGabineteController() {
		super();

	}

	private final String UPLOAD_DIRECTORY = "C:/uploads";

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		try {

			String nserie = "";
			String cliente = "";
			String circuito = "";
			String nrat = "";
			String ratFrente = "";
			String ratVerso = "";

			String dirConst = UPLOAD_DIRECTORY + File.separator + "gabinete";
			Path dirImages = null;

			List<FileItem> multiparts = new ServletFileUpload(
					new DiskFileItemFactory()).parseRequest(request);
			for (FileItem item : multiparts) {

				if (item.isFormField()) {

					switch (item.getFieldName()) {

					case "cmbNserie":
						nserie = item.getString();
						dirImages = Paths.get(dirConst + File.separator
								+ nserie);
						break;
					case "txtCliente":
						cliente = item.getString();
						break;
					case "txtNcircuito":
						circuito = item.getString();
						break;
					case "txtNRAT":
						nrat = item.getString();
						break;

					}

				} else {

					String name = new File(item.getName()).getName();
					String ext = "." + FilenameUtils.getExtension(name);

					if (!Files.exists(dirImages)) {

						File dir = new File(dirImages.toString());
						dir.mkdirs();

					}

					switch (item.getFieldName()) {

					case "fileRATFrente":

						ratFrente = dirImages.toString() + File.separator
								+ "frente" + ext;

						item.write(new File(dirImages.toString()
								+ File.separator + "frente" + ext));
						break;
					case "fileRATVerso":
						ratVerso = dirImages.toString() + File.separator
								+ "verso" + ext;
						item.write(new File(dirImages.toString()
								+ File.separator + "verso" + ext));
						break;
					}

				}
			}

			Gabinete m = new Gabinete();
			m.setNumeroSerie(nserie);
			m.setCliente(cliente);
			m.setNumeroCircuito(circuito);
			m.setNumRat(nrat);
			m.setRatFrente(ratFrente);
			m.setRatVerso(ratVerso);

			this.baixarModem(m);
			response.sendRedirect("baixargabinete.jsp");

		} catch (Exception ex) {
			ex.printStackTrace();
		}

	}

	public ArrayList<Gabinete> getGabinetePorTecnico(String mat) {

		GabineteDAO mDAO = new GabineteDAO();

		try {
			return mDAO.getGabinetesAtribuidosPorTecnico(mat);
		} catch (ClassNotFoundException | SQLException e) {

			e.printStackTrace();
			return null;
			
		}

	}

	public boolean baixarModem(Gabinete m) {

		GabineteDAO mDAO = new GabineteDAO();
		try {
			return mDAO.darBaixa(m);
		} catch (ClassNotFoundException | SQLException e) {

			e.printStackTrace();
			return false;
		}

	}

}
