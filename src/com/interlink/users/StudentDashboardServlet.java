package com.interlink.users;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.interlink.crud.FetchFromDBManager;
import com.interlink.vo.StudentDashboardVO;

public class StudentDashboardServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		String forwardPage = "student_dashboard.jsp";
		
		String emailId = request.getParameter("emailId");

		FetchFromDBManager fetchDbMgr = new FetchFromDBManager();
		
		Map<String, Map<String, Map<String, List<StudentDashboardVO>>>> stdDashboardData = fetchDbMgr.getStudentDashboardData(emailId);
		
		request.setAttribute("stdDashboardData", stdDashboardData);

		RequestDispatcher dispatcher = request
				.getRequestDispatcher(forwardPage);

		dispatcher.forward(request, response);

	}

}
