package controller;

import java.io.IOException;


import java.io.PrintWriter;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dbconnect.Dataconnection;


/**
 * Servlet implementation class DealerPurchaseProduct
 */
@WebServlet("/DealerPurchaseProduct")
public class DealerPurchaseProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	response.setContentType("text/html");
		
	
		PrintWriter out=response.getWriter();
		
		String fid=request.getParameter("fid");
		System.out.println(fid);
		
		String FarmerData=request.getParameter("FarmerData");
		System.out.println(FarmerData);
		
		String FarmerName=request.getParameter("FarmerName");
		System.out.println(FarmerName);
		
		String cropname=request.getParameter("cropname");
		System.out.println(cropname);
		
		String cropquantity=request.getParameter("cropquantity");
		System.out.println(cropquantity);
		
		
		
		String cropFRP=request.getParameter("cropFRP");
		System.out.println(cropFRP);
		
		String totalprice=request.getParameter("totalprice");
		System.out.println(totalprice);
		
	/*	String timeStampp=request.getParameter("timeStampp");
		System.out.println(timeStampp);*/
		
		String cropquality=request.getParameter("cropquality");
		System.out.println(cropquality);
		
		/*String dealerMail=request.getParameter("dealerMail");
		System.out.println(dealerMail);*/
		/*String double=
		
		String totalp=cropFRP * cropquantity;*/
		
	String previousHash="00";
		System.out.println(previousHash);
		
	
	 Date date = new Date();  
	    SimpleDateFormat formatter = new SimpleDateFormat("MM/dd/yyyy");  
	    String timeStampp = formatter.format(date);  
	    System.out.println("Date Format with MM/dd/yyyy : "+timeStampp);  
	
	HttpSession session=request.getSession(false);
	String dealerMail=(String)session.getAttribute("DealerEmail");
	
	ArrayList<String>al=new ArrayList<>();
	al.add(request.getParameter("cropFRP"));
	
	System.out.println(al);
	
String hash=al.toString();





try {
	MessageDigest md=MessageDigest.getInstance("SHA-256");
	 byte[] hashInBytes = md.digest(hash.getBytes(StandardCharsets.UTF_8));
	 StringBuilder sb = new StringBuilder();
     for (byte b : hashInBytes) {
         sb.append(String.format("%02x", b));
     }
   String currentHash=sb.toString();

System.out.println("Blocked is mine.............");


		try {
			Connection con=Dataconnection.getConnection();
		

		String query = "insert into farmerblock(FarmerData,FarmerName,cropname,cropquantity,cropFRP,totalprice,previousHash,currentHash,timeStampp,dealerMail,cropquality,fid) values (?,?,?,?,?,?,?,?,?,?,?,?)";

		
		PreparedStatement psts1 =con.prepareStatement(query);
		psts1.setString(1, FarmerData);
		
		  psts1.setString(2, FarmerName);
		  psts1.setString(3, cropname);
		  psts1.setString(4, cropquantity);
		  psts1.setString(5, cropFRP);
		  psts1.setString(6, totalprice);
		 
		  psts1.setString(7, previousHash);
		  psts1.setString(8, currentHash);
		  psts1.setString(9, timeStampp);
		  psts1.setString(10, dealerMail);
		  psts1.setString(11, cropquality);
		  psts1.setString(12, fid);
			  
			 int i=psts1.executeUpdate();
			
			 if(i>0)
			 {
			  out.println("<script type=\"text/javascript\">");
			   out.println("alert('Block added sucessfully..');");
			   out.println("location='DealerHome.jsp';");
			   out.println("</script>");
			 }
			 else
			 {
				 out.println("<script type=\"text/javascript\">");
				   out.println("alert('invalid information..');");
				   out.println("location='dealerPurchaseProduct.jsp';");
				   out.println("</script>");
			 }
			 con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		try {
			
			
			Connection connection=Dataconnection.getConnection();
			String q="insert into dealerpriceblock (FarmerData,FarmerName,cropname,cropquantity,cropFRP,totalprice,previousHash,timeStampp,dealerMail,cropquality,fid) values(?,?,?,?,?,?,?,?,?,?,?)";
			PreparedStatement psst=connection.prepareStatement(q);
			psst.setString(1, FarmerData);
			
			psst.setString(2, FarmerName);
			psst.setString(3, cropname);
			  psst.setString(4, cropquantity);
			  psst.setString(5, cropFRP);
			  psst.setString(6, totalprice);
			 
			  psst.setString(7, currentHash);
			 
			  psst.setString(8, timeStampp);
			  psst.setString(9, dealerMail);
			  psst.setString(10, cropquality);
			  psst.setString(11, fid);
			  
			  int ii=psst.executeUpdate();
			  if(ii>0)
				 {
				  out.println("<script type=\"text/javascript\">");
				   out.println("alert('Block added sucessfully..');");
				   out.println("location='DealerHome.jsp';");
				   out.println("</script>");
				 }
				 else
				 {
					 out.println("<script type=\"text/javascript\">");
					   out.println("alert('invalid information..');");
					   out.println("location='dealerPurchaseProduct.jsp';");
					   out.println("</script>");
				 }
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	     

} catch (NoSuchAlgorithmException e1) {

	e1.printStackTrace();
}
	}
		
		
	}


