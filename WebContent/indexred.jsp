<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
    
<%@page import="java.util.*"%>
<%@page import ="model.Cliente" %>
 
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<!doctype html>
<html lang="en">

 
  <head>
  <style>
  
  #shiva
{
  width: 100px;
	height: 100px;
	background: red;
	-moz-border-radius: 50px;
	-webkit-border-radius: 50px;
	border-radius: 50px;
  float:left;
  margin:5px;
}
.count
{
  line-height: 100px;
  color:white;
  margin-left:30px;
  font-size:25px;
}
#talkbubble {
   width: 120px;
   height: 80px;
   background: red;
   position: relative;
   -moz-border-radius:    10px;
   -webkit-border-radius: 10px;
   border-radius:         10px;
  float:left;
  margin:20px;
}
#talkbubble:before {
   content:"";
   position: absolute;
   right: 100%;
   top: 26px;
   width: 0;
   height: 0;
   border-top: 13px solid transparent;
   border-right: 26px solid red;
   border-bottom: 13px solid transparent;
}

.linker
{
  font-size : 20px;
  font-color: black;
}
</style>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" 
integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin=
"anonymous">

   <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity=
"sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"
></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity=
"sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"
></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity=
"sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"
></script>
	
    <title>Hello, world!</title>
  </head>
  
  
  <body>
    
    
    
   <p class="text-justify">Tutti gli appuntamenti</p>
   

    <table class="table">
 		<thead class="thead-dark">
 		<tr>
 		 
 		<th scope="col"> NOME</th>
 		<th scope="col"> COGNOME</th>
 		<th scope="col">TELEFONO </th>
 		<th scope="col"> INDIRIZZO</th>
 		<th scope="col"> APPUNTAMENTO</th>
 		<th></th>
 		</thead>
    
   		<tbody>
    <% List<Cliente> ls = (ArrayList<Cliente>)session.getAttribute("idsList");

    
    for(Cliente cl : ls)
    { %>
      
    <tr>
      <td><%=cl.getNome() %></td>
      <td><%=cl.getCognome() %></td>
      <td><%=cl.getTelefono() %></td>
      <td><%=cl.getIndirizzo() %></td>
      <td><%=cl.getAppuntamento() %></td>
      
      <td>
      <form action="Delete">
      <input type ="hidden" name="del" value="<%=cl.getId()%>" >
      <input type="submit" value="Delete" class= "btn btn-danger">
      </form>
      </td>
    </tr>
   
    
    
    <%}%>
   </tbody>
   </table>
     
<button class="btn btn-success"><a class="linker"
			href="/index.jsp"
			target="_blank"></a> <br /></button>
	

 
  
<br />



</body>

</html>





