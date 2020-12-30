package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dbconnect.Dataconnection;

/**
 * Servlet implementation class CustomerRequestSubDealer
 */
@WebServlet("/CustomerRequestSubDealer")
public class CustomerRequestSubDealer extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	PrintWriter out=response.getWriter();
	response.setContentType("text/html");
	/*id, FarmerData, FarmerName, cropName, cropQuantity, Quality, Fid, SubDealerMail, CustomerMail*/
	
	String FarmerData=request.getParameter("FarmerData");
	String FarmerName=request.getParameter("FarmerName");
	String cropName=request.getParameter("cropName");
	String cropQuantity=request.getParameter("cropQuantity");
	String Quality=request.getParameter("Quality");
	String Fid=request.getParameter("Fid");
	String SubDealerMail=request.getParameter("SubDealerMail");
	String CustomerMail=request.getParameter("CustomerMail");
	
	System.out.println(FarmerData);
	System.out.println(FarmerName);
	System.out.println(cropName);
	System.out.println(cropQuantity);
	System.out.println(Quality);
	System.out.println(Fid);
	System.out.println(SubDealerMail);
	System.out.println(CustomerMail);
	try {
		Connection con=Dataconnection.getConnection();
		String qq="insert into customerrequestsubdealer(FarmerData,FarmerName,cropName,cropQuantity,Quality,Fid,SubDealerMail,CustomerMail)values (?,?,?,?,?,?,?,?)";
	PreparedStatement ps=con.prepareStatement(qq);

	ps.setString(1, FarmerData);
	ps.setString(2, FarmerName);
	ps.setString(3, cropName);
	ps.setString(4, cropQuantity);
	ps.setString(5, Quality);
	ps.setString(6, Fid);
	ps.setString(7, SubDealerMail);
	ps.setString(8, CustomerMail);
	int i=ps.executeUpdate();
	if(i>0)
	{
		 out.println("<script type=\"text/javascript\">");
		  out.println("alert('Request Send Sucessfully sucessfully..');");
		  out.println("location='CustomerHome.jsp';");
		  out.println("</script>");
	}
	else
	{
		 out.println("<script type=\"text/javascript\">");
		  out.println("alert('Incorrect Data Please Enter Correct Details......');");
		  out.println("location='CustomerRequestSubdealer.jsp';");
		  out.println("</script>");
	}
	} catch (Exception e) {
		e.printStackTrace();
	}
	
	}

}
