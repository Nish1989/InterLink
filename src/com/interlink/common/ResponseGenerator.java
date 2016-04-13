package com.interlink.common;

import java.util.Calendar;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.interlink.config.ServerConfig;
import com.interlink.crud.FetchFromDBManager;
import com.interlink.vo.CIPBProfileVO;
import com.interlink.vo.CIPVProfileVO;
import com.interlink.vo.HMPProfileVO;
import com.interlink.vo.HouseholdProfileVo;
import com.interlink.vo.IHHProfileVO;
import com.interlink.vo.ShopProfileVO;

public class ResponseGenerator {

	public HttpServletRequest genAdminResponse(HttpServletRequest request) {

		FetchFromDBManager fetchDbMgr = new FetchFromDBManager();

		Map<String, Map<String, Map<String, List<String>>>> adminDashboardData = fetchDbMgr
				.getAdminDashboardData();

		request.setAttribute("adminDashboardData", adminDashboardData);

		String yearValue = request.getParameter("yearValue");

		if (yearValue == null || yearValue.length() == 0) {

			Calendar currCal = Calendar.getInstance();
			
			int cyrrYear = currCal.get(Calendar.YEAR);

			yearValue = cyrrYear + "";

		}

		List<String> listStdYear = fetchDbMgr.getStudentYearList(yearValue);
		
		request.setAttribute("listStdYear", listStdYear);

		List<String> listHHPYear = fetchDbMgr.getYearList(yearValue,ServerConfig.mongoDB_HHProfile_Collection);
		
		request.setAttribute("listHHPYear", listHHPYear);
		
		List<String> listIHHPYear = fetchDbMgr.getYearList(yearValue,ServerConfig.mongoDB_IHHP_Collection);
		
		request.setAttribute("listIHHPYear", listIHHPYear);
		
		List<String> listShopYear = fetchDbMgr.getYearList(yearValue,ServerConfig.mongoDB_ShopProfile_Collection);
		
		request.setAttribute("listShopYear", listShopYear);
		
		List<String> listHMPYear = fetchDbMgr.getYearList(yearValue,ServerConfig.mongoDB_HMPProduct_Collection);
		
		request.setAttribute("listHMPYear", listHMPYear);
		
		List<String> listCIPVYear = fetchDbMgr.getYearList(yearValue,ServerConfig.mongoDB_CIPVProduct_Collection);
		
		request.setAttribute("listCIPVYear", listCIPVYear);
		
		List<String> listCIPBYear = fetchDbMgr.getYearList(yearValue,ServerConfig.mongoDB_CIPBProduct_Collection);
		
		request.setAttribute("listCIPBYear", listCIPBYear);

		
		request.setAttribute("yearValue", yearValue);

		return request;

	}

	public HttpServletRequest genResponseForUI(HttpServletRequest request,
			String emailId, String HHCode) {

		FetchFromDBManager getDBMgr = new FetchFromDBManager();
		HouseholdProfileVo hhProfileVo = null;

		if (HHCode != null && HHCode.length() != 0)

		{

			hhProfileVo = getDBMgr.getHHProfile(emailId, HHCode);
		}

		request.setAttribute("hhProfileVo", hhProfileVo);

		List<String> hhCodeList = getDBMgr.getListHHCodeForEmailID(emailId);

		request.setAttribute("hhCodeList", hhCodeList);

		List<String> hhIndividualCodeList = getDBMgr.getHHIndividualCodeList(
				emailId, HHCode);

		request.setAttribute("hhIndividualCodeList", hhIndividualCodeList);

		List<String> shopListForHHProfile = getDBMgr.getShopListForHHProfile(
				emailId, HHCode);

		request.setAttribute("shopListForHHProfile", shopListForHHProfile);

		List<IHHProfileVO> listIHHProfileVO = getDBMgr.getIHHPList(emailId,
				HHCode);

		request.setAttribute("listIHHProfileVO", listIHHProfileVO);

		List<ShopProfileVO> listShopProfileVO = getDBMgr.getShopList(emailId,
				HHCode);

		request.setAttribute("listShopProfileVO", listShopProfileVO);

		String HHIndividualCode = "";

		String HHCodeOption = request.getParameter("HHCodeOption");

		if (HHCodeOption != null && HHCodeOption.length() != 0)

		{
			String[] tokens = HHCodeOption.split(" ");

			HHIndividualCode = tokens[0];

		}

		String shopcode = null;

		String shopinfo = request.getParameter("shopinfo");

		if (shopinfo != null && shopinfo.length() != 0)

		{
			String[] shopTokens = shopinfo.split(" ");

			shopcode = shopTokens[0];

		}

		CIPVProfileVO cIPVProfileVO = getDBMgr.getCIPVMonthList(emailId,
				HHCode, HHIndividualCode);

		cIPVProfileVO.setHHCodeOption(HHCodeOption);

		request.setAttribute("cIPVProfileVO", cIPVProfileVO);

		HMPProfileVO hMPProfileVO = getDBMgr.getHMPProfileList(emailId, HHCode,
				shopcode);

		hMPProfileVO.setShopInfo(shopinfo);

		request.setAttribute("hMPProfileVO", hMPProfileVO);

		CIPBProfileVO cIPBProfileVO = getDBMgr.getCIPBMonthList(emailId,
				HHCode, HHIndividualCode);

		cIPBProfileVO.setHHCodeOption(HHCodeOption);

		request.setAttribute("cIPBProfileVO", cIPBProfileVO);

		return request;

	}

}
