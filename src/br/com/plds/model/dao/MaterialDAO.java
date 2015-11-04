package br.com.plds.model.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import br.com.plds.model.vo.Material;

public class MaterialDAO {
	
	public ArrayList<Material> getListaMateriais() throws SQLException{
		
		Connection con = null;

		try {

			con = ConexaoDAO.getConnection();
			ResultSet rs = con.createStatement().executeQuery(
					"SELECT tipo, fabricante, 'Modem' AS Especie FROM modem "
					+ "UNION ALL "
					+ "SELECT tipo, fabricante, 'Roteador' AS Especie FROM roteador");
			
			ArrayList<Material> materiais = new ArrayList<>();

			while (rs.next()) {
				Material m = new Material();
				m.setTipo(rs.getString(1));
				m.setFabricante(rs.getString(2));
				m.setEspecie(rs.getString(3));
				materiais.add(m);
			}

			return materiais;

		}

		catch (Exception e) {

			con.close();
			return null;

		}
		
	}

}
