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


@WebServlet("/FarmerPurchaseSeedsServlet")
public class FarmerPurchaseSeedsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	//id, farmerName, FarmerEmail, FertilizerEmail, Seed, seed_type, fertilize_1, fertilize_2, Pesticide_1, Pesticide_2
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out=response.getWriter();
		response.setContentType("text/html");
		
		String farmerName=request.getParameter("farmerName");
		System.out.println(farmerName);
		
		String FarmerEmail=request.getParameter("FarmerEmail");
		System.out.println(FarmerEmail);
		
		String FertilizerEmail=request.getParameter("FertilizerEmail");
		System.out.println(FertilizerEmail);
		
		String Seed=request.getParameter("Seed");
		System.out.println(Seed);
		
		String seed_type=request.getParameter("seed_type");
		System.out.println(seed_type);
		
		String fertilize_1=request.getParameter("fertilize_1");
		System.out.println(fertilize_1);
		
		String fertilize_2=request.getParameter("fertilize_2");
	System.out.println(fertilize_2);
	
	String Pesticide_1=request.getParameter("Pesticide_1");
	System.out.println(Pesticide_1);
	
	String Pesticide_2=request.getParameter("Pesticide_2");
System.out.println(Pesticide_2);
	
	try {
		Connection con=Dataconnection.getConnection();
	String query="insert into farmerpurchase_seeds_fert_pest(farmerName,FarmerEmail,FertilizerEmail,Seed,seed_type,fertilize_1,fertilize_2,Pesticide_1,Pesticide_2) values(?,?,?,?,?,?,?,?,?)";
	PreparedStatement pst=con.prepareStatement(query);
	pst.setString(1, farmerName);
	pst.setString(2, FarmerEmail);
	pst.setString(3, FertilizerEmail);
	pst.setString(4, Seed);
	pst.setString(5, seed_type);
	pst.setString(6, fertilize_1);
	pst.setString(7, fertilize_2);
	pst.setString(8, Pesticide_1);
	pst.setString(9, Pesticide_2);
int i=pst.executeUpdate();
if(i>0)
{
	HttpSession s1=request.getSession();
	s1.setAttribute("farmerName", farmerName);
	s1.setAttribute("FarmerEmail", FarmerEmail);
	s1.setAttribute("FertilizerEmail", FertilizerEmail);
	s1.setAttribute("Seed", Seed);
	s1.setAttribute("seed_type", seed_type);
	s1.setAttribute("fertilize_1", fertilize_1);
	s1.setAttribute("fertilize_2", fertilize_2);
	s1.setAttribute("Pesticide_1", Pesticide_1);
	s1.setAttribute("Pesticide_2", Pesticide_2);
	 out.println("<script type=\"text/javascript\">");
	  out.println("alert('Purchase sucessfully..');");
	  out.println("location='FarmerSellProduct.jsp';");
	  out.println("</script>");
}
else
{
	 out.println("<script type=\"text/javascript\">");
	  out.println("alert('Incorrect details..');");
	  out.println("location='farmerhome.jsp';");
	  out.println("</script>");
	}
	} catch (Exception e) {
		e.printStackTrace();
	}
	
	}

}
