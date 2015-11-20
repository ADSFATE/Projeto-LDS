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
					+ "SELECT tipo, fabricante, 'Roteador' AS Especie FROM roteador "
					+ "UNION ALL "
					+ "SELECT tipo, fabricante, 'Gabinete' AS Especie FROM gabinete "
					+ "UNION ALL "
					+ "SELECT tipo, fabricante, 'Cabo' AS Especie FROM cabo ");
			
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
	
	public ArrayList<Material> getcontagemMateriais() throws SQLException{
		
		Connection con = null;

		try {

			con = ConexaoDAO.getConnection();
			ResultSet rs = con.createStatement().executeQuery(
					" SELECT 'Modem' as label, count(*) as value from atr_modem " +
					"union all" +
					" SELECT 'Roteador' as label, count(*) as value from atr_roteador " +
					"union all" + 
					" SELECT 'Gabinete', count(*) as value from atr_gabinete " + 
					"union all" +
					" SELECT 'Cabo', count(*) as value from atr_cabo");
			
			ArrayList<Material> materiais = new ArrayList<>();

			while (rs.next()) {
				Material m = new Material();
				m.setTipo(rs.getString(1));
				m.setQuantidade(rs.getInt(2));
				materiais.add(m);
			}

			return materiais;

		}

		catch (Exception e) {

			con.close();
			return null;

		}
		
	}

	
	public ArrayList<Material> getcontagemMateriaisAtribuidos() throws SQLException{
		
		Connection con = null;

		try {

			con = ConexaoDAO.getConnection();
			ResultSet rs = con.createStatement().executeQuery(
					" SELECT 'Modem' AS label, COUNT(*) AS value FROM atr_modem WHERE status = 'ATRIBUIDO'" +
					"union all" +
					" SELECT 'Roteador' AS label, COUNT(*) AS value FROM atr_roteador WHERE status = 'ATRIBUIDO'" +
					"union all" + 
					" SELECT 'Gabinete' AS label, COUNT(*) AS value FROM atr_gabinete WHERE status = 'ATRIBUIDO'" + 
					"union all" +
					" SELECT 'Cabo' AS label, COUNT(*) AS value FROM atr_cabo WHERE status = 'ATRIBUIDO'");
			
			ArrayList<Material> materiais = new ArrayList<>();

			while (rs.next()) {
				Material m = new Material();
				m.setTipo(rs.getString(1));
				m.setQuantidade(rs.getInt(2));
				materiais.add(m);
			}

			return materiais;

		}

		catch (Exception e) {

			con.close();
			return null;

		}
		
	}
	
	public ArrayList<Material> getcontagemMateriaisBaixados() throws SQLException{
		
		Connection con = null;

		try {

			con = ConexaoDAO.getConnection();
			ResultSet rs = con.createStatement().executeQuery(
					" SELECT 'Modem' AS label, COUNT(*) AS value FROM atr_modem WHERE status = 'BAIXADO'" +
					"union all" +
					" SELECT 'Roteador' AS label, COUNT(*) AS value FROM atr_roteador WHERE status = 'BAIXADO'" +
					"union all" + 
					" SELECT 'Gabinete' AS label, COUNT(*) AS value FROM atr_gabinete WHERE status = 'BAIXADO'" + 
					"union all" +
					" SELECT 'Cabo' AS label, COUNT(*) AS value FROM atr_cabo WHERE status = 'BAIXADO'");
			
			ArrayList<Material> materiais = new ArrayList<>();

			while (rs.next()) {
				Material m = new Material();
				m.setTipo(rs.getString(1));
				m.setQuantidade(rs.getInt(2));
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
