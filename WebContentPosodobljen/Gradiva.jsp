<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Gradivo</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css.css">
<script type="text/javascript" src="JS.js" ></script>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body class="body">
<p align="center" id="ura"></p>
<p align="center">Dobrodosli na nasi strani!</p>


<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="ZacetnaStran.html">Evidence Izposojenega Gradiva</a>
    </div>
    <ul class="nav navbar-nav">
      <li><a href="Gradiva.jsp">Gradivo</a></li>
      <li><a href="DodajGradiva.html">Dodaj Gradivo</a></li>
      <li><a href="Uporabniki.html">Uporabniki</a></li>
      <li><a href="IzposojenoGradivo.html">Izposojeno Gradivo</a></li>
      <li><a href="Onas.html">O nas</a></li>
    </ul>
    <ul class="nav navbar-nav navbar-right">
      <li><a href="Login.html"><span class="glyphicon glyphicon-user"></span> Prijava</a></li>
      <li><a href=Registracija.html><span class="glyphicon glyphicon-log-in"></span> Registracija</a></li>
    </ul>
  </div>
</nav>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<%
String id = request.getParameter("userId");
String driverName = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://svizec2.informatika.uni-mb.si:3306/";
String dbName = "s1p1_gradiva";
String userId = "s1p1_gradiva";
String password = "uoo43i";
try {
Class.forName(driverName);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<h2 align="center"><font><strong>Seznam gradiv</strong></font></h2>
<table align="center" cellpadding="5" cellspacing="5" border="1">
<tr>

</tr>
<tr bgcolor="e7cdcd">

<td><b>Naslov</b></td>
<td><b>Slika</b></td>
<td><b>Avtor</b></td>
<td><b>Lastnik</b></td>
<td><b></b></td>

</tr>
<%
try{ 
connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
statement=connection.createStatement();
String sql ="SELECT * FROM gradivo";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr bgcolor="#DEB887">

<td><%=resultSet.getString("Ime_Gradiva") %></td>
<td><img width="200" height="150" src="<%=resultSet.getString("Slika_Gradiva") %>">
<td><%=resultSet.getString("Avtor_Gradiva") %></td>
<td><%=resultSet.getString("Lastnik_Gradiva") %></td>
<td><a href="Uspesno.html"><button type="button" class="btn btn-success">Rezerviraj</button></a></td>

</tr>

<% 
}
} catch (Exception e) {
e.printStackTrace();
}
%>
</table>


</body>
</html>