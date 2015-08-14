package br.com.plds.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import br.com.plds.model.vo.Usuario;

public class UsuarioDAO {

	public boolean cadastrar(Usuario usuario) throws ClassNotFoundException,
			SQLException {

		Connection cn = ConexaoDAO.getConnection();
		PreparedStatement ps = cn
				.prepareStatement("INSERT INTO usuario VALUES(?,?,?)");

		try {
			
			ps.setString(1, usuario.getLogin());
			ps.setString(2, usuario.getPassword());
			ps.setString(3, usuario.getNome());

			if (ps.executeUpdate() == 1) {
				return true;
			} else {
				return false;
			}

		} catch (Exception e) {

			ps.close();
			cn.close();
			return false;

		}

	}

	public String getNomeByUser(String user) {

		return "";

	}

	public String getSenhaByUser(String user) throws ClassNotFoundException,
			SQLException {

		Connection cn = ConexaoDAO.getConnection();
		PreparedStatement ps = cn
				.prepareStatement("SELECT senha FROM usuario WHERE user = ?");

		try {

			ps.setString(1, user);
			ResultSet rs = ps.executeQuery();
			String senha = "";

			while (rs.next()) {

				senha = rs.getString(1);

			}

			return senha;
		} catch (Exception e) {

			ps.close();
			cn.close();
			return "";

		}

	}

}
