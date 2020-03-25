package servlet;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;


import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import javabean.db_conn;

public class check extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
			resp.setContentType("text/html;charset=utf-8");
			PrintWriter out = resp.getWriter();
			out.println("请使用默认方式提交数据，不要尝试非法操作");
		}
	
	public void doPost(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		resp.setContentType("text/html;charset=utf-8");
		String id = null;
		String password = null;
		HttpSession session = req.getSession();
		id = req.getParameter("id");       
		password = req.getParameter("password");
		
		db_conn conn = new db_conn();
		
		String sql = "select * from admin_user where user = '"+id+"'";
															
		
		try {
			ResultSet res = conn.executeQuery(sql);
			if(res.next()) {
				String pwd = res.getString(2);
				//System.out.println(pwd+"hha");
				if(password.equals(pwd)) {
					session.setAttribute("admin_id", id);
					resp.sendRedirect("frame");
				}else {
					System.out.println("密码错误"+res);
					resp.sendRedirect("/air_ticket_book/admin/index.jsp");
				}
			}else {
				System.out.println("账号错误");
				resp.sendRedirect("/air_ticket_book/admin/index.jsp");				
			}
		}catch(SQLException e) {
			System.out.println("出现不可预见性错误，错误信息如下："+e);
		}
	}
	
}
