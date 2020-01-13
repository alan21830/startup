
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.util.*"%>
<%@page import="model.Cliente"%>
<%@page import="java.util.*"%>
 
<%@page import="java.sql.*"%>
<%@page import="java.io.IOException"%>
<%@page import=" java.sql.Connection"%>
<%@page import="java.sql.Date"%>
<%@page import="java.sql.Statement"%>
<%@pageimport="java.net.HttpURLConnection"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Date"%>
<%@page import="java.sql.SQLException"%>
<%@page import="db.ListThread" %>


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
	background-color: white;
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


<title>Home</title>
</head>

<body class="container-fluid" style="background-color: #fdf9f9;">
	<div class="jumbotron">
		<h1></h1>



		<form method="get" action="Servlet">
			<div class="form-group">
				<div class="cal">
					<ul id="menu">
						<li>
							<p class="text-cal">Giorno</p> <select name="giorno"
							class="form-control
								onchange="call()">
								<%
										for (int i = 1; i < 32; i++) {
									%>
								<option value="<%=i%>">
									<%=i%>
								</option>
								<%
										}
									%>
						</select>

						</li>
						<li>
							<p class="text-cal">Mese</p> <select name="mese"
							class="form-control" onchange="call()">
								<%
										for (int i = 1; i < 13; i++) {
									%>
								<option value="<%=i%>">
									<%=i%>
								</option>
								<%
										}
									%>
						</select>

						</li>

						<li>


							<p class="text-cal">Anno</p> <select name="anno"
							class="form-control">
								<%
										for (int i = 2018; i < 2030; i++) {
									%>

								<option value="<%=i%>" name="anno">
									<%=i%>
								</option>

								<%
										}
									%>

						</select>

						</li>

						<li>

							<p class="text-cal">Ora</p> <select name="ora"
							class="form-control">
								<%
										for (int i = 9; i < 20; i++) {
									%>
								<option value="<%=i%>" name="anno">
									<%=i%>

								</option>
								<%
										}
									%>
						</select>

						</li>
						<li>

							<p class="text-cal">Minuti</p> <select name="minuti"
							class="form-control">
								<%
										for (int i = 0; i < 60; i += 15) {
									%>
								<option value="<%=i%>">
									<%=i%>
								</option>
								<%
										}
									%>
						</select>

						</li>
					</ul>
				</div>
			</div>




			<div class="jumbotron">

				<div class="form-group">
					<label for="exampleInputEmail1">Nome </label> <input type="text"
						class="form-control is-invalid" id="exampleInputEmail1"
						aria-describedby="emailHelp" placeholder="Enter nome" name="nome" required>
					<small id="emailHelp" class="form-text text-muted"></small>
				</div>



				<div class="form-group">
					<label for="exampleInputEmail2">Cognome </label> <input type="text"
						class="form-control is-invalid" id="exampleInputEmail2"
						aria-describedby="emailHelp" placeholder="Enter cognome"
						name="cognome" required>

				</div>



				<div class="form-group">
					<label for="exampleInputEmail3">Telefono </label> <input
						type="text" class="form-control" id="exampleInputEmail3"
						aria-describedby="emailHelp" placeholder="Enter telefono"
						name="telefono" required>

				</div>


				<div class="form-group">
					<label for="exampleInputPassword4">Indirizzo</label> <input
						type="text" class="form-control is-invalid"
						id="exampleInputPassword4" placeholder="indirizzo"
						name="indirizzo" required>
				</div>
				
				 <div class="form-group"> <!-- Date input -->
        <label class="control-label" for="date">Date</label>
        <input class="form-control" id="date" name="date" placeholder="MM/DD/YYY" type="text" required/>
      </div>
      

				<button type="submit" class="btn btn-primary">Inserisci</button>

				<%-- fine jumbotron --%>
			</div>
		</form>


		<%
		ArrayList<Cliente> listaClienti= new ArrayList<Cliente>();
		try {
			Class.forName("com.mysql.jdbc.Driver"); 
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbordini","root","root");
		 
		Statement st = con.createStatement();

		 

		String fet = "SELECT * FROM dbordini.clienti;";

		ResultSet rs = st.executeQuery(fet);

		 
		while (rs.next())

		{

			int id = rs.getInt("ID");
			String nomen = rs.getString("nome");
			String cognomen = rs.getString("cognome");
			String indirizzon = rs.getString("indirizzo");
			String telefonon = rs.getString("telefono");
			Timestamp ts = rs.getTimestamp("appuntamento");

			System.out.println("\n" + nomen);
			System.out.println("\n" + cognomen);
			System.out.println("\n" + indirizzon);
			System.out.println("\n" + telefonon);

			Cliente cl = new Cliente(id, nomen, cognomen, indirizzon, telefonon, ts);

			 
			listaClienti.add(cl);

		}
		}catch(Exception e) {}
       
      
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
					for (Cliente cl : listaClienti) {
				%>

				<tr>
					<td><%=cl.getNome()%></td>
					<td><%=cl.getCognome()%></td>
					<td><%=cl.getTelefono()%></td>
					<td><%=cl.getIndirizzo()%></td>
					<td><%=cl.getAppuntamento()%></td>
				</tr>



				<%
					}
				%>
			</tbody>
		</table>
		<%
		int j=0;
		int k=0;
		while(j>100)
		{%>

		<p><%=j%></p>

		<%j++; Thread.sleep(500);} %>
 <a href="/webappdb/indexred.jsp"><button class="btn btn-primary">MOSTRA APPUNTAMENTI</button> </a>


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
			<script>
    $(document).ready(function(){
      var date_input=$('input[name="date"]'); //our date input has the name "date"
      var container=$('.bootstrap-iso form').length>0 ? $('.bootstrap-iso form').parent() : "body";
      var options={
        format: 'mm/dd/yyyy',
        container: container,
        todayHighlight: true,
        autoclose: true,
      };
      date_input.datepicker(options);
    })
</script>
</body>

</html>





