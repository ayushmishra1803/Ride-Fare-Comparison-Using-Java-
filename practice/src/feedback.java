

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.DriverManager;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.omg.CORBA.Request;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;

/**
 * Servlet implementation class feedback
 */
@WebServlet("/feedback")
public class feedback extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		PrintWriter out=response.getWriter();
		response.setContentType("text/html");
		out.println("<html><body>");
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=(Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/ayush","root","root");
			
			PreparedStatement pt=(PreparedStatement) con.prepareStatement("insert into feedback values(?,?,?,?)");
			pt.setString(1,request.getParameter("First_Name"));
			pt.setString(2,request.getParameter("Last_Name"));
			pt.setString(3,request.getParameter("Contact_Number"));
			pt.setString(4,request.getParameter("Subject"));
			int r=pt.executeUpdate();
			if(r>0)
			{
				out.println("Thnakq for helping us");
				RequestDispatcher rd=request.getRequestDispatcher("welcome.jsp");
				rd.include(request,response);
			}
			else 
			{
				out.println("Sorry there is some problem try again later");
				RequestDispatcher rd=request.getRequestDispatcher("feedback.jsp");
				rd.include(request,response);
			}
			
		}
		catch(Exception e)
		{
			
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
