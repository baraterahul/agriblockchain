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
 * Servlet implementation class SubDealerBlock
 */
@WebServlet("/SubDealerBlock")
public class SubDealerBlock extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		
		
		PrintWriter out=response.getWriter();
		
		String id=request.getParameter("id");
		System.out.println(id);
		
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
		
		String cropquality=request.getParameter("cropquality");
		System.out.println(cropquality);
		
		String dealerMail=request.getParameter("dealerMail");
		System.out.println(dealerMail);
		
		String SubDealerMail=request.getParameter("Subdealermail");
		System.out.println(SubDealerMail);
		
		
		
	
	 Date date = new Date();  
	    SimpleDateFormat formatter = new SimpleDateFormat("MM/dd/yyyy");  
	    String timeStampp = formatter.format(date);  
	    System.out.println("Date Format with MM/dd/yyyy : "+timeStampp);  
	
	
	
	ArrayList<String>al=new ArrayList<>();
	al.add(request.getParameter("cropFRP"));
	
	System.out.println("Crop price"+al);
	
String hash=al.toString();


try {
	MessageDigest md=MessageDigest.getInstance("SHA-256");
	 byte[] hashInBytes = md.digest(hash.getBytes(StandardCharsets.UTF_8));
	 StringBuilder sb = new StringBuilder();
     for (byte b : hashInBytes) {
         sb.append(String.format("%02x", b));
     }
   String currentHash=sb.toString();
   System.out.println(currentHash);

System.out.println("Blocked is mine.............");


		try {
			Connection con=Dataconnection.getConnection();
		

		String query = "update dealerpriceblock set fid=?, currentHash=? where fid=?";

		
		PreparedStatement psts1 =con.prepareStatement(query);
		psts1.setString(1, fid);
		psts1.setString(2, currentHash);
		psts1.setString(3, fid);
		
		 
			  
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
				   out.println("location='SubdealerPurchaseProduct.jsp';");
				   out.println("</script>");
			 }
			 con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		try {
			
			
			Connection connection=Dataconnection.getConnection();
			String q="insert into subdealerblock (FarmerData,FarmerName,cropname,cropquantity,cropFRP,totalprice,previousHash,timeStampp,dealerMail,cropquality,fid,SubDealerMail) values(?,?,?,?,?,?,?,?,?,?,?,?)";
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
			  psst.setString(12, SubDealerMail);
			  
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
					   out.println("location='SubdealerPurchaseProduct.jsp';");
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