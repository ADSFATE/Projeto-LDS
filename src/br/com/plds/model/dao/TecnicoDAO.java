package br.com.plds.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import br.com.plds.model.vo.Tecnico;
import br.com.plds.model.vo.Usuario;

public class TecnicoDAO {

	public ArrayList<Tecnico> getTecnicos() throws ClassNotFoundException,
			SQLException {

		Connection con = ConexaoDAO.getConnection();
		ResultSet rs = con.createStatement().executeQuery(
				"SELECT nome,matricula,uf FROM tecnicos");
		ArrayList<Tecnico> tipos = new ArrayList<>();

		while (rs.next()) {
			Tecnico t = new Tecnico();
			t.setNome(rs.getString(1));
			t.setMatricula(rs.getString(2));
			t.setUf(rs.getString(3));
			tipos.add(t);
		}

		return tipos;

	}

	public boolean cadastrar(Tecnico tecnico) throws ClassNotFoundException,
			SQLException {

		Connection cn = ConexaoDAO.getConnection();
		PreparedStatement ps = cn
				.prepareStatement("INSERT INTO tecnicos VALUES(?,?,?)");

		try {

			ps.setString(1, tecnico.getMatricula());
			ps.setString(2, tecnico.getNome());
			ps.setString(3, tecnico.getUf());

			if (ps.executeUpdate() == 1) {
				return true;
			} else {
				return false;
			}

		} catch (Exception e) {

			ps.close();
			cn.close();
			e.printStackTrace();
			return false;

		}

	}

}
