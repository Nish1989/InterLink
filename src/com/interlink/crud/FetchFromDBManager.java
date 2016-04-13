package com.interlink.crud;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;

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
import com.interlink.vo.StudentDashboardVO;
import com.interlink.vo.UserInfoVo;
import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.DBObject;

public class FetchFromDBManager {

	public UserInfoVo getUserInfo(String emailId, String password) {
		DB dbobj = MongoDBConnector.mongoDbConnector();

		DBCollection coll = dbobj
				.getCollection(ServerConfig.mongoDB_User_Collection);

		BasicDBObject query = new BasicDBObject();
		query.put("emailId", emailId);
		query.put("password", password);
		DBCursor result = coll.find(query);

		UserInfoVo userInfoVo = null;

		if (result.size() != 0) {

			userInfoVo = new UserInfoVo();

		}

		DBObject dbObj = null;
		while (result.hasNext()) {
			dbObj = result.next();

			userInfoVo = populateData(dbObj, userInfoVo);

		}
		return userInfoVo;

	}

	public String getUserRole(String emailId) {

		DB dbobj = MongoDBConnector.mongoDbConnector();

		DBCollection coll = dbobj
				.getCollection(ServerConfig.mongoDB_User_Collection);

		BasicDBObject query = new BasicDBObject();
		query.put("emailId", emailId);

		DBCursor result = coll.find(query);
		String role = null;

		DBObject dbObj = null;
		while (result.hasNext()) {
			dbObj = result.next();
			role = (String) dbObj.get("role");
		}
		return role;
	}

	public int getNoOfProfile(String emailId) {

		DB dbobj = MongoDBConnector.mongoDbConnector();

		DBCollection coll = dbobj
				.getCollection(ServerConfig.mongoDB_HHProfile_Collection);

		BasicDBObject query = new BasicDBObject();
		query.put("emailId", emailId);

		DBCursor result = coll.find(query);

		return result.length();

	}

	public String getUserId(String emailId) {

		DB dbobj = MongoDBConnector.mongoDbConnector();

		DBCollection coll = dbobj
				.getCollection(ServerConfig.mongoDB_User_Collection);

		BasicDBObject query = new BasicDBObject();
		query.put("emailId", emailId);

		DBCursor result = coll.find(query);

		String userId = null;

		DBObject dbObj = null;
		while (result.hasNext()) {

			dbObj = result.next();

			userId = (String) dbObj.get("userId");
		}

		return userId;

	}

	public String getEmailId(String userId) {

		DB dbobj = MongoDBConnector.mongoDbConnector();

		DBCollection coll = dbobj
				.getCollection(ServerConfig.mongoDB_User_Collection);

		BasicDBObject query = new BasicDBObject();
		query.put("userId", userId);

		DBCursor result = coll.find(query);

		String emailId = null;

		DBObject dbObj = null;
		while (result.hasNext()) {

			dbObj = result.next();

			emailId = (String) dbObj.get("emailId");
		}

		return emailId;

	}

	public List<UserInfoVo> getAllUserInfo() {

		List<UserInfoVo> listUserInfo = new ArrayList<UserInfoVo>();

		DB dbobj = MongoDBConnector.mongoDbConnector();

		DBCollection coll = dbobj
				.getCollection(ServerConfig.mongoDB_User_Collection);

		DBCursor result = coll.find();

		UserInfoVo userInfoVo = null;

		DBObject dbObj = null;
		while (result.hasNext()) {

			userInfoVo = new UserInfoVo();

			dbObj = result.next();

			userInfoVo = populateData(dbObj, userInfoVo);

			if (!userInfoVo.getRole().equalsIgnoreCase("Admin"))

			{
				int noOfProfile = getNoOfProfile(userInfoVo.getEmailId());

				userInfoVo.setNoOfProfile(noOfProfile);

				listUserInfo.add(userInfoVo);

			}

		}
		return listUserInfo;

	}

	public Map<String, Map<String, Map<String, List<String>>>> getAdminDashboardData() {

		DB dbobj = MongoDBConnector.mongoDbConnector();

		DBCollection coll = dbobj
				.getCollection(ServerConfig.mongoDB_IHHP_Collection);

		DBCursor result = coll.find();

		Map<String, Map<String, Map<String, List<String>>>> stdIdMap = new HashMap<String, Map<String, Map<String, List<String>>>>();

		Map<String, Map<String, List<String>>> hhcodeMap = null;

		Map<String, List<String>> respCodeMAp = null;

		List<String> monthList = null;

		DBObject dbObj = null;
		while (result.hasNext()) {
			dbObj = result.next();

			monthList = new ArrayList<String>();

			respCodeMAp = new HashMap<String, List<String>>();

			hhcodeMap = new HashMap<String, Map<String, List<String>>>();

			String emailId = (String) dbObj.get("emailId");
			String HHCode = (String) dbObj.get("HHCode");

			String HHIndividualCode = (String) dbObj.get("HHIndividualCode");

			String stdId = getUserId(emailId);

			if (stdIdMap.containsKey(stdId)) {

				hhcodeMap = stdIdMap.get(stdId);

				if (hhcodeMap.containsKey(HHCode)) {

					respCodeMAp = hhcodeMap.get(HHCode);

					if (respCodeMAp.containsKey(HHIndividualCode)) {

						monthList = respCodeMAp.get(HHIndividualCode);

					}

				}

			}

			// CIPB Month List

			BasicDBObject query = new BasicDBObject();
			query.put("emailId", emailId);

			query.put("HHCode", HHCode);

			query.put("iHHDCode", HHIndividualCode);

			DBCollection coll3 = dbobj
					.getCollection(ServerConfig.mongoDB_CIPBProduct_Collection);

			DBCursor result3 = coll3.find(query);

			DBObject dbObj2 = null;

			while (result3.hasNext()) {
				dbObj2 = result3.next();

				Map<String, Object> monthWishDoc = (Map<String, Object>) dbObj2
						.get("monthWishDoc");

				String month = (String) monthWishDoc.get("month");

				monthList.add(month);

			}

			HashSet<String> listToSet2 = new HashSet<String>(monthList);

			monthList = new ArrayList<String>(listToSet2);

			respCodeMAp.put(HHIndividualCode, monthList);

			hhcodeMap.put(HHCode, respCodeMAp);

			stdIdMap.put(stdId, hhcodeMap);
		}

		return stdIdMap;

	}

	public Map<String, Map<String, Map<String, List<StudentDashboardVO>>>> getStudentDashboardData(
			String emailId) {

		DB dbobj = MongoDBConnector.mongoDbConnector();

		DBCollection coll = dbobj
				.getCollection(ServerConfig.mongoDB_IHHP_Collection);

		BasicDBObject query = new BasicDBObject();
		query.put("emailId", emailId);

		DBCursor result = coll.find(query);

		Map<String, Map<String, Map<String, List<StudentDashboardVO>>>> stdIdMap = new HashMap<String, Map<String, Map<String, List<StudentDashboardVO>>>>();

		Map<String, Map<String, List<StudentDashboardVO>>> hhcodeMap = null;

		Map<String, List<StudentDashboardVO>> respCodeMAp = null;

		List<StudentDashboardVO> stdDashboard = null;

		DBObject dbObj = null;
		while (result.hasNext()) {
			dbObj = result.next();

			stdDashboard = new ArrayList<StudentDashboardVO>();

			respCodeMAp = new HashMap<String, List<StudentDashboardVO>>();

			hhcodeMap = new HashMap<String, Map<String, List<StudentDashboardVO>>>();

			String HHCode = (String) dbObj.get("HHCode");

			String HHIndividualCode = (String) dbObj.get("HHIndividualCode");

			String individualName = (String) dbObj.get("individualName");

			String stdId = getUserId(emailId);

			if (stdIdMap.containsKey(stdId)) {

				hhcodeMap = stdIdMap.get(stdId);

				if (hhcodeMap.containsKey(HHCode)) {

					respCodeMAp = hhcodeMap.get(HHCode);

					if (respCodeMAp.containsKey(HHIndividualCode)) {

						stdDashboard = respCodeMAp.get(HHIndividualCode);

					}

				}

			}

			StudentDashboardVO stdDashboardObj = populateStudentDashboardVO(
					emailId, HHCode, HHIndividualCode);

			stdDashboardObj.setIndividualName(individualName);

			stdDashboard.add(stdDashboardObj);

			respCodeMAp.put(HHIndividualCode, stdDashboard);

			hhcodeMap.put(HHCode, respCodeMAp);

			stdIdMap.put(stdId, hhcodeMap);
		}

		return stdIdMap;

	}

	public StudentDashboardVO populateStudentDashboardVO(String emailId,
			String HHCode, String HHIndividualCode) {

		StudentDashboardVO studentDashboardVO = new StudentDashboardVO();

		DB dbobj = MongoDBConnector.mongoDbConnector();

		BasicDBObject query = new BasicDBObject();
		query.put("emailId", emailId);
		query.put("HHCode", HHCode);

		// shop
		DBCollection coll1 = dbobj
				.getCollection(ServerConfig.mongoDB_ShopProfile_Collection);

		DBCursor result1 = coll1.find(query);

		boolean shopFlag = false;

		if (result1.length() != 0) {
			shopFlag = true;
		}

		// HMP Month List
		DBCollection coll4 = dbobj
				.getCollection(ServerConfig.mongoDB_HMPProduct_Collection);

		DBCursor result4 = coll4.find(query);

		DBObject dbObj3 = null;

		List<String> hMPPMonthList = new ArrayList<String>();

		while (result4.hasNext()) {
			dbObj3 = result4.next();

			Map<String, Object> monthWishDoc = (Map<String, Object>) dbObj3
					.get("monthWishDoc");

			String month = (String) monthWishDoc.get("month");

			hMPPMonthList.add(month);

		}

		query.put("iHHDCode", HHIndividualCode);

		// CIPV Month List
		DBCollection coll2 = dbobj
				.getCollection(ServerConfig.mongoDB_CIPVProduct_Collection);

		DBCursor result2 = coll2.find(query);

		DBObject dbObj1 = null;

		List<String> cIPVMonthList = new ArrayList<String>();

		while (result2.hasNext()) {
			dbObj1 = result2.next();

			Map<String, Object> monthWishDoc = (Map<String, Object>) dbObj1
					.get("monthWishDoc");

			String month = (String) monthWishDoc.get("month");

			cIPVMonthList.add(month);

		}

		// CIPB Month List
		DBCollection coll3 = dbobj
				.getCollection(ServerConfig.mongoDB_CIPBProduct_Collection);

		DBCursor result3 = coll3.find(query);

		DBObject dbObj2 = null;

		List<String> cIPBMonthList = new ArrayList<String>();

		while (result3.hasNext()) {
			dbObj2 = result3.next();

			Map<String, Object> monthWishDoc = (Map<String, Object>) dbObj2
					.get("monthWishDoc");

			String month = (String) monthWishDoc.get("month");

			cIPBMonthList.add(month);

		}

		studentDashboardVO.setShop(shopFlag);

		studentDashboardVO.setProductVisible(cIPVMonthList);

		studentDashboardVO.setProductBought(cIPBMonthList);

		studentDashboardVO.setHHPurchase(hMPPMonthList);

		return studentDashboardVO;

	}

	public UserInfoVo populateData(DBObject dbObj, UserInfoVo userInfoVo) {

		String userId = (String) dbObj.get("userId");
		userInfoVo.setUserId(userId);

		String password = (String) dbObj.get("password");
		userInfoVo.setPassword(password);

		String emailId = (String) dbObj.get("emailId");
		userInfoVo.setEmailId(emailId);

		String role = (String) dbObj.get("role");
		userInfoVo.setRole(role);

		String name = (String) dbObj.get("name");
		userInfoVo.setName(name);

		String collegeName = (String) dbObj.get("collegeName");
		userInfoVo.setCollegeName(collegeName);

		String collegeAddr = (String) dbObj.get("collegeAddr");
		userInfoVo.setCollegeAddr(collegeAddr);

		String city = (String) dbObj.get("city");
		userInfoVo.setCity(city);

		String createdDate = (String) dbObj.get("createdDate");
		userInfoVo.setCreatedDate(createdDate);

		return userInfoVo;

	}

	public HouseholdProfileVo getHHProfile(String emailId, String HHCode) {
		DB dbobj = MongoDBConnector.mongoDbConnector();

		HouseholdProfileVo hhProfileVo = new HouseholdProfileVo();

		DBCollection coll = dbobj
				.getCollection(ServerConfig.mongoDB_HHProfile_Collection);

		BasicDBObject query = new BasicDBObject();
		query.put("emailId", emailId);
		query.put("HHCode", HHCode);

		DBCursor result = coll.find(query);

		DBObject dbObj = null;

		while (result.hasNext()) {
			dbObj = result.next();

			String userId = (String) dbObj.get("userId");
			hhProfileVo.setUserId(userId);

			String emailIdFromDB = (String) dbObj.get("emailId");
			hhProfileVo.setEmailId(emailIdFromDB);

			String HHCodeFromDB = (String) dbObj.get("HHCode");
			hhProfileVo.setHHCode(HHCodeFromDB);

			String area = (String) dbObj.get("area");
			hhProfileVo.setArea(area);

			String googleLocation = (String) dbObj.get("googleLocation");
			hhProfileVo.setGoogleLocation(googleLocation);

			String hhType = (String) dbObj.get("hhType");
			hhProfileVo.setHhType(hhType);

			String vehicleType = (String) dbObj.get("vehicleType");
			hhProfileVo.setVehicleType(vehicleType);

			String vehicleBrand = (String) dbObj.get("vehicleBrand");
			hhProfileVo.setVehicleBrand(vehicleBrand);

			String cableConnection = (String) dbObj.get("cableConnection");
			hhProfileVo.setCableConnection(cableConnection);

			String netConnection = (String) dbObj.get("netConnection");
			hhProfileVo.setNetConnection(netConnection);

		}
		return hhProfileVo;

	}

	public int getListHHCodeCollSize() {
		DB dbobj = MongoDBConnector.mongoDbConnector();

		DBCollection coll = dbobj
				.getCollection(ServerConfig.mongoDB_HHProfile_Collection);

		DBCursor result = coll.find();

		int noOfProfile = result.size();

		return noOfProfile;
	}

	public List<String> getListHHCodeForEmailID(String emailId) {
		DB dbobj = MongoDBConnector.mongoDbConnector();

		DBCollection coll = dbobj
				.getCollection(ServerConfig.mongoDB_HHProfile_Collection);

		List<String> hhCodeList = new ArrayList<String>();

		BasicDBObject query = new BasicDBObject();
		query.put("emailId", emailId);

		DBCursor result = coll.find(query);

		DBObject dbObj = null;

		while (result.hasNext()) {
			dbObj = result.next();

			String HHCode = (String) dbObj.get("HHCode");

			hhCodeList.add(HHCode);

		}

		return hhCodeList;
	}

	public List<String> getHHIndividualCodeList(String emailId, String HHCode) {
		DB dbobj = MongoDBConnector.mongoDbConnector();

		DBCollection coll = dbobj
				.getCollection(ServerConfig.mongoDB_IHHP_Collection);

		List<String> listHHIndividualCode = new ArrayList<String>();

		BasicDBObject query = new BasicDBObject();
		query.put("emailId", emailId);
		query.put("HHCode", HHCode);

		DBCursor result = coll.find(query);

		DBObject dbObj = null;

		while (result.hasNext()) {
			dbObj = result.next();

			String HHIndividualCode = (String) dbObj.get("HHIndividualCode");
			String individualName = (String) dbObj.get("individualName");

			String displayName = HHIndividualCode + "  " + individualName;

			listHHIndividualCode.add(displayName);

		}

		return listHHIndividualCode;
	}

	public List<String> getShopListForHHProfile(String emailId, String HHCode) {
		DB dbobj = MongoDBConnector.mongoDbConnector();

		DBCollection coll = dbobj
				.getCollection(ServerConfig.mongoDB_ShopProfile_Collection);

		List<String> listHHIndividualCode = new ArrayList<String>();

		BasicDBObject query = new BasicDBObject();
		query.put("emailId", emailId);
		query.put("HHCode", HHCode);

		DBCursor result = coll.find(query);

		DBObject dbObj = null;

		while (result.hasNext()) {
			dbObj = result.next();

			String shopCode = (String) dbObj.get("shopCode");
			String shopName = (String) dbObj.get("shopName");
			String area = (String) dbObj.get("area");

			String displayName = shopCode + "  " + shopName + "-" + area;

			listHHIndividualCode.add(displayName);

		}

		return listHHIndividualCode;
	}

	public List<IHHProfileVO> getIHHPList(String emailId, String HHCode) {
		DB dbobj = MongoDBConnector.mongoDbConnector();

		List<IHHProfileVO> listIHHProfileVO = new ArrayList<IHHProfileVO>();

		DBCollection coll = dbobj
				.getCollection(ServerConfig.mongoDB_IHHP_Collection);

		BasicDBObject query = new BasicDBObject();
		query.put("emailId", emailId);
		query.put("HHCode", HHCode);

		DBCursor result = coll.find(query);

		DBObject dbObj = null;

		IHHProfileVO ihhProfileVO = null;

		while (result.hasNext()) {

			ihhProfileVO = new IHHProfileVO();

			dbObj = result.next();

			String emailIdFromDB = (String) dbObj.get("emailId");
			ihhProfileVO.setEmailId(emailIdFromDB);

			String HHCodeFromDB = (String) dbObj.get("HHCode");
			ihhProfileVO.setHHCode(HHCodeFromDB);

			String HHIndividualCode = (String) dbObj.get("HHIndividualCode");
			ihhProfileVO.setHHIndividualCode(HHIndividualCode);

			String individualName = (String) dbObj.get("individualName");
			ihhProfileVO.setIndividualName(individualName);

			String age = (String) dbObj.get("age");
			ihhProfileVO.setAge(age);

			String sex = (String) dbObj.get("sex");
			ihhProfileVO.setSex(sex);

			String relationship = (String) dbObj.get("relationship");
			ihhProfileVO.setRelationship(relationship);

			String education = (String) dbObj.get("education");
			ihhProfileVO.setEducation(education);

			String occupation = (String) dbObj.get("occupation");
			ihhProfileVO.setOccupation(occupation);

			String workplace = (String) dbObj.get("workplace");
			ihhProfileVO.setWorkplace(workplace);

			String transport = (String) dbObj.get("transport");
			ihhProfileVO.setTransport(transport);

			String mobileType = (String) dbObj.get("mobileType");
			ihhProfileVO.setMobileType(mobileType);

			String mobileBrand = (String) dbObj.get("mobileBrand");
			ihhProfileVO.setMobileBrand(mobileBrand);

			String mobileBill = (String) dbObj.get("mobileBill");
			ihhProfileVO.setMobileBill(mobileBill);

			String netConnection = (String) dbObj.get("netConnection");
			ihhProfileVO.setNetConnection(netConnection);

			String socialMedia = (String) dbObj.get("socialMedia");
			ihhProfileVO.setSocialMedia(socialMedia);

			String sitesfequentyvisited = (String) dbObj
					.get("sitesfequentyvisited");
			ihhProfileVO.setSitesfequentyvisited(sitesfequentyvisited);

			String recreationActivities = (String) dbObj
					.get("recreationActivities");
			ihhProfileVO.setRecreationActivities(recreationActivities);

			String hobbies = (String) dbObj.get("hobbies");
			ihhProfileVO.setHobbies(hobbies);

			String channels = (String) dbObj.get("channels");
			ihhProfileVO.setChannels(channels);

			String newspapers = (String) dbObj.get("newspapers");
			ihhProfileVO.setNewspapers(newspapers);

			String magazines = (String) dbObj.get("magazines");
			ihhProfileVO.setMagazines(magazines);

			listIHHProfileVO.add(ihhProfileVO);

		}
		return listIHHProfileVO;

	}

	public ShopProfileVO getShopProfileInfo(String emailId, String HHCode,
			String shopCode) {

		DB dbobj = MongoDBConnector.mongoDbConnector();

		ShopProfileVO shopProfileVO = new ShopProfileVO();

		DBCollection coll = dbobj
				.getCollection(ServerConfig.mongoDB_ShopProfile_Collection);

		BasicDBObject query = new BasicDBObject();
		query.put("emailId", emailId);

		query.put("HHCode", HHCode);

		query.put("shopCode", shopCode);

		DBCursor result = coll.find(query);

		DBObject dbObj = null;

		while (result.hasNext()) {

			dbObj = result.next();

			shopProfileVO.setEmailId((String) dbObj.get("emailId"));

			shopProfileVO.setHHCode((String) dbObj.get("HHCode"));

			shopProfileVO.setShopCode((String) dbObj.get("shopCode"));

			shopProfileVO.setShopName((String) dbObj.get("shopName"));

			shopProfileVO.setArea((String) dbObj.get("area"));

		}

		return shopProfileVO;

	}

	public List<ShopProfileVO> getShopList(String emailId, String HHCode) {
		DB dbobj = MongoDBConnector.mongoDbConnector();

		List<ShopProfileVO> listShopProfileVO = new ArrayList<ShopProfileVO>();

		DBCollection coll = dbobj
				.getCollection(ServerConfig.mongoDB_ShopProfile_Collection);

		BasicDBObject query = new BasicDBObject();
		query.put("emailId", emailId);
		query.put("HHCode", HHCode);

		DBCursor result = coll.find(query);

		DBObject dbObj = null;

		ShopProfileVO shopProfileVO = null;

		while (result.hasNext()) {

			shopProfileVO = new ShopProfileVO();

			dbObj = result.next();

			String emailIdFromDB = (String) dbObj.get("emailId");
			shopProfileVO.setEmailId(emailIdFromDB);

			String HHCodeFromDB = (String) dbObj.get("HHCode");
			shopProfileVO.setHHCode(HHCodeFromDB);

			String shopCode = (String) dbObj.get("shopCode");
			shopProfileVO.setShopCode(shopCode);

			String shopName = (String) dbObj.get("shopName");
			shopProfileVO.setShopName(shopName);

			String outletType = (String) dbObj.get("outletType");
			shopProfileVO.setOutletType(outletType);

			String area = (String) dbObj.get("area");
			shopProfileVO.setArea(area);

			String pincode = (String) dbObj.get("pincode");
			shopProfileVO.setPincode(pincode);

			String doordelivery = (String) dbObj.get("doordelivery");
			shopProfileVO.setDoordelivery(doordelivery);

			String phoneorder = (String) dbObj.get("phoneorder");
			shopProfileVO.setPhoneorder(phoneorder);

			String selfpickup = (String) dbObj.get("selfpickup");
			shopProfileVO.setSelfpickup(selfpickup);

			String monthlycredit = (String) dbObj.get("monthlycredit");
			shopProfileVO.setMonthlycredit(monthlycredit);

			String shoppingbasket = (String) dbObj.get("shoppingbasket");
			shopProfileVO.setShoppingbasket(shoppingbasket);

			String creditcard = (String) dbObj.get("creditcard");
			shopProfileVO.setCreditcard(creditcard);

			String electronicbilling = (String) dbObj.get("electronicbilling");
			shopProfileVO.setElectronicbilling(electronicbilling);

			String noOfAssistant = (String) dbObj.get("noOfAssistant");
			shopProfileVO.setNoOfAssistant(noOfAssistant);

			String distInMin = (String) dbObj.get("distInMin");
			shopProfileVO.setDistInMin(distInMin);

			String distInKm = (String) dbObj.get("distInKm");
			shopProfileVO.setDistInKm(distInKm);

			String shopFrontFt = (String) dbObj.get("shopFrontFt");
			shopProfileVO.setShopFrontFt(shopFrontFt);

			listShopProfileVO.add(shopProfileVO);

		}
		return listShopProfileVO;

	}

	public CIPVProfileVO getCIPVMonthList(String emailId, String HHCode,
			String iHHDCode) {

		CIPVProfileVO cIPVProfileVO = new CIPVProfileVO();

		DB dbobj = MongoDBConnector.mongoDbConnector();

		DBCollection coll = dbobj
				.getCollection(ServerConfig.mongoDB_CIPVProduct_Collection);

		BasicDBObject query = new BasicDBObject();
		query.put("emailId", emailId);

		if (HHCode != null && HHCode.length() != 0) {

			query.put("HHCode", HHCode);
		}

		query.put("iHHDCode", iHHDCode);

		DBCursor result = coll.find(query);

		DBObject dbObj = null;

		CIPVProductWiseVO cIPVProductWiseVO = null;

		List<CIPVProductWiseVO> objprod = null;

		Map<String, Map<String, List<CIPVProductWiseVO>>> mapCIPVMonthWise = new HashMap<String, Map<String, List<CIPVProductWiseVO>>>();

		Map<String, List<CIPVProductWiseVO>> objShopList = null;

		while (result.hasNext()) {

			objprod = new ArrayList<CIPVProductWiseVO>();

			cIPVProductWiseVO = new CIPVProductWiseVO();

			objShopList = new HashMap<String, List<CIPVProductWiseVO>>();

			dbObj = result.next();

			Map<String, Object> monthWishDoc = (Map<String, Object>) dbObj
					.get("monthWishDoc");

			Map<String, Object> shopListDetails = (Map<String, Object>) monthWishDoc
					.get("shopList");

			String shopcode = (String) shopListDetails.get("shopcode");

			String month = (String) monthWishDoc.get("month");

			if (mapCIPVMonthWise.containsKey(month)) {

				objShopList = mapCIPVMonthWise.get(month);

				if (objShopList.containsKey(shopcode)) {

					objprod = objShopList.get(shopcode);

				}

			}

			DBObject productListDetails = (DBObject) shopListDetails
					.get("productListDetails");

			String productCatg = (String) productListDetails.get("productCatg");
			cIPVProductWiseVO.setProductCatg(productCatg);

			String subProductCatg = (String) productListDetails
					.get("subProductCatg");
			cIPVProductWiseVO.setSubProductCatg(subProductCatg);

			String skuitem = (String) productListDetails.get("skuitem");
			cIPVProductWiseVO.setSkuitem(skuitem);

			String mrp = (String) productListDetails.get("mrp");
			cIPVProductWiseVO.setMrp(mrp);

			String quantity = (String) productListDetails.get("quantity");
			cIPVProductWiseVO.setQuantity(quantity);

			String amt = (String) productListDetails.get("amt");
			cIPVProductWiseVO.setAmt(amt);

			String brandAds = (String) productListDetails.get("brandAds");
			cIPVProductWiseVO.setBrandAds(brandAds);

			String brandAware = (String) productListDetails.get("brandAware");
			cIPVProductWiseVO.setBrandAware(brandAware);

			String brandOutlet = (String) productListDetails.get("brandOutlet");
			cIPVProductWiseVO.setBrandOutlet(brandOutlet);

			String brandEnquired = (String) productListDetails
					.get("brandEnquired");
			cIPVProductWiseVO.setBrandEnquired(brandEnquired);

			String brandIntendToBuy = (String) productListDetails
					.get("brandIntendToBuy");
			cIPVProductWiseVO.setBrandIntendToBuy(brandIntendToBuy);

			objprod.add(cIPVProductWiseVO);

			objShopList.put(shopcode, objprod);

			mapCIPVMonthWise.put(month, objShopList);

		}

		cIPVProfileVO.setEmailId(emailId);

		cIPVProfileVO.setHHCode(HHCode);

		cIPVProfileVO.setHHIndividualCode(iHHDCode);

		cIPVProfileVO.setcIPVProductWiseVO(mapCIPVMonthWise);

		return cIPVProfileVO;

	}

	public HMPProfileVO getHMPProfileList(String emailId, String HHCode,
			String shopcode) {

		HMPProfileVO hMPProfileVO = new HMPProfileVO();

		DB dbobj = MongoDBConnector.mongoDbConnector();

		DBCollection coll = dbobj
				.getCollection(ServerConfig.mongoDB_HMPProduct_Collection);

		BasicDBObject query = new BasicDBObject();
		query.put("emailId", emailId);
		query.put("HHCode", HHCode);
		query.put("shopcode", shopcode);

		DBCursor result = coll.find(query);

		DBObject dbObj = null;

		HMPProductWiseVO hMPProductWiseVO = null;

		List<HMPProductWiseVO> objprod = null;

		Map<String, Map<String, List<HMPProductWiseVO>>> mapHMPMonthWise = new HashMap<String, Map<String, List<HMPProductWiseVO>>>();

		Map<String, List<HMPProductWiseVO>> occList = null;

		while (result.hasNext()) {

			objprod = new ArrayList<HMPProductWiseVO>();

			hMPProductWiseVO = new HMPProductWiseVO();

			occList = new HashMap<String, List<HMPProductWiseVO>>();

			dbObj = result.next();

			Map<String, Object> monthWishDoc = (Map<String, Object>) dbObj
					.get("monthWishDoc");

			Map<String, Object> shopListDetails = (Map<String, Object>) monthWishDoc
					.get("ocassionList");

			String ocassion = (String) shopListDetails.get("ocassion");

			String month = (String) monthWishDoc.get("month");

			if (mapHMPMonthWise.containsKey(month)) {

				occList = mapHMPMonthWise.get(month);

				if (occList.containsKey(ocassion)) {

					objprod = occList.get(ocassion);

				}

			}

			DBObject productListDetails = (DBObject) shopListDetails
					.get("productListDetails");

			String productCatg = (String) productListDetails.get("productCatg");
			hMPProductWiseVO.setProductCatg(productCatg);

			String subProductCatg = (String) productListDetails
					.get("subProductCatg");
			hMPProductWiseVO.setSubProductCatg(subProductCatg);

			String skuitem = (String) productListDetails.get("skuitem");
			hMPProductWiseVO.setSkuitem(skuitem);

			String mrp = (String) productListDetails.get("mrp");
			hMPProductWiseVO.setMrp(mrp);

			String quantity = (String) productListDetails.get("quantity");
			hMPProductWiseVO.setQuantity(quantity);

			String amt = (String) productListDetails.get("amt");
			hMPProductWiseVO.setAmt(amt);

			objprod.add(hMPProductWiseVO);

			occList.put(ocassion, objprod);

			mapHMPMonthWise.put(month, occList);

		}

		hMPProfileVO.setEmailId(emailId);

		hMPProfileVO.setHHCode(HHCode);

		hMPProfileVO.setShopCode(shopcode);

		hMPProfileVO.sethMPProductWiseVO(mapHMPMonthWise);

		return hMPProfileVO;

	}

	public CIPBProfileVO getCIPBMonthList(String emailId, String HHCode,
			String iHHDCode) {

		CIPBProfileVO cIPBProfileVO = new CIPBProfileVO();

		DB dbobj = MongoDBConnector.mongoDbConnector();

		DBCollection coll = dbobj
				.getCollection(ServerConfig.mongoDB_CIPBProduct_Collection);

		BasicDBObject query = new BasicDBObject();
		query.put("emailId", emailId);
		query.put("HHCode", HHCode);
		query.put("iHHDCode", iHHDCode);

		DBCursor result = coll.find(query);

		DBObject dbObj = null;

		CIPBProductWiseVO cIPBProductWiseVO = null;

		List<CIPBProductWiseVO> objprod = null;

		Map<String, Map<String, Map<String, List<CIPBProductWiseVO>>>> mapCIPBMonthWise = new HashMap<String, Map<String, Map<String, List<CIPBProductWiseVO>>>>();

		Map<String, Map<String, List<CIPBProductWiseVO>>> objShopList = null;

		Map<String, List<CIPBProductWiseVO>> ocassionDetails = null;

		while (result.hasNext()) {

			objprod = new ArrayList<CIPBProductWiseVO>();

			cIPBProductWiseVO = new CIPBProductWiseVO();

			ocassionDetails = new HashMap<String, List<CIPBProductWiseVO>>();

			objShopList = new HashMap<String, Map<String, List<CIPBProductWiseVO>>>();

			dbObj = result.next();

			Map<String, Object> monthWishDoc = (Map<String, Object>) dbObj
					.get("monthWishDoc");

			Map<String, Object> shopListDetails = (Map<String, Object>) monthWishDoc
					.get("shopList");

			Map<String, Object> ocassionList = (Map<String, Object>) shopListDetails
					.get("ocassionList");

			String ocassion = (String) ocassionList.get("ocassion");

			String shopcode = (String) shopListDetails.get("shopcode");

			String month = (String) monthWishDoc.get("month");

			if (mapCIPBMonthWise.containsKey(month)) {

				objShopList = mapCIPBMonthWise.get(month);

				if (objShopList.containsKey(shopcode)) {

					ocassionDetails = objShopList.get(shopcode);

					if (ocassionDetails.containsKey(ocassion)) {

						objprod = ocassionDetails.get(ocassion);

					}

				}

			}

			DBObject productListDetails = (DBObject) ocassionList
					.get("productListDetails");

			String productCatg = (String) productListDetails.get("productCatg");
			cIPBProductWiseVO.setProductCatg(productCatg);

			String subProductCatg = (String) productListDetails
					.get("subProductCatg");
			cIPBProductWiseVO.setSubProductCatg(subProductCatg);

			String brands = (String) productListDetails.get("brands");
			cIPBProductWiseVO.setBrands(brands);

			String subbrands = (String) productListDetails.get("subbrands");
			cIPBProductWiseVO.setSubbrands(subbrands);

			String skuitem = (String) productListDetails.get("skuitem");
			cIPBProductWiseVO.setSkuitem(skuitem);

			String mrp = (String) productListDetails.get("mrp");
			cIPBProductWiseVO.setMrp(mrp);

			String quantity = (String) productListDetails.get("quantity");
			cIPBProductWiseVO.setQuantity(quantity);

			String amt = (String) productListDetails.get("amt");
			cIPBProductWiseVO.setAmt(amt);

			String madeyoubuy = (String) productListDetails.get("madeyoubuy");
			cIPBProductWiseVO.setMadeyoubuy(madeyoubuy);

			String happypurchase = (String) productListDetails
					.get("happypurchase");
			cIPBProductWiseVO.setHappypurchase(happypurchase);

			String whyhappypurchase = (String) productListDetails
					.get("whyhappypurchase");
			cIPBProductWiseVO.setWhyhappypurchase(whyhappypurchase);

			String repeatpurchase = (String) productListDetails
					.get("repeatpurchase");
			cIPBProductWiseVO.setRepeatpurchase(repeatpurchase);

			String whyrepeatpurchase = (String) productListDetails
					.get("whyrepeatpurchase");
			cIPBProductWiseVO.setWhyrepeatpurchase(whyrepeatpurchase);

			String willrecommend = (String) productListDetails
					.get("willrecommend");
			cIPBProductWiseVO.setWillrecommend(willrecommend);

			String whyrecommend = (String) productListDetails
					.get("whyrecommend");
			cIPBProductWiseVO.setWhyrecommend(whyrecommend);

			String brandAds = (String) productListDetails.get("brandAds");
			cIPBProductWiseVO.setBrandAds(brandAds);

			String brandAware = (String) productListDetails.get("brandAware");
			cIPBProductWiseVO.setBrandAware(brandAware);

			String brandOutlet = (String) productListDetails.get("brandOutlet");
			cIPBProductWiseVO.setBrandOutlet(brandOutlet);

			String brandEnquired = (String) productListDetails
					.get("brandEnquired");
			cIPBProductWiseVO.setBrandEnquired(brandEnquired);

			objprod.add(cIPBProductWiseVO);

			ocassionDetails.put(ocassion, objprod);

			objShopList.put(shopcode, ocassionDetails);

			mapCIPBMonthWise.put(month, objShopList);

		}

		cIPBProfileVO.setEmailId(emailId);

		cIPBProfileVO.setHHCode(HHCode);

		cIPBProfileVO.setHHIndividualCode(iHHDCode);

		cIPBProfileVO.setcIPBProductWiseVO(mapCIPBMonthWise);

		return cIPBProfileVO;

	}

	public List<String> getStudentYearList(String year) {

		List<String> listStdYear = new ArrayList<String>();

		DB dbobj = MongoDBConnector.mongoDbConnector();

		DBCollection coll = dbobj
				.getCollection(ServerConfig.mongoDB_User_Collection);

		DBCursor result = coll.find();

		DBObject dbObj = null;

		while (result.hasNext()) {

			dbObj = result.next();

			String createdDate = (String) dbObj.get("createdDate");

			String role = (String) dbObj.get("role");

			if (createdDate.contains(year) && !role.equalsIgnoreCase("Admin")) {

				int count = 0;
				for (String retval : createdDate.split(" ", 2)) {

					if (count != 0) {
						listStdYear.add(retval);
					}

					count = count + 1;
				}

			}

		}
		return listStdYear;

	}

	public List<String> getYearList(String year, String collectionName) {

		List<String> listStdYear = new ArrayList<String>();

		DB dbobj = MongoDBConnector.mongoDbConnector();

		DBCollection coll = dbobj
				.getCollection(collectionName);

		DBCursor result = coll.find();

		DBObject dbObj = null;

		while (result.hasNext()) {

			dbObj = result.next();

			String createdMonthAndYear = (String) dbObj
					.get("createdMonthAndYear");

			if (createdMonthAndYear != null && createdMonthAndYear.contains(year)) {

				listStdYear.add(createdMonthAndYear);

			}

		}
		return listStdYear;

	}
}
