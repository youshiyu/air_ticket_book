/*package servlet;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import javabean.db_conn;


public class deal_order extends HttpServlet{

	private static final long serialVersionUID = 1L;
	
	public deal_order()
	{super();}
	
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		
		HttpSession session = req.getSession();
		String s=req.getParameter("date");//日期
		System.out.println(s);//本人的ID
		String tel=session.getAttribute("p_tel").toString();
		System.out.println(tel);//本人的电话
		
		String f;
		f=session.getAttribute("f").toString();
		System.out.println(f);
		
		if(session.getAttribute("p_tel")!=null) {
			db_conn conn=new db_conn();
			String sql="select p_id from p_inf where p_tel='"+tel+"'";
			ResultSet res2=conn.executeQuery(sql);
			String  p_id=null;
			  try {
				  while (res2.next()) {
				p_id=res2.getString(1);}
				System.out.println(p_id);//本人的ID
				String sql1="select p_id2 from ptp where p_id='"+p_id+"'";
				//System.out.println("订购成功");
				String p_id2=null;
				
				ResultSet res=conn.executeQuery(sql1);
				
				
				while (res.next()) {
					db_conn conn2=new db_conn();
					p_id2=res.getString(1);
					String sql2="Update ticket set t_b=0,p_id2='"+p_id+"',p_id= '"+p_id2+"',t_pay=0 where t_d='"+s+"'and f_n='"+f+"' and t_b=1 limit 1";
					conn2.Update(sql2);
					System.out.println("订购成功");
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			  finally {
					conn.closeDB();
				}
				
	    }
	
			resp.sendRedirect("/air_ticket_book/user_center");
	
	}
}*/
package servlet;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import javabean.db_conn;


public class deal_order extends HttpServlet{

	private static final long serialVersionUID = 1L;
	
	public deal_order()
	{super();}
	
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		
		HttpSession session = req.getSession();
		String s=req.getParameter("date");//日期
		System.out.println(s);//本人的ID
		String tel=session.getAttribute("p_tel").toString();
		System.out.println(tel);//本人的电话
		
		String f;
		f=session.getAttribute("f").toString();
		System.out.println(f);
		
		if(session.getAttribute("p_tel")!=null) {
			db_conn conn=new db_conn();
			db_conn conn3=new db_conn();
			String sql="select p_id from p_inf where p_tel='"+tel+"'";
			ResultSet res2=conn.executeQuery(sql);
			String  p_id=null;
			  try {
				  while (res2.next()) {p_id=res2.getString(1);}//本人的ID
				String sql1="select p_id2 from ptp where p_id='"+p_id+"'";
				String p_id2=null;		
				ResultSet res=conn.executeQuery(sql1);
				
				String sql3="SELECT count(*) from ticket where t_d='"+s+"'and f_n='"+f+"' and t_b=1 ";
				ResultSet res3=conn3.executeQuery(sql3);
				int a=0;
				int b=0;
				if(res3.first()) {
					 a=Integer.parseInt(res3.getString(1));
					
				}
				String sql4="SELECT count(*) from ptp where p_id='"+p_id+"'";
				ResultSet res4=conn3.executeQuery(sql4);
				if(res4.first()) {
					 b=Integer.parseInt(res4.getString(1));
				}
				
				
			if(a>=b) {
				System.out.println(a);
				System.out.println(b);
				while (res.next()) {
					db_conn conn2=new db_conn();
					p_id2=res.getString(1);
					System.out.println(p_id2);
					String sql2="Update ticket set t_b=0,p_id2='"+p_id+"',p_id= '"+p_id2+"',t_pay=0 where t_d='"+s+"'and f_n='"+f+"' and t_b=1 limit 1";
					conn2.Update(sql2);
					System.out.println("订购成功");
				}
				resp.sendRedirect("/air_ticket_book/user_center");	
				}
			
			else {
				System.out.println("deal_order出错啦，请联系开发人员进行修补bug");
				resp.setHeader("refresh", "2;url=/air_ticket_book/default/error.jsp");
			}
			  }
			catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			  finally {
					conn.closeDB();
				
				}
			
}
	}}

