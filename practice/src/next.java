

import java.io.IOException;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.jdbc.Statement;

@WebServlet("/next")
public class next extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public next() {

    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		response.setContentType("text/html");
		
		PrintWriter out=response.getWriter();
		out.println("<html><body>");
		
	
 			try{
			Class.forName("com.mysql.jdbc.Driver");
			
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ayush","root","root");
			
			
	
		PreparedStatement pt=con.prepareStatement("insert into ayush values(?,?,?,?,?,?,?,?)");
			pt.setString(1,request.getParameter("fname"));
			pt.setString(2,request.getParameter("lname"));
			pt.setString(3,request.getParameter("gender"));
			pt.setString(4,request.getParameter("dob"));
			pt.setString(5,request.getParameter("email"));
			pt.setString(6,request.getParameter("mnumber"));
			pt.setString(7,request.getParameter("username"));
			pt.setString(8,request.getParameter("pass"));
			int r=pt.executeUpdate();
		
				if(r>0)
					{
					out.println("<br>");
					out.println("your account is created");
					  RequestDispatcher rd=request.getRequestDispatcher("login.html");  
				        rd.include(request, response);  
					}
					else{
						out.println("<br>");
						  out.print("Sorry your account was not created try again");  
					        RequestDispatcher rd=request.getRequestDispatcher("New.html");  
					        rd.include(request, response); 
						
					}
					pt.close();
					con.close();
		}
	catch(Exception e)
		{
		out.println("<br> Sorry try again with another username");
		 RequestDispatcher rd=request.getRequestDispatcher("New.html");  
	        rd.include(request, response); 
		
		}
	out.println("</body>");
	out.println("</html>");
		
	}
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
