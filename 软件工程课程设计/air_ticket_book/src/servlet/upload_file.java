package servlet;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import javabean.db_conn;
public class upload_file extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 
	
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		//GET方式提交的数据基本都是非法操作，不用处理，直接返回edit_info页面就可以
			resp.sendRedirect("/air_ticket_book/index/edit_info.jsp");
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session=request.getSession();
		if(session.getAttribute("user_id")==null) {
			response.sendRedirect("index/user_info.jsp");
		}
		else {
			//request.setCharacterEncoding("utf-8");
			boolean flag=ServletFileUpload.isMultipartContent(request);
			if(flag) {
				DiskFileItemFactory factory=new DiskFileItemFactory();
				ServletFileUpload upload=new ServletFileUpload(factory);
				try {
					List<FileItem>fileList = upload.parseRequest(request);
					Iterator<FileItem> myitor = fileList.iterator();
					while(myitor.hasNext()) {
						FileItem item=myitor.next();
						if(item!=null) {
							String filename=item.getName();
							if(filename!=null) {
								String path="index/upload";
								String absolutepath=this.getServletContext().getRealPath(path);
								//System.out.println("文件名"+filename);
								
								File file = new File(filename);
								//System.out.println("文件名为："+file.getName());
								String file_name=file.getName();
								String ext=file_name.substring(file_name.lastIndexOf("."));
								//System.out.println("文件扩展名为："+ext);
								String end_filename=UUID.randomUUID().toString()+ext;
								//System.out.println("头像图片名称为："+end_filename);
								File uploadFile = new File(absolutepath, end_filename);
								try {
									if(uploadFile.exists()) {
										uploadFile.delete();
									}
									item.write(uploadFile);
									//System.out.println("上传成功");
									//System.out.println("图片存储文件夹为："+absolutepath);
									
									
									//上传文件成功把文件名写入数据库
									
									db_conn conn= new db_conn();
									String sql="update common_user set avatar_img='"+end_filename+"' "
											+ "where user_name='"+session.getAttribute("user_id")+"'";
									int res=conn.Update(sql);
									//System.out.println(res);
									PrintWriter out=response.getWriter();
									response.setContentType("text/html;charset=utf-8");
									if(res!=0) {
										response.sendRedirect("/air_ticket_book/index/user_info.jsp");
									}else {
										
										out.println("文件上传失败，程序出现bug，请联系开发人员修复bug");
										response.setHeader("refresh", "2;url=/air_ticket_book/index/user_info.jsp");
									}
									
									
									
									
									
								}catch (Exception e) {
									System.out.println("出错了1，出错信息如下："+e);
								}
								
							}				
						}
					}
				} catch (FileUploadException e) {
					System.out.println("出错了2，出错信息如下："+e);
					e.printStackTrace();
				}
			}
		}
		
	}
}
