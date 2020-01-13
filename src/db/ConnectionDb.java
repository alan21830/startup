package db;

import java.sql.*;
import java.util.ArrayList;

 

import model.Cliente;

public class ConnectionDb  {
	
/*
	public void deleteUser(int id) throws SQLException {

		Connection con=null;
		MysqlDataSource  d= new MysqlDataSource();
		d.setDatabaseName("dbordini");
		d.setPortNumber(3306);
		d.setServerName("127.0.0.1");
		d.setUser("root");
		d.setPassword("root");
		try {
			con =d.getConnection();
			Statement st= con.createStatement();
			String q= "DELETE FROM `dbordini`.`clienti` WHERE (`ID` = " +id+")"; 
			st.executeUpdate(q);

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}



	}

	public ArrayList<Cliente> listAll(){

		ArrayList<Cliente> lst= new ArrayList<Cliente>();
		
		Connection con=null;
		MysqlDataSource  d= new MysqlDataSource();
		d.setDatabaseName("dbordini");
		d.setPortNumber(3306);
		d.setServerName("127.0.0.1");
		d.setUser("root");
		try {
			con =d.getConnection();
			Statement st= con.createStatement();
			ResultSet rs= st.executeQuery("Select * from clienti");


			while(rs.next())

			{
				int id=rs.getInt("ID");
				String nomen = rs.getString("nome");
				String cognomen=rs.getString("cognome");
				String indirizzon=rs.getString("indirizzo");
				String telefonon=	rs.getString("telefono");
				Timestamp ts=rs.getTimestamp("appuntamento");
				Cliente cl = new Cliente(id,nomen,cognomen,indirizzon,telefonon,ts);
				lst.add(cl);
				
				

			}

			return lst;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return lst;
	}
*/
}