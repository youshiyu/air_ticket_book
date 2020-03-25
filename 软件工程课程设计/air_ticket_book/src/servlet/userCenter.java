package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class userCenter extends HttpServlet{

	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		Object user_id = session.getAttribute("user_id");
		if(user_id != null) {
			RequestDispatcher rd = getServletContext().getRequestDispatcher("/index/user_center.jsp");
			rd.forward(req, resp);
			session.setAttribute("url", "/air_ticket_book/user_center");
		}else {
			resp.sendRedirect("index/login_reg.jsp");
		}
	}
	
}
