package business;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.text.Format;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.servlet.http.HttpSession;
 
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
 
 

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
    
public static boolean verificaCf(String cf) {
		
		String reg="[a-zA-z]{6}\\d\\d[a-zA-Z]\\d\\d[a-zA-Z]\\d\\d\\d[a-zA-Z]";
		Pattern p=   Pattern.compile(reg);
		Matcher matcher =p.matcher(cf);
		boolean ris=matcher.matches();
		return ris;
			
	}
 	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//
		String nome =request.getParameter("nome");
		String cognome =request.getParameter("cognome");
		String telefono=request.getParameter("telefono");
		String indirizzo=request.getParameter("indirizzo");
		boolean cf= true;//verificaCf(indirizzo);
		
		if(!cf)
		{
			
			request.setAttribute("cf", cf);
			RequestDispatcher rd=request.getRequestDispatcher("/index.jsp");
			  rd.forward(request, response);
		
		}
		else {
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
		
		 try {
			  Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e1) {
			
			e1.printStackTrace();
		}
         
      
	
		
//		Connection con=null;
//		MysqlDataSource  d= new MysqlDataSource();
//		d.setDatabaseName("dbordini");
//		d.setPortNumber(3306);
//		d.setServerName("127.0.0.1");
//		d.setUser("root");
//		d.setPassword("root");
		try {
			Connection con = DriverManager
		             .getConnection("jdbc:mysql://localhost:3306/dbordini","root","root");
			//con =d.getConnection();
			Statement st= con.createStatement();
			String qins="INSERT INTO `dbordini`.`clienti` (`NOME`, `COGNOME`, `TELEFONO`, `INDIRIZZO`, APPUNTAMENTO) VALUES ('"+nome+"', '"+cognome+"', '"+telefono+"','"+indirizzo+"','"+appuntamento+"')";
		st.executeUpdate(qins);
  
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
	
 	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		if (username.equalsIgnoreCase("aaaa") && password.equalsIgnoreCase("bbb"))
		{
		RequestDispatcher rd= request.getRequestDispatcher("/index.jsp");
		rd.forward(request, response);
		}else {
			HttpSession session= request.getSession();
		session.setAttribute("message", "User inesistente");
		RequestDispatcher rd= request.getRequestDispatcher("/login.jsp");
rd.forward(request, response);
		}
	}

}
