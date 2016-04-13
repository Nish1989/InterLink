package com.interlink.users;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.interlink.common.ResponseGenerator;
import com.interlink.crud.DeleteFromDBManager;

public class DeleteUserInfoServlet extends HttpServlet {

	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String emailId = request.getParameter("emailId");
		
		String tabId = request.getParameter("tabId");
		
		String HHCode = "";
		
		
		
		String HHIndividualCode = "";

		String HHCodeOption = request.getParameter("HHCodeOption");
		
		String month = request.getParameter("month");
		
		String shopinfo = request.getParameter("shopinfo");
		
		String ocassion = request.getParameter("ocassion");
		
		
		if (HHCodeOption != null && HHCodeOption.length() != 0)

		{
			String[] tokens = HHCodeOption.split("-");

			HHCode = tokens[0];

		}
		
		else if  (shopinfo != null && shopinfo.length() != 0)

		{
			String[] tokens = shopinfo.split("-");

			HHCode = tokens[0];

		}
		
		HHIndividualCode = HHCodeOption;
		
		
		DeleteFromDBManager  deleteFromDBManager = new DeleteFromDBManager(); 
		
		
		String forwardPage = "update_profile.jsp";
			
		if(tabId.equalsIgnoreCase("ihhp"))
		{
			deleteFromDBManager.deleteIHHPCollection(emailId,HHIndividualCode);
			deleteFromDBManager.deleteCIPVProductInfoCollection(emailId,HHIndividualCode);
			deleteFromDBManager.deleteCIPBProductInfoCollection(emailId,HHIndividualCode);
			
		}else if(tabId.equalsIgnoreCase("cipv")){
			
			deleteFromDBManager.deleteCIPVForEmailId(emailId, HHIndividualCode, month, shopinfo);
			
			
		}else if(tabId.equalsIgnoreCase("sp")){
			
			deleteFromDBManager.deleteShopProfileCollection(emailId,shopinfo);
			deleteFromDBManager.deleteHMPProductInfoCollection(emailId,shopinfo);
		
		}else if(tabId.equalsIgnoreCase("cipb")){
			
		deleteFromDBManager.deleteCIPBForEmailId(emailId, HHIndividualCode, month, ocassion, shopinfo);
		
		}
		
		else if(tabId.equalsIgnoreCase("hmp")){
			
			deleteFromDBManager.deleteHHPProfileEmailId(emailId,shopinfo,month,ocassion);
			
		}
		
		
		
		
		
		request = new ResponseGenerator().genResponseForUI(request, emailId, HHCode);
		
		
		request.setAttribute("activeTab", "#"+tabId);
		
		
		RequestDispatcher dispatcher = request
				.getRequestDispatcher(forwardPage);

		dispatcher.forward(request, response);

		
	}
}
