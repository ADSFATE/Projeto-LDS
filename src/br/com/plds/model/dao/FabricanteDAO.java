package br.com.plds.model.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import br.com.plds.model.vo.Fabricante;

public class FabricanteDAO {

	public ArrayList<Fabricante> getFabricantes() throws ClassNotFoundException,
			SQLException {

		Connection con = null;

		try {

			con = ConexaoDAO.getConnection();
			ResultSet rs = con.createStatement().executeQuery(
					"SELECT nome FROM fabricante");
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

}
