

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


@WebServlet("/Forget")
public class Forget extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
	
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		
		try{
			
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ayush","root","root");
			
		java.sql.PreparedStatement pt=con.prepareStatement("update ayush set password=? where  mobile_number=? ");
	
		
		pt.setString(1,request.getParameter("cn"));
			pt.setString(2,request.getParameter("mb"));
			int rs=pt.executeUpdate();
			if(rs==1)
			{
				
				out.println("<br>");
				out.println("Your Password is Updated");
				out.println("<br>");
				out.println("<br>");
				 RequestDispatcher rd=request.getRequestDispatcher("login.html");  
			        rd.include(request, response); 
			}
			else 
			{
				out.println("<br>");
				out.println("<p >incorret Mobile Number</p>");
				
				RequestDispatcher rd=request.getRequestDispatcher("forgot.html");  
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
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
