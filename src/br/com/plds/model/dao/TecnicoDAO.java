package br.com.plds.model.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import br.com.plds.model.vo.Tecnico;

public class TecnicoDAO {
	
public ArrayList<Tecnico> getTecnicos() throws ClassNotFoundException, SQLException{
		
		Connection con = ConexaoDAO.getConnection();
		ResultSet rs = con.createStatement().executeQuery("SELECT nome,matricula,uf FROM tecnicos");
		ArrayList<Tecnico> tipos = new ArrayList<>();
		
		while(rs.next()){
			Tecnico t = new Tecnico();
			t.setNome(rs.getString(1));
			t.setMatricula(rs.getString(2));
			t.setUf(rs.getString(3));
			tipos.add(t);
		}
			
		return tipos;
		
	}

}
