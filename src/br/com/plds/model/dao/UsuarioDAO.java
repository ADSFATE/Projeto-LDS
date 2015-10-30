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
		PreparedStatement ps = cn.prepareStatement("INSERT INTO usuario VALUES(?,?,?,?)");

		try {

			ps.setString(1, usuario.getLogin());
			ps.setString(2, usuario.getPassword());
			ps.setString(3, usuario.getNome());
			ps.setString(4, usuario.getRole());

			if (ps.executeUpdate() == 1) {
				return true;
			} else {
				return false;
			}
			
		} catch (Exception e) {

			ps.close();
			cn.close();
		//	System.out.println(e);
			return false;

		}

	}

	public String getNomeByUser(String user) throws ClassNotFoundException,
			SQLException {

		Connection cn = ConexaoDAO.getConnection();
		PreparedStatement ps = cn
				.prepareStatement("SELECT nome FROM usuario WHERE user = ?");

		try {

			ps.setString(1, user);
			ResultSet rs = ps.executeQuery();
			String nome = "";

			while (rs.next()) {

				nome = rs.getString(1);

			}

			return nome;

		} catch (Exception e) {

			ps.close();
			cn.close();
			return "";

		}

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

	public String getRoleByUser(String user) throws ClassNotFoundException,
			SQLException {

		Connection cn = ConexaoDAO.getConnection();
		PreparedStatement ps = cn
				.prepareStatement("SELECT role FROM usuario WHERE user = ?");

		try {

			ps.setString(1, user);
			ResultSet rs = ps.executeQuery();
			String role = "";

			while (rs.next()) {

				role = rs.getString(1);

			}

			return role;

		} catch (Exception e) {

			ps.close();
			cn.close();
			return "";

		}

	}

}
