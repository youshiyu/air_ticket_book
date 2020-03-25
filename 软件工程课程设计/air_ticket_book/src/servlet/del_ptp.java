package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import javabean.db_conn;
@WebServlet("/del_ptp")

public class del_ptp extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String p_id2=req.getParameter("p_id2");
		db_conn conn=new db_conn();
		String sql="delete from ptp where p_id2='"+p_id2+"'";
		conn.executeDelete(sql);
		resp.setHeader("refresh", "2;url=/air_ticket_book/index/ptp_change_success.jsp");
	}
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setHeader("refresh", "2;url=/air_ticket_book/index/ptp_change_success.jsp");
	}
	

}