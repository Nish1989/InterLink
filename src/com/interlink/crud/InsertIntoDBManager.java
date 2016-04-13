package com.interlink.crud;

import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.interlink.config.ServerConfig;
import com.interlink.mongo.MongoDBConnector;
import com.interlink.vo.CIPBProductWiseVO;
import com.interlink.vo.CIPBProfileVO;
import com.interlink.vo.CIPVProductWiseVO;
import com.interlink.vo.CIPVProfileVO;
import com.interlink.vo.HMPProductWiseVO;
import com.interlink.vo.HMPProfileVO;
import com.interlink.vo.HouseholdProfileVo;
import com.interlink.vo.IHHProfileVO;
import com.interlink.vo.ShopProfileVO;
import com.interlink.vo.UserInfoVo;
import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;

public class InsertIntoDBManager {

	public void insertProfileInfo(HttpServletRequest request) {
		DB dbobj = MongoDBConnector.mongoDbConnector();

		DBCollection coll = dbobj
				.getCollection(ServerConfig.mongoDB_User_Collection);

		BasicDBObject document = new BasicDBObject();

		document.put("userId", getUserId());

		document.put("password", request.getParameter("password"));

		document.put("emailId", request.getParameter("emailId"));

		document.put("role", "User");

		document.put("name", request.getParameter("name"));

		document.put("collegeName", request.getParameter("collegeName"));

		document.put("collegeAddr", request.getParameter("collegeAddr"));

		document.put("city", request.getParameter("city"));

		document.put("createdDate", getCreatedDate());

		coll.insert(document);

	}

	public String getCreatedDate() {

		long createdTime = System.currentTimeMillis();

		SimpleDateFormat sdf = new SimpleDateFormat("dd MMM yyyy");

		Date resultdate = new Date(createdTime);

		return sdf.format(resultdate);

	}

	
	public String getCreatedMonthAndYear() {

		long createdTime = System.currentTimeMillis();

		SimpleDateFormat sdf = new SimpleDateFormat("MMM yyyy");

		Date resultdate = new Date(createdTime);

		return sdf.format(resultdate);

	}




	public String getUserId() {

		boolean isExist = false;

		String prefix = "ST";
		
		FetchFromDBManager fetchDbMgr = new FetchFromDBManager();

		List<UserInfoVo> listUserInfo = fetchDbMgr.getAllUserInfo();
		
		int listSize = listUserInfo.size();

		String userId = prefix + listSize;

		DB dbobj = MongoDBConnector.mongoDbConnector();

		DBCollection coll = dbobj
				.getCollection(ServerConfig.mongoDB_User_Collection);

		do {

			listSize = listSize + 1;
			
			DecimalFormat idFormat = new DecimalFormat("#0000");

			userId = prefix + idFormat.format(listSize);

			BasicDBObject query = new BasicDBObject();
			query.put("userId", userId);
			DBCursor result = coll.find(query);

			if (result.size() != 0)

			{

				isExist = true;

			} else {

				isExist = false;

			}

		} while (isExist);

		return userId;

	}

	public String getHHCodeId(String eMailId) {

		FetchFromDBManager fetchDbMgr = new FetchFromDBManager();

		int listSize = fetchDbMgr.getListHHCodeCollSize();
		
		DB dbobj = MongoDBConnector.mongoDbConnector();

		DBCollection coll = dbobj
				.getCollection(ServerConfig.mongoDB_HHProfile_Collection);
		
		String HHCode = null;
	
		String prefix = "HH";
		
		boolean isExist = false;
		
		
		do {

			listSize = listSize + 1;
			
			DecimalFormat idFormat = new DecimalFormat("#0000");

			HHCode = prefix + idFormat.format(listSize);

			BasicDBObject query = new BasicDBObject();
			
			query.put("HHCode", HHCode);
			
			DBCursor result = coll.find(query);
			
			

			if (result.size() != 0)

			{

				isExist = true;

			} else {

				isExist = false;

			}

		} while (isExist);

		/*
		List<String> listHHCodeId = fetchDbMgr.getListHHCodeForEmailID(eMailId);
		
		String HHCode = autoGenerateUid("HH", listHHCodeId.size() + 1);
		*/

		return HHCode;
	}

	public String getHHIndividualCode(String eMailId, String HHCode) {

		FetchFromDBManager fetchDbMgr = new FetchFromDBManager();

		List<IHHProfileVO> listHHCodeId = fetchDbMgr.getIHHPList(eMailId,
				HHCode);

		String HHIndividualCode = autoGenerateUid(HHCode + "-AA",
				listHHCodeId.size() + 1);

		return HHIndividualCode;
	}

	public String getShopCode(String eMailId, String HHCode) {

		FetchFromDBManager fetchDbMgr = new FetchFromDBManager();

		List<ShopProfileVO> listHHCodeId = fetchDbMgr.getShopList(eMailId,
				HHCode);

		int id = listHHCodeId.size() + 1;

		String shopCode = HHCode + "-Groc" + id;

		return shopCode;
	}

	public String autoGenerateUid(String token, int number) {

		DecimalFormat idFormat = new DecimalFormat("#0000");

		String strUid = token + idFormat.format(number);

		return strUid;
	}

	public String insertHHProfileInfo(HouseholdProfileVo hhProfileVo) {
		DB dbobj = MongoDBConnector.mongoDbConnector();

		DBCollection coll = dbobj
				.getCollection(ServerConfig.mongoDB_HHProfile_Collection);

		BasicDBObject document = new BasicDBObject();
		
		String userId = hhProfileVo.getUserId();

		if(userId == null)
		{
			userId = new FetchFromDBManager().getUserId(hhProfileVo.getEmailId());
		}
		
		document.put("userId", userId);

		document.put("emailId", hhProfileVo.getEmailId());

		document.put("area", hhProfileVo.getArea());

		document.put("googleLocation", hhProfileVo.getGoogleLocation());
			
		document.put("hhType", hhProfileVo.getHhType());
	
		document.put("vehicleType", hhProfileVo.getVehicleType());

		document.put("vehicleBrand", hhProfileVo.getVehicleBrand());

		document.put("cableConnection", hhProfileVo.getCableConnection());
		
		document.put("netConnection", hhProfileVo.getNetConnection());

		String HHCode = hhProfileVo.getHHCode();
		
		document.put("HHCode", HHCode);
		
		//insert for year
		document.put("createdMonthAndYear", getCreatedMonthAndYear());

		coll.insert(document);

		return HHCode;

	}

	public String insertIHHPInfo(IHHProfileVO iHHProfileVo) {
		DB dbobj = MongoDBConnector.mongoDbConnector();

		DBCollection coll = dbobj
				.getCollection(ServerConfig.mongoDB_IHHP_Collection);

		BasicDBObject document = new BasicDBObject();
	
		String HHCode = iHHProfileVo.getHHCode();

		document.put("emailId", iHHProfileVo.getEmailId());

		document.put("HHCode", HHCode);

		document.put("HHIndividualCode", iHHProfileVo.getHHIndividualCode());

		document.put("individualName", iHHProfileVo.getIndividualName());

		document.put("age", iHHProfileVo.getAge());

		document.put("sex", iHHProfileVo.getSex());
		
		document.put("relationship", iHHProfileVo.getRelationship());
		
		document.put("education", iHHProfileVo.getEducation());
		
		document.put("occupation", iHHProfileVo.getOccupation());
		
		document.put("workplace", iHHProfileVo.getWorkplace());
		
		document.put("transport", iHHProfileVo.getTransport());
	
		document.put("mobileType",iHHProfileVo.getMobileType());
	
		document.put("mobileBrand", iHHProfileVo.getMobileBrand());

		document.put("mobileBill", iHHProfileVo.getMobileBill());
	
		document.put("netConnection", iHHProfileVo.getNetConnection());

		document.put("socialMedia", iHHProfileVo.getSocialMedia());
		
		
		document.put("sitesfequentyvisited",
				iHHProfileVo.getSitesfequentyvisited());

		document.put("recreationActivities",
				iHHProfileVo.getRecreationActivities());

		document.put("hobbies", iHHProfileVo.getHobbies());
		
		document.put("channels", iHHProfileVo.getChannels());
	
		document.put("newspapers", iHHProfileVo.getNewspapers());
		
		document.put("magazines", iHHProfileVo.getMagazines());
		
		//insert for year
		document.put("createdMonthAndYear", getCreatedMonthAndYear());
		
		coll.insert(document);

		return HHCode;

	}

	public String insertShopProfileInfo(ShopProfileVO shopProfileVO) {
		DB dbobj = MongoDBConnector.mongoDbConnector();

		DBCollection coll = dbobj
				.getCollection(ServerConfig.mongoDB_ShopProfile_Collection);

		BasicDBObject document = new BasicDBObject();
	
		String HHCode = shopProfileVO.getHHCode();

		document.put("emailId", shopProfileVO.getEmailId());

		document.put("HHCode",HHCode);

		document.put("shopCode", shopProfileVO.getShopCode());

		document.put("shopName", shopProfileVO.getShopName());

		document.put("outletType", shopProfileVO.getOutletType());

		document.put("area", shopProfileVO.getArea());

		document.put("pincode", shopProfileVO.getPincode());

		document.put("doordelivery", shopProfileVO.getDoordelivery());

		document.put("phoneorder", shopProfileVO.getPhoneorder());

		document.put("selfpickup", shopProfileVO.getSelfpickup());

		document.put("monthlycredit", shopProfileVO.getMonthlycredit());

		document.put("shoppingbasket",shopProfileVO.getShoppingbasket());

		document.put("creditcard",shopProfileVO.getCreditcard());

		document.put("electronicbilling",
				shopProfileVO.getElectronicbilling());

		document.put("noOfAssistant", shopProfileVO.getNoOfAssistant());

		document.put("distInMin", shopProfileVO.getDistInMin());

		document.put("distInKm", shopProfileVO.getDistInKm());

		document.put("shopFrontFt", shopProfileVO.getShopFrontFt());
		
		
		//insert for year
		document.put("createdMonthAndYear", getCreatedMonthAndYear());
				

		coll.insert(document);

		return HHCode;

	}

	public String insertCIPVProfileInfo(CIPVProfileVO cIPVProfileVO, CIPVProductWiseVO cIPVProductWiseVO) {
		DB dbobj = MongoDBConnector.mongoDbConnector();

		DBCollection coll = dbobj
				.getCollection(ServerConfig.mongoDB_CIPVProduct_Collection);

		BasicDBObject document = new BasicDBObject();
	
		String HHCode = cIPVProfileVO.getHHCode();

		document.put("emailId", cIPVProfileVO.getEmailId());

		document.put("HHCode", HHCode );

		document.put("iHHDCode", cIPVProfileVO.getHHIndividualCode());

		Map<String, Object> productListDetails = new HashMap<String, Object>();

		productListDetails.put("productCatg",cIPVProductWiseVO.getProductCatg());
		
		productListDetails.put("subProductCatg",
				cIPVProductWiseVO.getSubProductCatg());

		
		productListDetails.put("skuitem", cIPVProductWiseVO.getSkuitem());

		productListDetails.put("mrp", cIPVProductWiseVO.getMrp());

		productListDetails.put("quantity", cIPVProductWiseVO.getQuantity());

		productListDetails.put("amt", cIPVProductWiseVO.getAmt());

		productListDetails.put("brandAds", cIPVProductWiseVO.getBrandAds());

		productListDetails
				.put("brandAware", cIPVProductWiseVO.getBrandAware());
		
		productListDetails.put("brandOutlet",
				cIPVProductWiseVO.getBrandOutlet());

		productListDetails.put("brandEnquired",
				cIPVProductWiseVO.getBrandEnquired());
		
		productListDetails.put("brandIntendToBuy",
				cIPVProductWiseVO.getBrandIntendToBuy());
		

		Map<String, Object> shopListDetails = new HashMap<String, Object>();
		shopListDetails.put("shopcode", cIPVProfileVO.getShopCode());

		shopListDetails.put("productListDetails", productListDetails);

		Map<String, Object> monthWishDoc = new HashMap<String, Object>();
		monthWishDoc.put("month", cIPVProfileVO.getMonth());

		monthWishDoc.put("shopList", shopListDetails);

		document.put("monthWishDoc", monthWishDoc);
		
		//insert for year
		document.put("createdMonthAndYear", getCreatedMonthAndYear());

		coll.insert(document);

		return HHCode;

	}

	public String insertHMPProfileInfo(HMPProfileVO hMPProfileVO,HMPProductWiseVO hMPProductWiseVO) {
		DB dbobj = MongoDBConnector.mongoDbConnector();

		DBCollection coll = dbobj
				.getCollection(ServerConfig.mongoDB_HMPProduct_Collection);

		BasicDBObject document = new BasicDBObject();
		
		String HHCode = hMPProfileVO.getHHCode();
		
		document.put("emailId", hMPProfileVO.getEmailId());

		document.put("HHCode", HHCode);

		document.put("shopcode", hMPProfileVO.getShopCode());

		Map<String, Object> productListDetails = new HashMap<String, Object>();

		
		productListDetails.put("productCatg",hMPProductWiseVO.getProductCatg());

			productListDetails.put("subProductCatg",
					hMPProductWiseVO.getSubProductCatg());
		
		productListDetails.put("skuitem", hMPProductWiseVO.getSkuitem());

		productListDetails.put("mrp", hMPProductWiseVO.getMrp());

		productListDetails.put("quantity",hMPProductWiseVO.getQuantity());

		productListDetails.put("amt", hMPProductWiseVO.getAmt());

		Map<String, Object> ocassionListDetails = new HashMap<String, Object>();
		ocassionListDetails.put("ocassion", hMPProfileVO.getOcassion());

		ocassionListDetails.put("productListDetails", productListDetails);

		Map<String, Object> monthWishDoc = new HashMap<String, Object>();
		monthWishDoc.put("month", hMPProfileVO.getMonth());

		monthWishDoc.put("ocassionList", ocassionListDetails);

		document.put("monthWishDoc", monthWishDoc);
		
		
		//insert for year
		document.put("createdMonthAndYear", getCreatedMonthAndYear());

		coll.insert(document);

		return HHCode;

	}

	public String insertCIPBProfileInfo(CIPBProfileVO cIPBProfileVO,CIPBProductWiseVO cIPBProductWiseVO) {
		DB dbobj = MongoDBConnector.mongoDbConnector();

		DBCollection coll = dbobj
				.getCollection(ServerConfig.mongoDB_CIPBProduct_Collection);

		BasicDBObject document = new BasicDBObject();
	
		document.put("emailId", cIPBProfileVO.getEmailId());
		
		String HHCode = cIPBProfileVO.getHHCode();

		document.put("HHCode", HHCode);

		document.put("iHHDCode", cIPBProfileVO.getHHIndividualCode());

		Map<String, Object> productListDetails = new HashMap<String, Object>();

		String productCatg = cIPBProductWiseVO.getProductCatg();
		
		productListDetails.put("productCatg",productCatg);

		productListDetails.put("subProductCatg",cIPBProductWiseVO.getSubProductCatg());

		productListDetails.put("brands", cIPBProductWiseVO.getBrands());

		productListDetails.put("subbrands", cIPBProductWiseVO.getSubbrands());

		productListDetails.put("skuitem", cIPBProductWiseVO.getSkuitem());

		productListDetails.put("mrp", cIPBProductWiseVO.getMrp());

		productListDetails.put("quantity", cIPBProductWiseVO.getQuantity());

		productListDetails.put("amt",cIPBProductWiseVO.getAmt());

		productListDetails
				.put("madeyoubuy", cIPBProductWiseVO.getMadeyoubuy());

		productListDetails.put("happypurchase",
				cIPBProductWiseVO.getHappypurchase());

		productListDetails.put("whyhappypurchase",
				cIPBProductWiseVO.getWhyhappypurchase());

		productListDetails.put("repeatpurchase",
				cIPBProductWiseVO.getRepeatpurchase());

		productListDetails.put("whyrepeatpurchase",
				cIPBProductWiseVO.getRepeatpurchase());

		productListDetails.put("willrecommend",
				cIPBProductWiseVO.getWillrecommend());

		productListDetails.put("whyrecommend",
				cIPBProductWiseVO.getWhyrecommend());
	
		productListDetails.put("brandAds", cIPBProductWiseVO.getBrandAds());
		
		productListDetails
				.put("brandAware", cIPBProductWiseVO.getBrandAware());

		productListDetails.put("brandOutlet",
				cIPBProductWiseVO.getBrandOutlet());
		
		productListDetails.put("brandEnquired",
				cIPBProductWiseVO.getBrandEnquired());

		Map<String, Object> shopListDetails = new HashMap<String, Object>();

		shopListDetails.put("shopcode", cIPBProfileVO.getShopCode());

		Map<String, Object> ocassionList = new HashMap<String, Object>();
		ocassionList.put("ocassion", cIPBProfileVO.getOcassion());
		ocassionList.put("productListDetails", productListDetails);

		shopListDetails.put("ocassionList", ocassionList);

		Map<String, Object> monthWishDoc = new HashMap<String, Object>();
		monthWishDoc.put("month", cIPBProfileVO.getMonth());

		monthWishDoc.put("shopList", shopListDetails);

		document.put("monthWishDoc", monthWishDoc);
		
		//insert for year
		document.put("createdMonthAndYear", getCreatedMonthAndYear());

		coll.insert(document);

		return HHCode;

	}

}
