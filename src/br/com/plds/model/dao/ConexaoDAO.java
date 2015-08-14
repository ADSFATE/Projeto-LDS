package br.com.plds.model.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConexaoDAO {
	
	private static final String _USER = "root";
	private static final String _PASS = "root";
	
	/*Retorna a conexão com o banco de dados*/
	public static Connection getConnection() throws ClassNotFoundException, SQLException { 

			String url = "jdbc:mysql://localhost:3306/logproj";
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection(url, _USER,_PASS);
			return con;

	}

}
