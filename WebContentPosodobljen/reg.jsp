<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Registracija</title>
</head>
<body>

<%@ page import ="java.sql.*" %>
<%
     
   
    String fname = request.getParameter("fname");
    String lname = request.getParameter("lname");
    String email = request.getParameter("email");
    String pwd = request.getParameter("pwd");
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://svizec2.informatika.uni-mb.si:3306/s1p1_gradiva","s1p1_gradiva","uoo43i");
    Statement st = con.createStatement();
    //ResultSet rs;
    int i = st.executeUpdate("insert into uporabniki(Uporabnik_Ime, Uporabnik_Priimek, Uporabnik_Enaslov, Uporabnik_geslo) values ('" + fname + "','" + lname + "','" + email + "','" + pwd + "')");
    if (i > 0) {
        
        response.sendRedirect("registracijaUspesno.html");
       
    } else {
        response.sendRedirect("Login.html");
    }
%>

</body>
</html>