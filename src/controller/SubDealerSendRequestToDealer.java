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
import javax.servlet.http.HttpSession;


import dbconnect.Dataconnection;

/**
 * Servlet implementation class SubDealerSendRequestToDealer
 */
@WebServlet("/SubDealerSendRequestToDealer")
public class SubDealerSendRequestToDealer extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
/*	id, FarmerData, FarmerName, cropname, cropquantity, cropFRP, totalprice, 
	previousHash, currentHash, timeStampp, dealerMail, cropquality, fid*/
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html;charset=utf-8");

		PrintWriter out = response.getWriter();
		
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
		
		String dealerMail=request.getParameter("dealerMail");
		System.out.println(dealerMail);
		
		String cropquality=request.getParameter("cropquality");
		System.out.println(cropquality);
		
		String fid=request.getParameter("fid");
		System.out.println(fid);
		
		HttpSession ss=request.getSession();
		String Subdealermail=(String)ss.getAttribute("SubDealerEmail");
		System.out.println(Subdealermail);
		
		try {
			
			Connection con=Dataconnection.getConnection();
			String qq="insert into subdealersendreqtodealer(FarmerData,FarmerName,cropname,cropquantity,cropFRP,totalprice,dealerMail,cropquality,fid,Subdealermail) values(?,?,?,?,?,?,?,?,?,?)";
			PreparedStatement pss=con.prepareStatement(qq);
			pss.setString(1, FarmerData);
			pss.setString(2, FarmerName);
			pss.setString(3, cropname);
			pss.setString(4, cropquantity);
			pss.setString(5, cropFRP);
			pss.setString(6, totalprice);
			pss.setString(7, dealerMail);
			pss.setString(8, cropquality);
			pss.setString(9, fid);
			pss.setString(10, Subdealermail);
			int i=pss.executeUpdate();
			if(i>0)
			{
				out.println("<script type=\"text/javascript\">");
				  out.println("alert('rquest Send sucessfully..');");
				  out.println("location='SubDealerHome.jsp';");
				  out.println("</script>");
			}
			else
			{
				 out.println("<script type=\"text/javascript\">");
				   out.println("alert('Not register..');");
				   out.println("location='SubdealerRequestProduct.jsp';");
				   out.println("</script>");
			}
		
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	
	}

}
