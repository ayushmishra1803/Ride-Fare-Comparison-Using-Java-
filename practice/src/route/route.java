package route;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.DriverManager;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.jdbc.Connection;

/**
 * Servlet implementation class route
 */
@WebServlet("/route")
public class route extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		String s=request.getParameter("s");
		String d=request.getParameter("d");
		
		out.println("<html><body>");
		try{
			Class.forName("com.mysql.jdbc.Driver");
			out.println("Driver loaded");
			Connection con=(Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/ayush","root","root");
			java.sql.PreparedStatement pt=con.prepareStatement("insert into route values(?,?,?)");
			pt.setString(1,request.getParameter("s"));
			pt.setString(2,request.getParameter("d"));
			
			pt.setString(3,request.getParameter("dis"));
			int rs=pt.executeUpdate();
			if(rs>=1)
			{
				out.println("dataloaded");
				
			}
			else
			{
				out.println("data not loaded");
			}
		}
		catch(Exception e)
		{
			out.println("exception"+e);
		}
		
		out.println("you are traveling from "+s+"to"+d);
		out.println("</body></html>");
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
