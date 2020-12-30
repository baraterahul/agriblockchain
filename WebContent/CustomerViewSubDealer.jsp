<%@page import="dbconnect.Dataconnection"%>

<%@page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Agriculture Blockchain</title>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <meta name="viewport" content="width=device-width, initial-scale=1">
<style>
a {
  text-decoration: none;
  display: inline-block;
  padding: 8px 16px;
}

a:hover {
  background-color: #ddd;
  color: black;
}

.previous {
  background-color: #f1f1f1;
  color: black;
}

.next {
  background-color: #4CAF50;
  color: white;
}

.round {
  border-radius: 50%;
}
</style>
</head>
<body>
<div class="container">
  <h2>View Sub Dealers</h2>
  <p></p>  
 
   
  <input class="form-control" id="myInput" type="text" placeholder="Search..">
  <br>
  
 <a href="CustomerHome.jsp" class="previous">&laquo; Back</a>

  <a href="CustomerLogout" class="previous">&laquo; Logout</a>
  
  
			 <%
			String id=request.getParameter("id");
			 System.out.print(id);
			 
 
  
						String qry = "select * from subdealerregister";
									
												Connection c=Dataconnection.getConnection();
													PreparedStatement pst=c.prepareStatement(qry);
													
													%>
													
													<%
													ResultSet rset = pst.executeQuery(); 
													%>	
													
						
  <table class="table table-bordered table-striped">
    <thead>
      <tr>
      <th>Id</th>
        <th>First Name</th>
        <th>Last Name</th>
       <th>Address</th>
        <th>Phone</th>
         <th>Email</th>
        <th>Purchase</th>
       
           
      </tr>
    </thead>
  
    <tbody id="myTable">
     <% 
								 
							
								  while(rset.next())
									  
									
								 
								 {%>
								 <tr>
									<th scope="row"><%=rset.getString(1)%></th>
									<th><%=rset.getString(2)%></th>
									<th><%=rset.getString(3)%></th>
									<th><%=rset.getString(4)%></th>
								
									<th><%=rset.getString(5)%></th>
									<th><%=rset.getString(6)%></th>
								
									<td><a href="CustomerPurchaseProduct.jsp?id=<%=rset.getString(1)%>">View Products</a></td> 
									
									<%}%>
									</tr>
								
    </tbody>
  </table>
  
  
</div>

<script>
$(document).ready(function(){
  $("#myInput").on("keyup", function() {
    var value = $(this).val().toLowerCase();
    $("#myTable tr").filter(function() {
      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
    });
  });
});
</script>
</body>
</html>