<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
	try
	{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/account","root","tiger");
		Statement st=con.createStatement();	
		String uname=request.getParameter("uname");
		String pass=request.getParameter("password");
		if(uname.equals("admin") && pass.equals("admin"))
		{
			session.setAttribute("username",uname);
			response.sendRedirect("Home.html");
			session.setAttribute("retry",null);

		}
		else
		{
			response.sendRedirect("index.jsp");
			session.setAttribute("retry","retry");
		}
	}
	catch(Exception e)
	{
		out.println(e);
	}
	%>
</body>
</html>