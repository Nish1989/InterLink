package com.interlink.users;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.interlink.crud.FetchFromDBManager;
import com.interlink.importExcel.ExcelImportManager;
import com.interlink.vo.StudentDashboardVO;

public class FileImportOprServlet extends HttpServlet {

	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// Check that we have a file upload request

		String forwardPage = "student_dashboard.jsp";

		DiskFileItemFactory factory = new DiskFileItemFactory();

		// Create a new file upload handler
		ServletFileUpload upload = new ServletFileUpload(factory);

		String emailId = request.getParameter("emailId");

		ExcelImportManager excelImportManager = new ExcelImportManager();

		try {
			// Parse the request to get file items.
			List fileItems = upload.parseRequest(request);

			// Process the uploaded file items
			Iterator i = fileItems.iterator();

			while (i.hasNext()) {
				FileItem item = (FileItem) i.next();
				
				
				 if(!item.isFormField()){
				    
					 InputStream filecontent = item.getInputStream();
					 
					 if (emailId != null && !emailId.equalsIgnoreCase("null")) {
 
							excelImportManager.readDataFromExcel(emailId, filecontent);
						} else {

							forwardPage = "inter_login.jsp";
						}
					 
					 
				 } else {
				     // Get the field name
				     String fieldName = item.getFieldName();
				     
				     if(fieldName.equalsIgnoreCase("emailId"))
				     
				     {
				    	 emailId =  item.getString();
				     }
				     
				     
				 }
				 
				

			}

			
			FetchFromDBManager fetchDbMgr = new FetchFromDBManager();
			
			Map<String, Map<String, Map<String, List<StudentDashboardVO>>>> stdDashboardData = fetchDbMgr.getStudentDashboardData(emailId);
			
			request.setAttribute("stdDashboardData", stdDashboardData);
			
			
			RequestDispatcher dispatcher = request
					.getRequestDispatcher(forwardPage);

			dispatcher.forward(request, response);

		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}

}