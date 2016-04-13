package com.interlink.users;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.interlink.common.ResponseGenerator;
import com.interlink.crud.DataPopulaterForInsertion;
import com.interlink.crud.FetchFromDBManager;
import com.interlink.crud.InsertIntoDBManager;
import com.interlink.vo.HouseholdProfileVo;
import com.interlink.vo.IHHProfileVO;

public class IHHProfileServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		String forwardPage = "update_profile.jsp";

		String emailId = request.getParameter("emailId");

		String HHCode = request.getParameter("HHCodeOption");

		String individualName = request.getParameter("individualName");

	
		if (individualName != null && individualName.length() != 0)

		{

		
			InsertIntoDBManager insertDbMgr = new InsertIntoDBManager();
			
			DataPopulaterForInsertion dpInsert = new DataPopulaterForInsertion();
			
			IHHProfileVO iHHProfileVo = dpInsert.dataPopulateForIHHProfile(request);

			HHCode = insertDbMgr.insertIHHPInfo(iHHProfileVo);


		}


		request = new ResponseGenerator().genResponseForUI(request, emailId, HHCode);

		request.setAttribute("activeTab", "#ihhp");
		
		RequestDispatcher dispatcher = request
				.getRequestDispatcher(forwardPage);

		dispatcher.forward(request, response);

	
		
	}

}
