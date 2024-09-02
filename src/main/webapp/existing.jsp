<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="sendmail.*" %>
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
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/labsystem","root","tiger");
		Statement st=con.createStatement();	
		String email=request.getParameter("email");
		String pass=request.getParameter("password");
		SendEmailServlet mailer=new SendEmailServlet();
		ResultSet ob=st.executeQuery("SELECT * FROM labsystem.userdata where email='"+email+"' and password='"+pass+"';");
		if(ob.next())
		{
			session.setAttribute("email",email);
			response.sendRedirect("select.jsp");
			String message="you have logined in successfully";
			mailer.sendMail(email,message);
		}
		else
		{
			response.sendRedirect("existing.html");
		}
	}
	catch(Exception e)
	{
		out.println(e);
	}
	%>
</body>
</html>