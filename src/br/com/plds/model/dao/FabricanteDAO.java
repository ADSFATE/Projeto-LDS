package br.com.plds.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import br.com.plds.model.vo.Fabricante;

public class FabricanteDAO {

	public ArrayList<Fabricante> getFabricantes(String material)
			throws ClassNotFoundException, SQLException {

		Connection con = null;

		try {

			con = ConexaoDAO.getConnection();
			ResultSet rs = con.createStatement().executeQuery(
					"SELECT nome FROM fabricante WHERE material='" + material
							+ "'");
			ArrayList<Fabricante> tipos = new ArrayList<>();

			while (rs.next()) {
				Fabricante f = new Fabricante();
				f.setNome(rs.getString(1));
				tipos.add(f);
			}

			return tipos;

		}

		catch (Exception e) {

			con.close();
			return null;

		}

	}

	public String getFabricantesPorMaterial(String tipo,String especie)
			throws ClassNotFoundException, SQLException {

		Connection con = null;

		try {

			con = ConexaoDAO.getConnection();
			
			String query = "";
			
			switch(especie){
			
			case "MODEM":
				query = "SELECT fabricante FROM modem WHERE tipo='" + tipo + "'";
			break;
			case "ROTEADOR":
				query = "SELECT fabricante FROM roteador WHERE tipo='" + tipo + "'";
				break;
			case "GABINETE":
				query = "SELECT fabricante FROM gabinete WHERE tipo='" + tipo + "'";
				break;
			case "CABO":
				query = "SELECT fabricante FROM cabo WHERE tipo='" + tipo + "'";
				break;
			
			}
			
			ResultSet rs = con.createStatement().executeQuery(query);
			String fab = "";

			while (rs.next()) {
				fab = rs.getString(1);
			}

			return fab;

		}

		catch (Exception e) {

			con.close();
			return null;

		}

	}

	public boolean cadastrar(Fabricante fab) throws SQLException {

		Connection con = null;
		PreparedStatement st = null;

		try {

			con = ConexaoDAO.getConnection();
			st = con.prepareStatement("INSERT INTO fabricante (nome,material) VALUES(?,?)");
			st.setString(1, fab.getNome());
			st.setString(2, fab.getMaterial());
			;
			return st.execute();

		} catch (Exception e) {

			// e.printStackTrace();
			st.close();
			con.close();
			return false;

		}

	}

}
