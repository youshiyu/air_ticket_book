package servlet;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import javabean.db_conn;
import javabean.passenger;
@WebServlet("/ptp")

public class ptp extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ptp() {
        super();
      
    }

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//get提交为非法操作，直接返回被session记忆的页面即可
		HttpSession session = req.getSession();
		String url=null;
		if(session.getAttribute("url")!=null) {
			url=session.getAttribute("url").toString();
		}else {
			url="index/user_center.jsp";
		}
		resp.sendRedirect(url);
	}

	
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String url=null;
		url="index/user_center.jsp";
		String tel2=req.getParameter("tel");
		String name=req.getParameter("name");
		
		System.out.println(name);//要关联的人
		System.out.println(tel2);//要关联的人的电话

		HttpSession session = req.getSession();
		
		String tel=session.getAttribute("p_tel").toString();
		System.out.println(tel);//主人的电话
		String p_id=null,p_id2=null;
		
		String sql=null;
		if(name==""||tel2=="") {
			System.out.print("请输入完整信息"); 
			resp.sendRedirect(url);
		}
		else {
			sql="select * from p_inf where p_name='"+name+"' and p_tel='"+tel2+"'";

			db_conn conn=new db_conn();
			ArrayList<passenger> plist = new ArrayList<passenger>();
			ResultSet res=conn.executeQuery(sql);
			try {
				while (res.next()) {
					passenger passenger_info1=new passenger();
					passenger passenger_info2=new passenger();
					passenger_info1.set_p_id(res.getString(1));
					passenger_info2.set_p_id(res.getString(2));
				    plist.add(passenger_info1);	
				    plist.add(passenger_info2);	
				}
					if(plist.size()==0){
						System.out.println("信息输入有误或对方未创建账号，请重新输入");
					}else{
						sql="select p_id from p_inf where p_tel='"+tel+"'";
						ResultSet res2=conn.executeQuery(sql);
						if(res2.next())
						  p_id=res2.getString(1);
						
						sql="select p_id from p_inf where p_tel='"+tel2+"'";
						ResultSet res3=conn.executeQuery(sql);
						if(res3.next())
						  p_id2=res3.getString(1);
						
						sql="insert into ptp (p_id,p_id2) values ('"+p_id+"','"+p_id2+"')";
						conn.executeInsert(sql);
						req.getRequestDispatcher("index/ptp_change_success.jsp").forward(req, resp);
					}
				//	p.setF_n(res.getString(1));
				//	plist.add(flight_info);					
				req.setAttribute("plist", plist);
				
			} catch (SQLException e) {
				System.out.println("错误信息："+e);
			}finally {
				conn.closeDB();
			}
			
		}
		
	}
}
