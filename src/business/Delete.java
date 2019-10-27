package business;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import db.ConnectionDb;
import model.Cliente;

/**
 * Servlet implementation class Delete
 */
@WebServlet("/Delete")
public class Delete extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Delete() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int idbutton=Integer.parseInt(request.getParameter("del"));

		ArrayList<Cliente> cllst= new ArrayList<Cliente>();
		delete(idbutton);
		ArrayList<Cliente> cl= new ArrayList<Cliente>();
		try {
			
			cl=list();
			HttpSession s= request.getSession();
			s.setAttribute("idsList", cl);
			request.getRequestDispatcher("/indexred.jsp").forward(request, response);

			
			
			
		} catch (SQLException e) {
			 
			e.printStackTrace();
		}





	}

	public ArrayList<Cliente> list() throws SQLException
	{


		ArrayList<Cliente> listaClienti = new ArrayList<Cliente>(); 
		Connection con = DriverManager
				.getConnection("jdbc:mysql://localhost:3306/dbordini","root","root");
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
			listaClienti.add(cl);

		}


	 
return listaClienti;
}
	public void delete(int id)

	{


		try {

			Connection con = DriverManager
					.getConnection("jdbc:mysql://localhost:3306/dbordini","root","root");
			Statement st= con.createStatement();
			String q= "DELETE FROM `dbordini`.`clienti` WHERE (`ID` = " +id+")"; 
			st.executeUpdate(q);


		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
