package ff;


import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.naming.InitialContext;
import javax.sql.DataSource;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/server")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String name=request.getParameter("name");
		String qualify=request.getParameter("qualify");
		String  gmail=request.getParameter("mail");
		String password=request.getParameter("password");
		
		InitialContext ctx=null;
		DataSource ds=null;
		Connection con=null;
		PreparedStatement pre=null;
		Statement ss=null;
		ResultSet rr=null;
		HttpSession seesion=request.getSession();
		try {
		ctx=new InitialContext();
		ds=(DataSource)ctx.lookup("java:comp/env/jdbc/register");
		con=ds.getConnection();
		String query="insert into job(name,qualify,gmail,password) values(?,?,?,?)";
		pre=con.prepareStatement(query);
		pre.setString(1,name );
		pre.setString(2, qualify);
		pre.setString(3, gmail);
		pre.setString(4, password);
		int rows=pre.executeUpdate();
		}
		catch(Exception e){
			e.printStackTrace();
		}
		
	}

}
