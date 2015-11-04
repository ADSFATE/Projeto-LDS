package br.com.plds.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import br.com.plds.model.vo.Roteador;

public class RoteadorDAO {

	public ArrayList<Roteador> getTipos() throws ClassNotFoundException,
			SQLException {

		Connection con = null;

		try {

			con = ConexaoDAO.getConnection();
			ResultSet rs = con.createStatement().executeQuery(
					"SELECT tipo FROM roteador");
			ArrayList<Roteador> tipos = new ArrayList<>();

			while (rs.next()) {
				Roteador m = new Roteador();
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

	public boolean atribuir(Roteador roteador) throws ClassNotFoundException,
			SQLException {

		Connection con = null;
		PreparedStatement st = null;

		try {

			con = ConexaoDAO.getConnection();
			st = con.prepareStatement("INSERT INTO atr_roteador(num_serie,tipo,fabricante,mat_tecnico,status) VALUES(?,?,?,?,'ATRIBUIDO')");
			st.setString(1, roteador.getNumeroSerie());
			st.setString(2, roteador.getTipo());
			st.setString(3, roteador.getFabricante());
			st.setString(4, roteador.getMatTecnico());

			return st.execute();

		} catch (Exception e) {

			// e.printStackTrace();
			st.close();
			con.close();
			return false;

		}

	}

	public boolean cadastrar(Roteador roteador) throws ClassNotFoundException,
			SQLException {

		Connection con = null;
		PreparedStatement st = null;

		try {

			con = ConexaoDAO.getConnection();
			st = con.prepareStatement("INSERT INTO roteador (tipo,fabricante) VALUES(?,?)");
			st.setString(1, roteador.getTipo());
			st.setString(2, roteador.getFabricante());

			return st.execute();

		} catch (Exception e) {

			// e.printStackTrace();
			st.close();
			con.close();
			return false;

		}

	}

	public ArrayList<Roteador> getRoteadoresAtribuidosPorTecnico(String mat)
			throws ClassNotFoundException, SQLException {

		Connection con = null;

		try {

			con = ConexaoDAO.getConnection();
			ResultSet rs = con
					.createStatement()
					.executeQuery(
							"SELECT id_atribuicao,num_serie,tipo,fabricante,mat_tecnico,data_atribuicao,data_baixado,num_circuito"
									+ ",rat_frente,rat_verso,status FROM atr_roteador where mat_tecnico='"
									+ mat + "' AND status ='ATRIBUIDO'");

			ArrayList<Roteador> tipos = new ArrayList<>();

			while (rs.next()) {
				Roteador m = new Roteador();
				m.setIdAtribuicao(rs.getInt(1));
				m.setNumeroSerie(rs.getString(2));
				m.setTipo(rs.getString(3));
				m.setFabricante(rs.getString(4));
				m.setMatTecnico(rs.getString(5));
				m.setDataAtribuicao(rs.getString(6));
				m.setDataBaixado(rs.getString(7));
				m.setNumeroCircuito(rs.getString(8));
				m.setRatFrente(rs.getString(9));
				m.setRatVerso(rs.getString(10));
				m.setStatus(rs.getString(11));
				tipos.add(m);
			}

			return tipos;

		}

		catch (Exception e) {

			con.close();
			return null;

		}

	}

	public boolean darBaixa(Roteador m) throws ClassNotFoundException,
			SQLException {

		Connection con = null;
		PreparedStatement st = null;

		try {

			con = ConexaoDAO.getConnection();
			st = con.prepareStatement("UPDATE atr_roteador SET data_baixado = CURRENT_TIMESTAMP,num_circuito = ?,"
					+ "rat_num= ?,rat_frente= ?,rat_verso= ?,status='BAIXADO',cliente =? WHERE num_serie =?");

			st.setString(1, m.getNumeroCircuito());
			st.setString(2, m.getNumRat());
			st.setString(3, m.getRatFrente());
			st.setString(4, m.getRatVerso());
			st.setString(5, m.getCliente());
			st.setString(6, m.getNumeroSerie());

			return st.execute();

		} catch (Exception e) {

			st.close();
			con.close();
			System.out.println("erro");
			e.printStackTrace();
			return false;

		}

	}

}
