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
import com.interlink.vo.HouseholdProfileVo;
import com.interlink.vo.IHHProfileVO;
import com.interlink.vo.ShopProfileVO;

public class ShopProfileServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		String forwardPage = "update_profile.jsp";

		String emailId = request.getParameter("emailId");

		String HHCode = request.getParameter("HHCodeOption");
			
		

		String shopName = request.getParameter("shopName");

		if (shopName != null && shopName.length() != 0)

		{

		
			InsertIntoDBManager insertDbMgr = new InsertIntoDBManager();
			
			DataPopulaterForInsertion dpInsert = new DataPopulaterForInsertion();
			
			ShopProfileVO shopProfileVO = dpInsert.dataPopulateForShopProfile(request);

			HHCode = insertDbMgr.insertShopProfileInfo(shopProfileVO);


		}

		
		request = new ResponseGenerator().genResponseForUI(request, emailId, HHCode);
		
		request.setAttribute("activeTab", "#sp");
		
		RequestDispatcher dispatcher = request
				.getRequestDispatcher(forwardPage);

		dispatcher.forward(request, response);

	
		
	}

}
