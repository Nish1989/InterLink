package com.interlink.admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.interlink.crud.DeleteFromDBManager;
import com.interlink.crud.FetchFromDBManager;
import com.interlink.vo.UserInfoVo;

public class DeleteProfileServlet extends HttpServlet {

	
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		String deleteField = request.getParameter("deleteField");
		
		String forwardPage = "amin_st-details.jsp";
		
			if(deleteField != null && deleteField.length()!=0)
		{
			
			DeleteFromDBManager deleteDBMgr = new DeleteFromDBManager();
			
			deleteDBMgr.deleteEntireProfile(deleteField);
			
		}
		
		
		
		FetchFromDBManager fetchDbMgr = new FetchFromDBManager();

		List<UserInfoVo> listUserInfo = fetchDbMgr.getAllUserInfo();

		request.setAttribute("listUserInfo", listUserInfo);

		RequestDispatcher dispatcher = request
				.getRequestDispatcher(forwardPage);

		dispatcher.forward(request, response);

	}

	}
