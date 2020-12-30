package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
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
import javax.xml.crypto.Data;

import dbconnect.Dataconnection;

/**
 * Servlet implementation class CustomerBlock
 */
@WebServlet("/CustomerBlock")
public class CustomerBlock extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out=response.getWriter();
		response.setContentType("text/html");
		
		String Subid=request.getParameter("Subid");
		String FarmerData=request.getParameter("FarmerData");
		String fid=request.getParameter("Fid");
		
		String SubDealerMail=request.getParameter("SubDealerMail");
		String CustomerMail=request.getParameter("CustomerMail");
		String FarmerName=request.getParameter("FarmerName");
		String cropName=request.getParameter("cropName");
		String cropQuantity=request.getParameter("cropQuantity");
		String Quality=request.getParameter("Quality");
		String cropFRP=request.getParameter("cropFRP");
		String totalprice=request.getParameter("totalprice");
		/*String Previoushashh=request.getParameter("Previoushashh");
		String timestampp=request.getParameter("timestampp");*/
		System.out.println(Subid);
		System.out.println(FarmerData);
		System.out.println(fid);
		
		System.out.println(SubDealerMail);
		System.out.println(CustomerMail);
		System.out.println(FarmerName);
		System.out.println(cropName);
		System.out.println(cropQuantity);
		System.out.println(Quality);
		System.out.println(cropFRP);
		System.out.println(totalprice);
/*		System.out.println(Previoushashh);
		System.out.println(timestampp);*/
		
		 Date date = new Date();  
		    SimpleDateFormat formatter = new SimpleDateFormat("MM/dd/yyyy");  
		    String timestampp = formatter.format(date);  
		    System.out.println("Date Format with MM/dd/yyyy : "+timestampp);  
		    
			ArrayList<String>al=new ArrayList<>();
			al.add(request.getParameter("cropFRP"));
			al.add(request.getParameter("Fid"));
			System.out.println(al);
			
		String hash=al.toString();
		    
		    try
		    {
		    	MessageDigest md=MessageDigest.getInstance("SHA-256");
		    
			 byte[] hashInBytes = md.digest(hash.getBytes(StandardCharsets.UTF_8));
			 StringBuilder sb = new StringBuilder();
		     for (byte b : hashInBytes) {
		         sb.append(String.format("%02x", b));
		     }
		   String currentHash=sb.toString();
		  String  Previoushashh=sb.toString();
		System.out.println("Blocked is mine.............");
		/*id, FarmerData, FarmerName, cropname, cropquantity, cropFRP, totalprice, previousHash, currentHash,
		timeStampp, dealerMail, cropquality, fid, SubDealerMail*/
		try {
			Connection c=Dataconnection.getConnection();
			String qq="update subdealerblock set fid=? ,currentHash=? where fid=?";
			PreparedStatement ps=c.prepareStatement(qq);
			ps.setString(1, fid);
			ps.setString(2, currentHash);
			ps.setString(3, fid);
			 int i=ps.executeUpdate();
				
			 if(i>0)
			 {
			  out.println("<script type=\"text/javascript\">");
			   out.println("alert('Block added sucessfully..');");
			   out.println("location='SubDealerHome.jsp';");
			   out.println("</script>");
			 }
			 else
			 {
				 out.println("<script type=\"text/javascript\">");
				   out.println("alert('invalid information..');");
				   out.println("location='SubdealerSellProductToCustomer.jsp';");
				   out.println("</script>");
			 }
		
		} catch (Exception e) {
		e.printStackTrace();
		}
		
		try {
			/*id, Subid, FarmerData, Fid, SubDealerMail, CustomerMail, FarmerName,
			cropName, cropQuantity, Quality, cropFRP, totalprice, Previoushashh, timestampp*/
			Connection conn=Dataconnection.getConnection();
			String qqq="insert into customerblock (Subid,FarmerData,fid,SubDealerMail,CustomerMail,FarmerName,cropName,cropQuantity,Quality,cropFRP,totalprice,Previoushashh,timestampp)values(?,?,?,?,?,?,?,?,?,?,?,?,?)";
		PreparedStatement ps1=conn.prepareStatement(qqq);
		ps1.setString(1, Subid);
		ps1.setString(2, FarmerData);
		ps1.setString(3, fid);
		ps1.setString(4, SubDealerMail);
		ps1.setString(5, CustomerMail);
		ps1.setString(6, FarmerName);
		ps1.setString(7, cropName);
		ps1.setString(8, cropQuantity);
		ps1.setString(9, Quality);
		ps1.setString(10, cropFRP);
		ps1.setString(11, totalprice);
		ps1.setString(12, Previoushashh);
		ps1.setString(13, timestampp);
		int f=ps1.executeUpdate();
		if( f>0)
		{
			System.out.println("Blocked is mined");
		}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		    }
		    catch (Exception e) {
				e.printStackTrace();
			}
	}

}
