    <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import ="java.sql.Timestamp"%>
<%@page import="java.util.*"%>
<%@page import="model.Cliente"%>
<%@page import="java.util.*"%>
<%@page import="com.mysql.jdbc.jdbc2.optional.MysqlDataSource"%>

<%@page import="java.io.IOException"%>
<%@page import=" java.sql.Connection"%>
<%@page import="java.sql.Date"%>
<%@page import="java.sql.Statement"%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Date" %>
<%@page import="java.sql.SQLException" %>


<!doctype html>
<html lang="en">
<head>


<style>
* {
	box-sizing: border-box;
}

label {
	color: #2a7dd0 !important;
}

p.text-cal {
	color: #2a7dd0 !important;
}

li {
	display: inline;
	float: left;
	margin-left: 10px;
}

body {
	background-size: cover;
	background-image: url("comune.png");
	background-color:white;
	background-repeat: no-repeat;
}

.cal {
	display: table;
}
</style>


<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">

<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
	integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
	integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
	crossorigin="anonymous"></script>

<title>Hello, world!</title>
</head>
<body class="container-fluid" style="background-color: #fdf9f9;">
<div class="jumbotron">
	<h1>CSS Calendar</h1>




	<a class="linker"
		href="
http://www.i-visionblog.com/2014/11/jquery-animated-number-counter-from-zero-to-value-jquery-animation.html"
		target="_blank"></a>
	<br />
	
	
	<form method="get" action="Servlet">
		<div class="cal">
			<ul id="menu">
				<li>
				<div class="jumbotron">
				
					<p class="text-cal">Giorno</p> <select name="giorno"
					onchange="call()">
						<% for (int i=1 ; i < 32; i++) {
    	 %>
						<option value="<%=i%>" name="mese">
							<%=i %>
						</option>
						<% } %>
				</select>
				</div>
				</li>
				<li><div class="jumbotron">
				

					<p class="text-cal">Mese</p> <select name="mese" onchange="call()">
						<% for (int i=1; i < 13; i++) {
    	 %>
						<option value="<%=i%>">
							<%=i %>
						</option>
						<% } %>
				</select>
				</div>
				</li>
				
				<li>
				<div class="jumbotron">
				
					<p class="text-cal">Anno</p> <select name="anno">
						<%for (int i=2018;i<2030;i++){ %>

						<option value="<%=i%>" name="anno">
							<%=i %>
						</option>

						<%}%>

				</select>
				</div>
				</li>

				<li>
				<div class="jumbotron">
				
					<p class="text-cal">Ora</p> <select name="ora">
						<%for(int i=9;i<20;i++){ %>
						<option value="<%=i%>" name="anno">
							<%=i %>

						</option>
						<%} %>
				</select>
				</div>
				</li>
				<li>
				<div class="jumbotron">
					<p class="text-cal">Minuti</p> <select name="minuti">
						<%for(int i=0;i<60;i+=15){ %>
						<option value="<%=i %>">
							<%=i %>
						</option>
						<%} %>
				</select>
				</div>
				</li>
			</ul>
		</div>

</div>

<div class="jumbotron">

		<div class="form-group">
			<label for="exampleInputEmail1">Nome </label> <input type="text"
				class="form-control is-invalid" id="exampleInputEmail1"
				aria-describedby="emailHelp" placeholder="Enter nome" name="nome">
			<small id="emailHelp" class="form-text text-muted"></small>
		</div>
</div>
<div class="jumbotron">

		<div class="form-group">
			<label for="exampleInputEmail2">Cognome </label> <input type="text"
				class="form-control is-invalid" id="exampleInputEmail2"
				aria-describedby="emailHelp" placeholder="Enter cognome"
				name="cognome">

		</div>
		</div>
<div class="jumbotron">

		<div class="form-group">
			<label for="exampleInputEmail3">Telefono </label> <input type="text"
				class="form-control" id="exampleInputEmail3"
				aria-describedby="emailHelp" placeholder="Enter telefono"
				name="telefono">

		</div>

</div>
<div class="jumbotron">

		<div class="form-group">
			<label for="exampleInputPassword4">Indirizzo</label> <input
				type="text" class="form-control is-invalid"
				id="exampleInputPassword4" placeholder="indirizzo" name="indirizzo">
		</div>



		<button type="submit" class="btn btn-primary">Submit</button>
	</form>
</div>

	<%
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
	

	/* Date d= new Date();
	String oggi= d.getTime().toString(); */
	
String fet="SELECT * FROM dbordini.clienti";
	
	
	ResultSet rs= st.executeQuery(fet);
	

	while(rs.next())
		
	{
		
		int id= rs.getInt("ID");
		String nomen = rs.getString("nome");
		String cognomen=rs.getString("cognome");
		String indirizzon=rs.getString("indirizzo");
		String telefonon=	rs.getString("telefono");
		Timestamp ts= rs.getTimestamp("appuntamento");
		 
		
		

		
		System.out.println("\n"+nomen);
		System.out.println("\n"+cognomen);
		System.out.println("\n"+indirizzon);
		System.out.println("\n"+telefonon);
		
		Cliente cl = new Cliente(id,nomen,cognomen,indirizzon,telefonon,ts);
		
		listaClienti.add(cl);
		
		
		
	}
	
	
} catch (SQLException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
}



%>

	<p class="text-justify">Tutti gli appuntamenti</p>


	<table class="table">
		<thead class="thead-dark">
			<tr>

				<th scope="col">NOME</th>
				<th scope="col">COGNOME</th>
				<th scope="col">TELEFONO</th>
				<th scope="col">INDIRIZZO</th>
				<th scope="col">APPUNTAMENTO</th>
		</thead>

		<tbody>
			<% 

    
    for(Cliente cl : listaClienti)
    { %>

			<tr>
				<td><%=cl.getNome() %></td>
				<td><%=cl.getCognome() %></td>
				<td><%=cl.getTelefono() %></td>
				<td><%=cl.getIndirizzo() %></td>
				<td><%=cl.getAppuntamento()%></td>
			</tr>



			<%}%>
		</tbody>
	</table>
</body>

</html>





