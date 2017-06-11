<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>Evidenca izposojenega gradiva</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <script type="text/javascript" src="JS.js" ></script>
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
      <li><a href="Gradivo.html">Gradivo</a></li>
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
<h2 align="center"><font><strong>Seznam uporabnikov</strong></font></h2>
<table align="center" cellpadding="5" cellspacing="5" border="1">
<tr>

</tr>
<tr bgcolor="e7cdcd">
<td><b>id</b></td>
<td><b>Ime</b></td>
<td><b>Priimek</b></td>
<td><b>Enaslov</b></td>
<td><b>geslo</b></td>
</tr>
<%
try{ 
connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
statement=connection.createStatement();
String sql ="SELECT * FROM uporabniki";

resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr bgcolor="#DEB887">

<td><%=resultSet.getString("idUporabniki") %></td>
<td><%=resultSet.getString("Uporabnik_Ime") %></td>
<td><%=resultSet.getString("Uporabnik_Priimek") %></td>
<td><%=resultSet.getString("Uporabnik_Enaslov") %></td>
<td><%=resultSet.getString("Uporabnik_geslo") %></td>

</tr>

<% 
}

} catch (Exception e) {
e.printStackTrace();
}
%>
</table>


<h2 align="center"><font><strong>Seznam Administratorjev</strong></font></h2>
<table align="center" cellpadding="5" cellspacing="5" border="1">
<tr>

</tr>
<tr bgcolor="e7cdcd">
<td><b>id</b></td>
<td><b>Ime</b></td>
<td><b>Priimek</b></td>
<td><b>Enaslov</b></td>

</tr>
<%
try{ 
connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
statement=connection.createStatement();
String sql ="SELECT * FROM administrator";

resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr bgcolor="#DEB887">

<td><%=resultSet.getString("idAdministrator") %></td>
<td><%=resultSet.getString("Administrator_Ime") %></td>
<td><%=resultSet.getString("Administrator_Priimek") %></td>
<td><%=resultSet.getString("Administrator_Enaslov") %></td>


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
