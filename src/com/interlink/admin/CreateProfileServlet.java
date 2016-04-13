package com.interlink.admin;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

import com.interlink.crud.FetchFromDBManager;
import com.interlink.crud.InsertIntoDBManager;
import com.interlink.vo.UserInfoVo;

import java.sql.*;
import java.util.Iterator;
import java.util.List;

public class CreateProfileServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		String forwardPage = "amin_st-details.jsp";
		
		String emailId = request.getParameter("emailId");
		
		String dashboard = request.getParameter("dashboard");
		
		if(emailId!=null && emailId.length()!=0 && !dashboard.equalsIgnoreCase("dashboard"))

		{
		InsertIntoDBManager insertDbMgr = new InsertIntoDBManager();
		
		insertDbMgr.insertProfileInfo(request);
		
		}

		FetchFromDBManager fetchDbMgr = new FetchFromDBManager();

		List<UserInfoVo> listUserInfo = fetchDbMgr.getAllUserInfo();

		request.setAttribute("listUserInfo", listUserInfo);

		RequestDispatcher dispatcher = request
				.getRequestDispatcher(forwardPage);

		dispatcher.forward(request, response);

	}

}
