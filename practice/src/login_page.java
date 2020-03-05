

import java.io.IOException;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.validation.Validator;

import com.mysql.jdbc.PreparedStatement;


@WebServlet("/login_page")
public class login_page extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		
		try{
			
			Class.forName("com.mysql.jdbc.Driver");
			
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ayush","root","root");
			
		java.sql.PreparedStatement pt=con.prepareStatement("select first_name from ayush where username=? and password=?");
	
		
		pt.setString(1,request.getParameter("email"));
			pt.setString(2,request.getParameter("psw"));
			ResultSet rs=pt.executeQuery();
			if(rs.next())
			{
				String s=request.getParameter("email");
	
				HttpSession ses=request.getSession();  
		        
				ses.setAttribute("name",s);  
				 RequestDispatcher rd=request.getRequestDispatcher("welcome.jsp");  
			        rd.include(request, response); 
			}
			else 
			{
				out.println("<h1>");
				out.println("<p style color=back>incorret username or password</p>");
				out.println("</h1>");
				RequestDispatcher rd=request.getRequestDispatcher("login.html");  
		        rd.include(request, response); 
			}
			  
			con.close();
			
		}
		catch(Exception e)
		{
			out.println("Data not found"+e);
		}
		out.println("</body></html>");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
