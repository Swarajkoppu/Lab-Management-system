<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="sendmail.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
  
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
	<link rel="stylesheet" href="style.css">
</head>
<body>
<header class="d-flex flex-wrap align-items-center justify-content-center justify-content-md-between py-3 mb-4 border-bottom">
        <div class="col-md-3 mb-2 mb-md-0">
          <a href="/" class="d-inline-flex link-body-emphasis text-decoration-none">
            <img src="asset/anurag-logo-2.png.webp" width="200">
          </a>
        </div>
        <div class="col-md-3 text-end">
            <a href="logout.jsp">
                <button type="button" class="btn btn-outline-primary me-2">Logout</button>
            </a>          
        </div>
      </header>
      <center>
      	<%	
		Class.forName("com.mysql.jdbc.Driver");
 		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/labsystem","root","tiger");
 		Statement st=con.createStatement();	
 		String name=request.getParameter("uname");
 		String password=request.getParameter("password");
 		String email=request.getParameter("email");
 		int i=0;
 		try
 		{
 			i=st.executeUpdate("INSERT INTO `labsystem`.`userdata` (`email`, `name`, `password`) VALUES ('"+email+"', '"+name+"', '"+password+"');");
 		}
 		catch(Exception e)
 		{
 			
 		}
 		if(i!=0)
 		{
 			out.println(email+" you have successfully created account");
 			SendEmailServlet mailer=new SendEmailServlet();
 			String message=name+" you have successfully created account";
 			mailer.sendMail(email,message);
 			out.println("<br><a href='Home.html'><button class='btn btn-primary w-25 py-2 my-3'>Home</button></a>");
 		}
 		else
 		{
 			out.println("account already present");
 			out.println("<br><a href='Home.html'><button class='btn btn-primary w-25 py-2 my-3'>Home</button></a>");
 		}
	%>
      </center>
      
  
</body>
</html>