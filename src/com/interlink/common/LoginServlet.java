package com.interlink.common;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

import com.interlink.crud.FetchFromDBManager;
import com.interlink.vo.UserInfoVo;

import java.sql.*;
import java.util.Iterator;
import java.util.List;

public class LoginServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		String emailId = request.getParameter("emailId");
		String password = request.getParameter("password");

		String dashboard = request.getParameter("dashboard");

		String forwardPage = "inter_login.jsp";

		FetchFromDBManager fetchDbMgr = new FetchFromDBManager();

		UserInfoVo userInfoVo = fetchDbMgr.getUserInfo(emailId, password);

		if (dashboard != null && dashboard.length() != 0)

		{

			userInfoVo = new UserInfoVo();
		}

		if (userInfoVo != null) {

			if (userInfoVo.getRole().equalsIgnoreCase("Admin")) {

				List<UserInfoVo> listUserInfo = fetchDbMgr.getAllUserInfo();

				request.setAttribute("listUserInfo", listUserInfo);

				forwardPage = "amin_st-details.jsp";

			} else {

				request.setAttribute("userInfoVo", userInfoVo);

				forwardPage = "create_profile.jsp";
			}

		} else {

			forwardPage = "inter_login.jsp";
			request.setAttribute("loginErrorMsg",
					"Username or Password incorrect");

		}

		RequestDispatcher dispatcher = request
				.getRequestDispatcher(forwardPage);

		dispatcher.forward(request, response);

	}

}
