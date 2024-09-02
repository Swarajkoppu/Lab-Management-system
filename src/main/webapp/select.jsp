<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
  
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
	<link rel="stylesheet" href="style.css">
	<style>
  .grid-container {
    display: flex;
    justify-content: space-between;
    gap: 20px; /* Adjust gap between groups */
  }
  .group {
    display: grid;
    grid-template-columns: repeat(3, 100px); /* Adjust width as needed */
    grid-gap: 5px; /* Adjust gap between cells */
  }
  .grid-item {
    border: 1px solid #ccc;
    padding: 5px;
    text-align: center;
  }
  .system-img {
    max-width: 100%;
    max-height: 100%;
  }
</style>
	
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
      <form action="book.jsp" method="post">
      	<div class="grid-container">
         	<div class="group">
    			<%
    			Class.forName("com.mysql.jdbc.Driver");
        		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/labsystem","root","tiger");
        		Statement st=con.createStatement();	
        		ResultSet sys=st.executeQuery("select * from inside");
        		HashSet <Integer>ob=new HashSet <>();
        		while(sys.next())
        		{
        			ob.add(sys.getInt("system"));
        		}
  					for(int i=1;i<31;i++)
  					{
  						if(ob.contains(i))
  						{
							out.println("<img src='asset/monitor.png' width='50' alt='system"+i+"'>");	  							
  						}
  						else
  						{
  							out.println("<input type='radio' id='system"+i+"' name='system' class='hidden-radio' value="+i+"><label for='system"+i+"' class='image-label'><img src='asset/system.png' width='50' alt='system"+i+"'><span class='option-name'>System "+i+"</span></label>");	
  						}
  					}
  				%>
  			</div>
			<div class="group">
     			<%
     			for(int i=31;i<61;i++)
					{
						if(ob.contains(i))
						{
							out.println("<img src='asset/monitor.png' class='image-label hidden-radio' width='60' alt='system"+i+"'>");	
						}
						else
						{
							out.println("<input type='radio' id='system"+i+"' name='system' class='hidden-radio' value="+i+"><label for='system"+i+"' class='image-label'><img src='asset/system.png' width='50' alt='system"+i+"'><span class='option-name'>System "+i+"</span></label>");	
						}
					}
				%>
  			</div>
  			<div class="group">
    			<%
    			for(int i=61;i<91;i++)
					{
						if(ob.contains(i))
						{
							out.println("<img src='asset/monitor.png' width='50' alt='system"+i+"'>");	
						}
						else
						{
							out.println("<input type='radio' id='system"+i+"' name='system' class='hidden-radio' value="+i+"><label for='system"+i+"' class='image-label'><img src='asset/system.png' width='50' alt='system"+i+"'><span class='option-name'>System "+i+"</span></label>");	
						}
					}
  				%>
  			</div>   
        </div>
        <center>
        	<button type="submit" class="btn btn-outline-primary me-2">Book</button>
        </center>
        
      </form>      
</body>
</html>