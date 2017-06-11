<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%@ page import ="java.sql.*" %>
<%
     
   
    String ImeGradiva = request.getParameter("ImeGradiva");
    String SlikaGradiva = request.getParameter("SlikaGradiva");
    String AvtorGradiva = request.getParameter("AvtorGradiva");
    String LastnikGradiva = request.getParameter("LastnikGradiva");
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://svizec2.informatika.uni-mb.si:3306/s1p1_gradiva","s1p1_gradiva","uoo43i");
    Statement st = con.createStatement();
    //ResultSet rs;
    int i = st.executeUpdate("insert into gradivo(Ime_Gradiva, Slika_Gradiva, Avtor_Gradiva, Lastnik_Gradiva) values ('" + ImeGradiva + "','" + SlikaGradiva + "','" + AvtorGradiva + "','" + LastnikGradiva + "')");
    if (i > 0) {
        
        response.sendRedirect("Gradiva.jsp");
       
    } else {
        response.sendRedirect("DodajGradiva.html");
    }
%>

</body>
</html>