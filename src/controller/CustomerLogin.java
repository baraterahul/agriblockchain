package controller;

import java.io.IOException;

import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.CustomerDao;
import dao.DealerDao;
import dao.FertilizerDao;


/**
 * Servlet implementation class FarmerloginServlet
 */
@WebServlet("/CustomerLogin")
public class CustomerLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		
			String email=request.getParameter("email");
			System.out.println(email);
		
			
		
			String password=request.getParameter("password");
			System.out.println(password);
			
	

			if(CustomerDao.validate(email, password))
			{
				
				HttpSession session=request.getSession();
				
				session.setAttribute("Customeremail",email);
				
				
				 out.println("<script type=\"text/javascript\">");
				  out.println("alert('Login sucessfully..');");
				  out.println("location='CustomerHome.jsp';");
				  out.println("</script>");
			}
			else {
				 out.println("<script type=\"text/javascript\">");
				  out.println("alert('incorrect details..');");
				  out.println("location='customerlogin.jsp';");
				  out.println("</script>");
			}
		
		}
	}


