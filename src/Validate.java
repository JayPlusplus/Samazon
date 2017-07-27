

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import customTools.DBperson;
import customTools.Person;

/**
 * Servlet implementation class Validate
 */
@WebServlet("/Validate")
public class Validate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Validate() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String message = "";
		String url = "";
		session.setAttribute("message", message);
		
		System.out.println("it's above if ");
		
		
		
		
		if (DBperson.isValidPerson(username, password)) {
				message = "Welcome! ";
				url = "/IndexServlet";
				
				Person p = DBperson.getPerson(username);
				
				session.setAttribute("person", p);
				
				
				getServletContext().getRequestDispatcher(url).forward(request, response);
				
			}
			else {
				message = "please sign up first";
				url = "/login.jsp";
				getServletContext().getRequestDispatcher(url).forward(request, response);
			
		}
	}

}
