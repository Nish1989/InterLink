package com.interlink.users;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.interlink.common.ResponseGenerator;
import com.interlink.crud.DataPopulaterForInsertion;
import com.interlink.crud.InsertIntoDBManager;
import com.interlink.vo.CIPBProductWiseVO;
import com.interlink.vo.CIPBProfileVO;
import com.interlink.vo.CIPVProductWiseVO;

public class CIPBProfileServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		String forwardPage = "update_profile.jsp";

		String emailId = request.getParameter("emailId");

		String shopinfo = request.getParameter("shopinfo");
		
		String HHCode = request.getParameter("HHCode");
		
		
		if (shopinfo != null && shopinfo.length() != 0)

		{

		
			InsertIntoDBManager insertDbMgr = new InsertIntoDBManager();
			
			DataPopulaterForInsertion dpInsert = new DataPopulaterForInsertion();
			
			CIPBProfileVO cIPBProfileVO = dpInsert.dataPopulateForCIPBProfile(request);
			
			CIPBProductWiseVO cIPBProductWiseVO = dpInsert.dataPopulateForCIPBProductWise(request);
			
			HHCode = insertDbMgr.insertCIPBProfileInfo(cIPBProfileVO,cIPBProductWiseVO);


		}

	
		
		
		request = new ResponseGenerator().genResponseForUI(request, emailId, HHCode);
		
		
		request.setAttribute("activeTab", "#cipb");
		
		
		RequestDispatcher dispatcher = request
				.getRequestDispatcher(forwardPage);

		dispatcher.forward(request, response);

	
		
	}

}
