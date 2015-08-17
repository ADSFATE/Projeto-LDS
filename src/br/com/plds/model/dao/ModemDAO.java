package br.com.plds.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import br.com.plds.model.vo.Modem;

public class ModemDAO {

	public ArrayList<Modem> getTipos() throws ClassNotFoundException,
			SQLException {

		Connection con = null;

		try {

			con = ConexaoDAO.getConnection();
			ResultSet rs = con.createStatement().executeQuery(
					"SELECT tipo FROM modem");
			ArrayList<Modem> tipos = new ArrayList<>();

			while (rs.next()) {
				Modem m = new Modem();
				m.setTipo(rs.getString(1));
				tipos.add(m);
			}

			return tipos;

		}

		catch (Exception e) {

			con.close();
			return null;

		}

	}

	public boolean atribuir(Modem m) throws ClassNotFoundException,
			SQLException {

		Connection con = null;
		PreparedStatement st = null;

		try {
			
			con = ConexaoDAO.getConnection();
			st = con.prepareStatement("INSERT INTO atr_modem (num_serie,tipo,fabricante,mat_tecnico) VALUES(?,?,?,?)");
			st.setString(1,m.getNumeroSerie());
			st.setString(2,m.getTipo());
			st.setString(3,m.getFabricante());
			st.setString(4,m.getMatTecnico());

			return st.execute();

		} catch (Exception e) {
		
			st.close();
			con.close();
			return false;
			
		}

	}

}
