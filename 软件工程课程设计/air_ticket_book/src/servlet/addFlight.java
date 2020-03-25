package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javabean.db_conn;

public class addFlight extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//开始获取各种参数
	
		req.setCharacterEncoding("utf-8");
	
		String flight_id=req.getParameter("flight_id");
		String start_place=req.getParameter("start_place");
		String end_place=req.getParameter("end_place");
		String start_airport=req.getParameter("start_airport");
		String end_airport=req.getParameter("end_airport");
		String take_off_time=req.getParameter("take_off_time");
		String landing_time=req.getParameter("landing_time");
		String price_str=req.getParameter("first_class_price");
		Integer price=Integer.parseInt(price_str);
		//参数获取结束
		db_conn conn=new db_conn();
		String sql="select * from flight where f_n='"+flight_id+"'";
		ResultSet res=conn.executeQuery(sql);
		try {
			if(res.next()) {
				resp.setContentType("text/html;charset=utf-8");
				PrintWriter out=resp.getWriter();
				out.println("您输入的航班号重复了，请选择其他航班号添加，5s后返回");
				resp.setHeader("refresh", "5;url=admin/flight_add.jsp");
			}else {
				sql="insert into flight values('"+flight_id+"','"+start_place+"','"+end_place+"','"+start_airport+"','"+end_airport+"','"+take_off_time+"','"+landing_time+"',"+price+")";
				//Integer res=
				conn.executeInsert(sql);
				//System.out.println(res);
				//System.out.println(sql);
				resp.sendRedirect("admin/flight_list.jsp");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
}
