package servlet;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import javabean.db_conn;
import javabean.flight;

public class search_fly extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		String url=null;
		if(session.getAttribute("url")!=null) {
			url=session.getAttribute("url").toString();
		}else {
			url="default/index.jsp";
		}
		resp.sendRedirect(url);
	}

	
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String url=null;
			url="default/index.jsp";
		
		String departure=null;
		String destination=null;
		departure=req.getParameter("departure");
		destination=req.getParameter("destination");
		String sql=null;
		
		
		if(departure==""&&destination=="") {
			//如果始发地和目的地都为空则跳转回原页面
			resp.sendRedirect(url);
		}else if (departure!=""&&destination=="") {
			sql="select * from flight where f_s_p='"+departure+"'";
		}else if (departure==""&&destination!="") {
			sql="select * from flight where f_a_p='"+destination+"'";
		}else if (departure!=""&&destination!="") {
			sql="select * from flight where f_s_p='"+departure+"' and f_a_p='"+destination+"'";
		}
		if(departure==""&&destination=="") {
		}else {
			db_conn conn=new db_conn();
			ArrayList<flight> flightlist = new ArrayList<flight>();
			
			ResultSet res=conn.executeQuery(sql);
			try {
				while (res.next()) {
					flight flight_info=new flight();
					flight_info.setF_n(res.getString(1));
					flight_info.setF_s_p(res.getString(2));
					flight_info.setF_a_p(res.getString(3));
					flight_info.setF_s_a(res.getString(4));
					flight_info.setF_a_a(res.getString(5));
					flight_info.setF_s_t(res.getString(6));
					flight_info.setF_a_t(res.getString(7));
					flight_info.setF_p(res.getString(8));
					flightlist.add(flight_info);			
						
				}
				req.setAttribute("flightlist", flightlist);
			} catch (SQLException e) {
				System.out.println("错误信息："+e);
			}finally {
				conn.closeDB();
			}
			req.getRequestDispatcher("default/search.jsp").forward(req, resp);
		}
		
	}
}
