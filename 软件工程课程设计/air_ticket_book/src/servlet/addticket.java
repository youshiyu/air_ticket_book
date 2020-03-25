package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javabean.db_conn;

/**
 * Servlet implementation class addticket
 */
@WebServlet("/addticket")
public class addticket extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
 
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String ticket_id=req.getParameter("ticket_id");
		String flight_id=req.getParameter("flight_id");
		String date=req.getParameter("date");
		String seat_id=req.getParameter("seat_id");


		//参数获取结束
		db_conn conn=new db_conn();
		String sql="select * from ticket where t_id='"+flight_id+"'";
		ResultSet res=conn.executeQuery(sql);
		try {
			if(res.next()) {
				resp.setContentType("text/html;charset=utf-8");
				PrintWriter out=resp.getWriter();
				out.println("您输入的机票号重复了，请选择其他机票号添加，5s后返回");
				resp.setHeader("refresh", "5;url=admin/ticket_add.jsp");
			}else {
				sql="insert into  ticket values('"+ticket_id+"','"+flight_id+"','"+date+"','"+seat_id+"','"+1+"','"+0+"','"+0+"',"+0+")";
				//Integer res=
				conn.executeInsert(sql);
				//System.out.println(res);
				//System.out.println(sql);
				resp.sendRedirect("admin/ticket_information.jsp");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			resp.setContentType("text/html;charset=utf-8");
			PrintWriter out=resp.getWriter();
			out.println("您添加的机票出错了，可能是输入的航班号不存在，禁止添加机票座位");
			resp.setHeader("refresh", "5;url=admin/ticket_add.jsp");
			e.printStackTrace();
		}
		
	}
}
