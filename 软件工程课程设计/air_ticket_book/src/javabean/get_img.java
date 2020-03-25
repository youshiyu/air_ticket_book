package javabean;

import java.sql.ResultSet;
import java.sql.SQLException;
import javabean.db_conn;

//用户头像功能
public class get_img {
	
	
	public String img;
	public String user_id;

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getImg() {
		//System.out.println("函数被调用了");
		
		db_conn conn=new db_conn();
		String sql="select avatar_img from common_user where "
				+ "user_name='"+getUser_id()+"'";
		ResultSet res=conn.executeQuery(sql);
		try {
			if(res.next()) {
				img=res.getString(1);
				if(img==null) {
					img="/air_ticket_book/index/images/photo.png";
				}else {
					img="/air_ticket_book/index/upload/"+img;
				}
			}
		} catch (SQLException e) {
			System.out.println("出错信息如下："+e);
			
		}
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}
	
}
