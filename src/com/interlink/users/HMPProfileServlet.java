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
import com.interlink.vo.HMPProductWiseVO;
import com.interlink.vo.HMPProfileVO;

public class HMPProfileServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		String forwardPage = "update_profile.jsp";

		String emailId = request.getParameter("emailId");

		String shopinfo = request.getParameter("shopinfo");
		
		String HHCode = request.getParameter("HHCode");
		
		String ocassion = request.getParameter("ocassion");
		
		if (shopinfo != null && shopinfo.length() != 0 && ocassion!=null && ocassion.length() !=0 )

		{

			
			InsertIntoDBManager insertDbMgr = new InsertIntoDBManager();
			
			DataPopulaterForInsertion dpInsert = new DataPopulaterForInsertion();
			
			HMPProfileVO hMPProfileVO = dpInsert.dataPopulateForHMPProfile(request);
			
			HMPProductWiseVO hMPProductWiseVO = dpInsert.dataPopulateForHMPProductWise(request);
			
			HHCode = insertDbMgr.insertHMPProfileInfo(hMPProfileVO,hMPProductWiseVO);
		
			
		}

	
		
		
		request = new ResponseGenerator().genResponseForUI(request, emailId, HHCode);
		
		
		request.setAttribute("activeTab", "#hmp");
		
		
		RequestDispatcher dispatcher = request
				.getRequestDispatcher(forwardPage);

		dispatcher.forward(request, response);

	
		
	}

}
