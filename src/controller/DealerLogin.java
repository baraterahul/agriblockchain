package controller;

import java.io.IOException;

import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.DealerDao;


/**
 * Servlet implementation class FarmerloginServlet
 */
@WebServlet("/DealerLogin")
public class DealerLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DealerLogin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		
			String email=request.getParameter("email");
			System.out.println(email);
		
			
		
			String password=request.getParameter("password");
			System.out.println(password);
			
	

			if(DealerDao.validate(email, password))
			{
				
				HttpSession session=request.getSession();
				
				session.setAttribute("DealerEmail",email);
				
				
				 out.println("<script type=\"text/javascript\">");
				  out.println("alert('Login sucessfully..');");
				  out.println("location='DealerHome.jsp';");
				  out.println("</script>");
			}
			else {
				 out.println("<script type=\"text/javascript\">");
				  out.println("alert('incorrect details..');");
				  out.println("location='dealerlogin.jsp';");
				  out.println("</script>");
			}
		
		}
	}


