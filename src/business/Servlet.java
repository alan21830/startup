package business;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.text.Format;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.PersistenceContext;
import javax.persistence.PersistenceUnit;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.ws.rs.client.Client;
import javax.ws.rs.client.ClientBuilder;
import javax.ws.rs.client.Invocation;
import javax.ws.rs.client.WebTarget;

import org.eclipse.persistence.jpa.jpql.parser.AbstractExpression;
import org.eclipse.persistence.jpa.jpql.parser.DateTime;
import org.eclipse.persistence.oxm.MediaType;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.mysql.jdbc.jdbc2.optional.MysqlDataSource;
import com.sun.xml.xsom.impl.scd.Iterators.Map;

import model.Cliente;

/**
 * Servlet implementation class Servlet
 */
@WebServlet("/Servlet")
public class Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	
	
 
    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Servlet() {
        super();
        
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
 	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	      
		
		
		
		
		String nome =request.getParameter("nome");
		String cognome =request.getParameter("cognome");
		String telefono=request.getParameter("telefono");
		String indirizzo=request.getParameter("indirizzo");
		Timestamp appuntamento;
 
		
		int giorno=0;
		int mese=0; 
		int anno =0;
		int ora=0;
		int minuti=0;
		
		 giorno=Integer.parseInt(request.getParameter("giorno"));
		 mese = Integer.parseInt(request.getParameter("mese"));
		 anno =Integer.parseInt(request.getParameter("anno"));
		 ora = Integer.parseInt(request.getParameter("ora"));
		 minuti =Integer.parseInt(request.getParameter("minuti"));
		
		 
	      
	    
	  appuntamento = java.sql.Timestamp.valueOf(anno+"-"+mese+"-"+giorno+" "+ora+":"+minuti+":0.0");

	    
	     // Cliente cj= new Cliente(nome,cognome,telefono,indirizzo,appuntamento);
 		
		ArrayList <Cliente> listaClienti= new ArrayList<Cliente>();
		
		
		Connection con=null;
		MysqlDataSource  d= new MysqlDataSource();
		d.setDatabaseName("dbordini");
		d.setPortNumber(3306);
		d.setServerName("127.0.0.1");
		d.setUser("root");
		try {
			
			con =d.getConnection();
			Statement st= con.createStatement();
			String qins="INSERT INTO `dbordini`.`clienti` (`NOME`, `COGNOME`, `TELEFONO`, `INDIRIZZO`, APPUNTAMENTO) VALUES ('"+nome+"', '"+cognome+"', '"+telefono+"','"+indirizzo+"','"+appuntamento+"')";
	//	st.executeUpdate(qins);
		
		
		

Client client = ClientBuilder.newClient();
String uri="http://localhost:8081/api";
URL url = new URL("http://localhost:8081/api/getAllclienti");
HttpURLConnection conn = (HttpURLConnection) url.openConnection();

conn.setRequestMethod("GET");
conn.setRequestProperty("Accept", "application/json");
BufferedReader br = new BufferedReader(new InputStreamReader(
		(conn.getInputStream())));

String output;
while ((output = br.readLine()) != null) {
	System.out.println(output);}
  
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
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally
		{
		




HttpSession session = request.getSession();
session.setAttribute("idsList",listaClienti);
RequestDispatcher rd = getServletContext().getRequestDispatcher("/indexred.jsp");
rd.forward(request, response);
		  }
		}
	
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
