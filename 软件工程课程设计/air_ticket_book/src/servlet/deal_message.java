package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javabean.db_conn;
import javabean.oDate;

public class deal_message extends HttpServlet {

	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.sendRedirect("default/message_board.jsp");
		//用户非法的操作，直接忽略即可
	}
	
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//System.out.println("dopost被调用了");
		req.setCharacterEncoding("utf-8");
		oDate o_date=new oDate();
		String user_name=null;
		String user_message=null;
		user_name=req.getParameter("name").toString();
		user_message=req.getParameter("message").toString();
		String getDate=o_date.get_date();
		if(!user_name.equals("")&&!user_message.equals("")) {
			//System.out.println("条件语句判断成功了");
			db_conn conn = new db_conn();
			String sql="insert into user_message (time,user_name,message_content) values('"+getDate+"','"+user_name+"','"+user_message+"')";
			//System.out.println(sql);
			int res=conn.executeInsert(sql);
			System.out.println(res);
			
			//resp.sendRedirect("default/message_board.jsp");
			conn.closeDB();
		}
		resp.sendRedirect("default/message_board.jsp");
	}
}
