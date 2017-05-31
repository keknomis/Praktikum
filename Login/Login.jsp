<%@ page language="java" contentType="text/html; charset=ISO-8859-1"%>
	pageEncoding="ISO-8859-1"%>
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%
String userid=request.getParameter("user"); 
session.putValue("userid",userid); 
String pwd=request.getParameter("pwd"); 
Class.forName("com.mysql.jdbc.Driver"); 
java.sql.Connection con = DriverManager.getConnection("svizec2.informatika.uni-mb.si:3306","s1p1_gradiva","uoo43i"); 
Statement st= con.createStatement(); 
ResultSet rs=st.executeQuery("select * from users where user_id='"+userid+"'"); 
if(rs.next()) 
{ 
if(rs.getString(2).equals(pwd)) 
{ 
out.println("Dobrodošli"+userid); 

} 
else 
{ 
out.println("Napačno geslo poskusite ponovno"); 
} 
} 
 
%>