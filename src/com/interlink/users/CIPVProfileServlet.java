package com.interlink.users;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.interlink.common.ResponseGenerator;
import com.interlink.crud.DataPopulaterForInsertion;
import com.interlink.crud.FetchFromDBManager;
import com.interlink.crud.InsertIntoDBManager;
import com.interlink.vo.CIPVProductWiseVO;
import com.interlink.vo.CIPVProfileVO;
import com.interlink.vo.HouseholdProfileVo;
import com.interlink.vo.ShopProfileVO;

public class CIPVProfileServlet extends HttpServlet {

	@Override
	public void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		
		

		String forwardPage = "update_profile.jsp";

		String emailId = request.getParameter("emailId");

		String shopinfo = request.getParameter("shopinfo");
		
		String HHCode = request.getParameter("HHCode");
		
		
		if (shopinfo != null && shopinfo.length() != 0)

		{

			InsertIntoDBManager insertDbMgr = new InsertIntoDBManager();
			
			DataPopulaterForInsertion dpInsert = new DataPopulaterForInsertion();
			
			CIPVProfileVO cIPVProfileVO = dpInsert.dataPopulateForCIPVProfile(request);
			
			CIPVProductWiseVO cIPVProductWiseVO = dpInsert.dataPopulateForCIPVProductWise(request);
			
			HHCode = insertDbMgr.insertCIPVProfileInfo(cIPVProfileVO,cIPVProductWiseVO);

		}

		
		request = new ResponseGenerator().genResponseForUI(request, emailId, HHCode);
		
		
		request.setAttribute("activeTab", "#cipv");
		
		
		RequestDispatcher dispatcher = request
				.getRequestDispatcher(forwardPage);

		dispatcher.forward(request, response);

	
		
	}
	
	@Override
	public void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("Do Get Called");
		
		this.doPost(request,response);
						
			}

}
