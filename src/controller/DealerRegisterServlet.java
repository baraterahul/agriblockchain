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
 * Servlet implementation class FarmerRegisterServlet
 */
@WebServlet("/DealerRegisterServlet")
public class DealerRegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//id, fname, lname, address, phone, email, password
		
		response.setContentType("text/html;charset=utf-8");

		PrintWriter out = response.getWriter();
		
		String fname=request.getParameter("fname");
		System.out.println(fname);
		
		String lname=request.getParameter("lname");
		System.out.println(lname);
		
		String address=request.getParameter("address");
		System.out.println(address);
	
		String phone=request.getParameter("phone");
		System.out.println(phone);
		
		String email=request.getParameter("email");
		System.out.println(email);
		
		String mnane=request.getParameter("mnane");
		System.out.println(mnane);
		
		String maddress=request.getParameter("maddress");
		System.out.println(maddress);
		
		String city=request.getParameter("city");
		System.out.println(city);
		
		String state=request.getParameter("state");
		System.out.println(state);
	
		String password=request.getParameter("password");
		System.out.println(password);
		
		try {
			
			Connection con=Dataconnection.getConnection();
			String query="insert into dealerregister(fname,lname,address,phone,email,mname,maddress,city,state,password) values (?,?,?,?,?,?,?,?,?,?)";
PreparedStatement pst=con.prepareStatement(query);
pst.setString(1, fname);
pst.setString(2, lname);
pst.setString(3, address);
pst.setString(4, phone);
pst.setString(5, email);
pst.setString(6, mnane);
pst.setString(7, maddress);
pst.setString(8, city);
pst.setString(9, state);
pst.setString(10, password);
int i=pst.executeUpdate();
if(i>0)
{
 out.println("<script type=\"text/javascript\">");
  out.println("alert('register sucessfully..');");
  out.println("location='dealerlogin.jsp';");
  out.println("</script>");
}
else
{
	 out.println("<script type=\"text/javascript\">");
	   out.println("alert('Not register..');");
	   out.println("location='dealerregister.jsp';");
	   out.println("</script>");
}
	} catch (Exception e) {
			// TODO: handle exception
		}

		
	}

}
