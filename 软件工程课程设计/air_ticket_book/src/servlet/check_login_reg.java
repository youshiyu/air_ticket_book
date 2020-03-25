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


import javabean.db_conn;//导入连接数据库类

public class check_login_reg extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter out = resp.getWriter();
		out.println("该程序不接受直接访问，请不要尝试非法操作");
		resp.setHeader("refresh", "2;url=index/login_reg.jsp");
	}
	
	public void doPost(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		String log_name = req.getParameter("log_name");
		String tel=req.getParameter("reg_name");
		String id=req.getParameter("reg_p_id");
		String name=req.getParameter("reg_p_name");
		String sex=req.getParameter("reg_p_sex");
		String work=req.getParameter("reg_p_work");
		String log_pwd = req.getParameter("log_pwd");
		String reg_name = req.getParameter("reg_name");
		String reg_pwd1 = req.getParameter("reg_pwd1");
		String reg_pwd2 = req.getParameter("reg_pwd2");
		
		if(log_name!=null&&log_pwd!=null&&reg_name==null&&reg_pwd1==null&&reg_pwd2==null) {
			//调用登录方法处理登录
			go_login(log_name, log_pwd, req, resp);
			
		}
		else if(log_name==null&&log_pwd==null&&reg_name!=null&&reg_pwd1!=null&&reg_pwd2!=null&&reg_pwd1.equals(reg_pwd2)) {
			//调用注册方法处理注册
			go_reg(id,name,tel,sex,work,reg_pwd1, req, resp);
			
		}
		else {
			
			resp.setContentType("text/html;charset=utf-8");
			PrintWriter out = resp.getWriter();
			out.println("请不要尝试非法操作");
			resp.setHeader("refresh", "2;url=index/login_reg.jsp");
		}
	}
	
	protected void go_login(String name, String pwd, HttpServletRequest req, HttpServletResponse resp) {
		//System.out.println("go_login被调用了");
		db_conn conn = new db_conn();//创建数据库连接对象
		//取出cookie，验证是否有url，如果有url，则跳转到url，如果没有则跳转到index.jsp
		//目的是跳转到用户浏览的原页面，提高用户体验感
		HttpSession session = req.getSession(); 
		/*放弃cookie，转向使用session解决登录后页面跳转的问题，cookie貌似无法解决这个问题*/
		String sql = "select * from p_inf where p_tel = '"+name+"'";
		ResultSet res = conn.executeQuery(sql);
		try {
			
			if(res.next()) {
				String p_pwd = res.getString(6);
				
				if(pwd.equals(p_pwd)) {
					session.setAttribute("user_id", name);
					
					if(session.getAttribute("url")!=null) {
						String url = session.getAttribute("url").toString();
						try{
							url="/air_ticket_book/index.jsp";
							resp.sendRedirect(url);
							}
						catch (IOException e) {
							System.out.println("出错信息如下："+e);
						}
					}else {
						try {
							resp.sendRedirect("user_center");
						}
						catch (IOException e) {
							System.out.println("出错信息如下："+e);
						}
						
					}
				}else {
					//用户输入密码错误
					try {
						resp.setContentType("text/html;charset=utf-8");
						PrintWriter out = resp.getWriter();
						out.println("密码错误，请重新登录");
						resp.setHeader("refresh", "2;url=index/login_reg.jsp");
					}catch (IOException e) {
						System.out.println("出错信息如下："+e);
					}
					
				}				
			}else {
				//用户账号错误
				try {
					resp.setContentType("text/html;charset=utf-8");
					PrintWriter out = resp.getWriter();
					out.println("账号错误，请重新登录");
					resp.setHeader("refresh", "2;url=index/login_reg.jsp");
				}catch (IOException e) {
					System.out.println("出错信息如下："+e);
				}
			}
			conn.closeDB();
		}
		catch (SQLException e) {
			System.out.println("出错信息如下："+e);
		}
	}
	protected void go_reg(String id,String name, String tel,String sex,String work,String pwd1,HttpServletRequest req, HttpServletResponse resp) {
		//System.out.println("注册方法被调用了");
		resp.setContentType("text/html;charset=utf-8");
		
		db_conn conn = new db_conn();//创建数据库连接对象
		String sql = "select * from p_inf where p_tel = '"+tel+"'";
		ResultSet res = conn.executeQuery(sql);
		try {
			PrintWriter out = resp.getWriter();
			try {
				if(res.next()) {			
					out.println("该手机号已有注册账号");
					resp.setHeader("refresh", "2;url=index/login_reg.jsp");			
				}else {
					sql = "insert into p_inf (p_id,p_name,p_tel,p_sex,p_work,p_pwd) values('"+id+"','"+name+"','"+tel+"','"+sex+"','"+work+"','"+pwd1+"')";
					int in_res = conn.executeInsert(sql);
					//System.out.println(in_res);
					if(in_res==1) {
						out.println("注册成功，2秒之后跳转到登录页面");
						resp.setHeader("refresh", "2;url=index/login_reg.jsp");	
					}else {
						out.println("出错啦，请联系开发人员进行修补bug");
						resp.setHeader("refresh", "2;url=index/login_reg.jsp");
					}
				}
			}catch (Exception e) {
				System.out.print("错误信息如下："+e);
			}
		}catch (IOException e) {
			System.out.println("出错啦"+e);
		}
		
		conn.closeDB();
	}
}
