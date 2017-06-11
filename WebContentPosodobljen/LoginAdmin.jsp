<%@ page language="java" contentType="text/html; charset=ISO-8859-1"%>
	pageEncoding="ISO-8859-1"%>
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%
String email=request.getParameter("email"); 
session.putValue("email",email); 
String pwd=request.getParameter("pwd"); 
Class.forName("com.mysql.jdbc.Driver"); 
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://svizec2.informatika.uni-mb.si:3306/s1p1_gradiva","s1p1_gradiva","uoo43i"); 
Statement st= con.createStatement(); 
ResultSet rs=st.executeQuery("select Administrator_Enaslov,Administrator_geslo from administrator where Administrator_Enaslov='"+email+"'"); 
if(rs.next()) 
{ 
if(rs.getString(2).equals(pwd)) 
{ 
	response.sendRedirect("PrijavaUspesno.html");  

} 
else 
{ 
	response.sendRedirect("NapacnoGesloAdmin.html"); 
} 
}else
	response.sendRedirect("NapacnoGesloAdmin.html"); 
 
%>