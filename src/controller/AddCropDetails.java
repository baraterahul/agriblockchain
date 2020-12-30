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
 * Servlet implementation class AddCropDetails
 */
@WebServlet("/AddCropDetails")
public class AddCropDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");

		PrintWriter out = response.getWriter();
		
		
		String farmerEmail=request.getParameter("farmerEmail");
		System.out.println(farmerEmail);
		
		String cropname=request.getParameter("cropname");
		System.out.println(cropname);
		
		String cropquantity=request.getParameter("cropquantity");
		System.out.println(cropquantity);
	
		String cropquality=request.getParameter("cropquality");
		System.out.println(cropquality);
		
		String location=request.getParameter("location");
		System.out.println(location);
		
		String marketname=request.getParameter("mname");
		System.out.println(marketname);
		
		String dealerName=request.getParameter("dealerName");
		System.out.println(dealerName);
		
		String FarmerData=request.getParameter("FarmerData");
		System.out.println(FarmerData);
		
		
try {
			
			Connection con=Dataconnection.getConnection();
			String query="insert into cropdetails(farmerEmail,cropname,cropquantity,cropquality,location,marketname,dealerName,FarmerData) values (?,?,?,?,?,?,?,?)";
PreparedStatement pst=con.prepareStatement(query);
pst.setString(1, farmerEmail);
pst.setString(2, cropname);
pst.setString(3, cropquantity);
pst.setString(4, cropquality);
pst.setString(5, location);
pst.setString(6, marketname);
pst.setString(7, dealerName);
pst.setString(8, FarmerData);
int i=pst.executeUpdate();
if(i>0)
{
 out.println("<script type=\"text/javascript\">");
  out.println("alert('Request Send sucessfully..');");
  out.println("location='farmerhome.jsp';");
  out.println("</script>");
}
else
{
	 out.println("<script type=\"text/javascript\">");
	   out.println("alert('Incorrect details..');");
	   out.println("location='FarmerSellProduct.jsp';");
	   out.println("</script>");
}
	} catch (Exception e) {
			e.printStackTrace();
		}

		
	}
	}


