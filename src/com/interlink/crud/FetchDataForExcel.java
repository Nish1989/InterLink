package com.interlink.crud;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.interlink.config.ServerConfig;
import com.interlink.mongo.MongoDBConnector;
import com.interlink.vo.ShopProfileVO;
import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.DBObject;

public class FetchDataForExcel {


	public Map<Integer, List<String>> getHHProfile(String emailId, String HHCode,String role) {
		DB dbobj = MongoDBConnector.mongoDbConnector();

		DBCollection coll = dbobj
				.getCollection(ServerConfig.mongoDB_HHProfile_Collection);
		
		DBCursor result = null;
		
		if(!role.equalsIgnoreCase("Admin"))
		{
			BasicDBObject query = new BasicDBObject();
			
			query.put("emailId", emailId);
			query.put("HHCode", HHCode);
			result = coll.find(query);
			
		}else{
			
			result = coll.find();
		}
		
	
		DBObject dbObj = null;

		Map<Integer, List<String>> profileMap = new HashMap<Integer, List<String>>();

		List<String> value = new ArrayList<String>();
		
		//value.add("Email Id");
		value.add("HHCode");
		value.add("Area");
		value.add("Google Co-ordinate");
		value.add("Type of household");
		value.add("Vehicle Type");
		value.add("Vehical Brand");
		value.add("Cable/Dish connection");
		value.add("Net connection");

		int count = 0;

		profileMap.put(count, value);

		while (result.hasNext()) {

			count = count + 1;

			value = new ArrayList<String>();

			dbObj = result.next();

			//value.add((String) dbObj.get("emailId"));

			value.add((String) dbObj.get("HHCode"));

			value.add((String) dbObj.get("area"));

			value.add((String) dbObj.get("googleLocation"));

			value.add((String) dbObj.get("hhType"));

			value.add((String) dbObj.get("vehicleType"));

			value.add((String) dbObj.get("vehicleBrand"));

			value.add((String) dbObj.get("cableConnection"));

			value.add((String) dbObj.get("netConnection"));

			profileMap.put(count, value);

		}

		return profileMap;

	}

	public Map<Integer, List<String>> getIHHPList(String emailId, String HHCode ,String role) {
		DB dbobj = MongoDBConnector.mongoDbConnector();

		DBCollection coll = dbobj
				.getCollection(ServerConfig.mongoDB_IHHP_Collection);

		
		DBCursor result = null;
		
		if(!role.equalsIgnoreCase("Admin"))
		{
			BasicDBObject query = new BasicDBObject();
			
			query.put("emailId", emailId);
			query.put("HHCode", HHCode);

			result = coll.find(query);
			
		}else{
			
			result = coll.find();
		}
		
		

		DBObject dbObj = null;
		Map<Integer, List<String>> ihhpMap = new HashMap<Integer, List<String>>();

		List<String> value = new ArrayList<String>();

		//value.add("Email Id");

		value.add("HHCode");

		value.add("HHIndividualCode");

		value.add("Individual Name");

		value.add("Age");

		value.add("Sex");

		value.add("Relationship");

		value.add("Education");

		value.add("Occupation");

		value.add("Place of Work");

		value.add("Mode of Transport");

		value.add("Type of Mobile");

		value.add("Mobile Brand");

		value.add("Avg monthly mobile bill");

		value.add("Type of internet access");

		value.add("Access to social media");

		value.add("Sites fequenty visited");

		value.add("Recreation activities");

		value.add("Hobbies");

		value.add("Channels Watch");

		value.add("Newspapers Subscribed");

		value.add("Magazines Subscribed");

		int count = 0;

		ihhpMap.put(count, value);

		while (result.hasNext()) {

			count = count + 1;

			value = new ArrayList<String>();

			dbObj = result.next();

			//value.add((String) dbObj.get("emailId"));

			value.add((String) dbObj.get("HHCode"));

			value.add((String) dbObj.get("HHIndividualCode"));

			value.add((String) dbObj.get("individualName"));

			value.add((String) dbObj.get("age"));

			value.add((String) dbObj.get("sex"));

			value.add((String) dbObj.get("relationship"));

			value.add((String) dbObj.get("education"));

			value.add((String) dbObj.get("occupation"));

			value.add((String) dbObj.get("workplace"));

			value.add((String) dbObj.get("transport"));

			value.add((String) dbObj.get("mobileType"));

			value.add((String) dbObj.get("mobileBrand"));

			value.add((String) dbObj.get("mobileBill"));

			value.add((String) dbObj.get("netConnection"));

			value.add((String) dbObj.get("socialMedia"));

			value.add((String) dbObj.get("sitesfequentyvisited"));

			value.add((String) dbObj.get("recreationActivities"));

			value.add((String) dbObj.get("hobbies"));

			value.add((String) dbObj.get("channels"));

			value.add((String) dbObj.get("newspapers"));

			value.add((String) dbObj.get("magazines"));

			ihhpMap.put(count, value);
		}

		return ihhpMap;

	}

	public Map<Integer, List<String>> getShopList(String emailId, String HHCode,String role) {
		DB dbobj = MongoDBConnector.mongoDbConnector();

		DBCollection coll = dbobj
				.getCollection(ServerConfig.mongoDB_ShopProfile_Collection);

	DBCursor result = null;
		
		if(!role.equalsIgnoreCase("Admin"))
		{
			BasicDBObject query = new BasicDBObject();
			
			query.put("emailId", emailId);
			query.put("HHCode", HHCode);

			result = coll.find(query);
			
		}else{
			
			result = coll.find();
		}
		
		

		DBObject dbObj = null;

		Map<Integer, List<String>> spMap = new HashMap<Integer, List<String>>();

		List<String> value = new ArrayList<String>();

		//value.add("Email Id");

		value.add("HHCode");

		value.add("Shop Code");

		value.add("Shop Name");

		value.add("Type of Outlet");

		value.add("Area");

		value.add("Pincode");

		value.add("Door Delivery");

		value.add("Phone Order");

		value.add("Selfpickup");

		value.add("Monthly Credit");

		value.add("Shopping Bascket");

		value.add("Credit Card");

		value.add("Electronic Billing");

		value.add("No. of Assistant");

		value.add("Dist in Min from home");

		value.add("Dist in KM from home");

		value.add("Shop Front in Ft from home");

		int count = 0;

		spMap.put(count, value);

		while (result.hasNext()) {

			count = count + 1;

			value = new ArrayList<String>();

			dbObj = result.next();

			//value.add((String) dbObj.get("emailId"));

			value.add((String) dbObj.get("HHCode"));

			value.add((String) dbObj.get("shopCode"));

			value.add((String) dbObj.get("shopName"));

			value.add((String) dbObj.get("outletType"));

			value.add((String) dbObj.get("area"));

			value.add((String) dbObj.get("pincode"));

			value.add((String) dbObj.get("doordelivery"));

			value.add((String) dbObj.get("phoneorder"));

			value.add((String) dbObj.get("selfpickup"));

			value.add((String) dbObj.get("monthlycredit"));

			value.add((String) dbObj.get("shoppingbasket"));

			value.add((String) dbObj.get("creditcard"));

			value.add((String) dbObj.get("electronicbilling"));

			value.add((String) dbObj.get("noOfAssistant"));

			value.add((String) dbObj.get("distInMin"));

			value.add((String) dbObj.get("distInKm"));

			value.add((String) dbObj.get("shopFrontFt"));

			spMap.put(count, value);
		}

		return spMap;

	}

	public Map<Integer, List<String>> getHMPProfileList(String emailId,
			String HHCode,String role) {

		DB dbobj = MongoDBConnector.mongoDbConnector();

		DBCollection coll = dbobj
				.getCollection(ServerConfig.mongoDB_HMPProduct_Collection);

	DBCursor result = null;
		
		if(!role.equalsIgnoreCase("Admin"))
		{
			BasicDBObject query = new BasicDBObject();
			
			query.put("emailId", emailId);
			query.put("HHCode", HHCode);

			result = coll.find(query);
			
		}else{
			
			result = coll.find();
		}
		
		

		DBObject dbObj = null;

		Map<Integer, List<String>> hmpMap = new HashMap<Integer, List<String>>();

		List<String> value = new ArrayList<String>();

		//value.add("Email Id");

		value.add("HHCode");

		value.add("Shop Code");

		value.add("Shop Name");

		value.add("Area");

		value.add("Month");

		value.add("Purcahse occasion");

		value.add("Product Catg");

		value.add("Sub product Catg");

		value.add("SKU - Item");

		value.add("MRP");

		value.add("Quantity");

		value.add("Amount");

		int count = 0;

		hmpMap.put(count, value);

		while (result.hasNext()) {

			count = count + 1;

			value = new ArrayList<String>();

			dbObj = result.next();

			//value.add((String) dbObj.get("emailId"));

			value.add((String) dbObj.get("HHCode"));

			String shopCode = (String) dbObj.get("shopcode");

			value.add(shopCode);

			ShopProfileVO shopProfileVO = new FetchFromDBManager()
					.getShopProfileInfo((String) dbObj.get("emailId"), (String) dbObj.get("HHCode"), shopCode);

			value.add(shopProfileVO.getShopName());

			value.add(shopProfileVO.getArea());

			Map<String, Object> monthWishDoc = (Map<String, Object>) dbObj
					.get("monthWishDoc");

			Map<String, Object> shopListDetails = (Map<String, Object>) monthWishDoc
					.get("ocassionList");

			String month = (String) monthWishDoc.get("month");

			String ocassion = (String) shopListDetails.get("ocassion");

			value.add(month);

			value.add(ocassion);

			DBObject productListDetails = (DBObject) shopListDetails
					.get("productListDetails");

			value.add((String) productListDetails.get("productCatg"));

			value.add((String) productListDetails.get("subProductCatg"));

			value.add((String) productListDetails.get("skuitem"));

			value.add((String) productListDetails.get("mrp"));

			value.add((String) productListDetails.get("quantity"));

			value.add((String) productListDetails.get("amt"));

			hmpMap.put(count, value);
		}

		return hmpMap;

	}

	public Map<Integer, List<String>> getCIPVMonth(String emailId, String HHCode,String role) {

		DB dbobj = MongoDBConnector.mongoDbConnector();

		DBCollection coll = dbobj
				.getCollection(ServerConfig.mongoDB_CIPVProduct_Collection);

	DBCursor result = null;
		
		if(!role.equalsIgnoreCase("Admin"))
		{
			BasicDBObject query = new BasicDBObject();
			
			query.put("emailId", emailId);
			query.put("HHCode", HHCode);

			result = coll.find(query);
			
		}else{
			
			result = coll.find();
		}
		
		

		Map<Integer, List<String>> cipvMap = new HashMap<Integer, List<String>>();

		List<String> value = new ArrayList<String>();

		

		//value.add("Email Id");

		value.add("HHCode");

		value.add("Respondent Code");

		value.add("Month");

		value.add("Shop Code");

		value.add("Shop Name");

		value.add("Area");

		value.add("Product Catg");

		value.add("Sub product Catg");

		value.add("SKU - Item");

		value.add("MRP");

		value.add("Quantity");

		value.add("Amount");

		value.add("Brands you have seen ads");

		value.add("Brands you are aware");

		value.add("Brands Visible at Outlet");

		value.add("Brands you searched Enquired");

		value.add("Brands you intend to buy");

		DBObject dbObj = null;

		int count = 0;

		cipvMap.put(count, value);

		while (result.hasNext()) {

			count = count + 1;

			value = new ArrayList<String>();

			dbObj = result.next();

			//value.add((String) dbObj.get("emailId"));

			value.add((String) dbObj.get("HHCode"));

			String iHHDCode = (String) dbObj.get("iHHDCode");

			value.add(iHHDCode);

			Map<String, Object> monthWishDoc = (Map<String, Object>) dbObj
					.get("monthWishDoc");

			Map<String, Object> shopListDetails = (Map<String, Object>) monthWishDoc
					.get("shopList");

			String shopCode = (String) shopListDetails.get("shopcode");

			String month = (String) monthWishDoc.get("month");

			ShopProfileVO shopProfileVO = new FetchFromDBManager()
			.getShopProfileInfo((String) dbObj.get("emailId"), (String) dbObj.get("HHCode"), shopCode);
			
			

			value.add(month);

			value.add(shopCode);

			value.add(shopProfileVO.getShopName());

			value.add(shopProfileVO.getArea());

			DBObject productListDetails = (DBObject) shopListDetails
					.get("productListDetails");

			value.add((String) productListDetails.get("productCatg"));

			value.add((String) productListDetails.get("subProductCatg"));

			value.add((String) productListDetails.get("skuitem"));

			value.add((String) productListDetails.get("mrp"));

			value.add((String) productListDetails.get("quantity"));

			value.add((String) productListDetails.get("amt"));

			value.add((String) productListDetails.get("brandAds"));

			value.add((String) productListDetails.get("brandAware"));

			value.add((String) productListDetails.get("brandOutlet"));

			value.add((String) productListDetails.get("brandEnquired"));

			value.add((String) productListDetails.get("brandIntendToBuy"));

			cipvMap.put(count, value);
		}

		return cipvMap;

	}

	public Map<Integer, List<String>> getCIPBMonth(String emailId, String HHCode, String role) {

		DB dbobj = MongoDBConnector.mongoDbConnector();

		DBCollection coll = dbobj
				.getCollection(ServerConfig.mongoDB_CIPBProduct_Collection);

	DBCursor result = null;
		
		if(!role.equalsIgnoreCase("Admin"))
		{
			BasicDBObject query = new BasicDBObject();
			
			query.put("emailId", emailId);
			query.put("HHCode", HHCode);

			result = coll.find(query);
			
		}else{
			
			result = coll.find();
		}
		
	
		Map<Integer, List<String>> cipbMap = new HashMap<Integer, List<String>>();

		List<String> value = new ArrayList<String>();

		
		//value.add("Email Id");

		value.add("HHCode");

		value.add("Respondent Code");

		value.add("Month");

		value.add("Purcahse Occasion");

		value.add("Shop Code");

		value.add("Shop Name");

		value.add("Area");

		value.add("Product Catg");

		value.add("Sub product Catg");

		value.add("Brands");

		value.add("Sub Brands");

		value.add("SKU - Item");

		value.add("MRP");

		value.add("Quantity");

		value.add("Amount");

		value.add("What Made you buy");

		value.add("Happy with the purchase ?");

		value.add("Why");

		value.add("Will you repeat the purchase ?");

		value.add("Why");

		value.add("will you recommend ?");

		value.add("Why");

		value.add("Brands you are aware");

		value.add("Brands you have seen ads");

		value.add("Brands Visible at Outlet");

		value.add("Brands you searched Enquired");

		DBObject dbObj = null;

		int count = 0;

		cipbMap.put(count, value);

		while (result.hasNext()) {

			count = count + 1;

			value = new ArrayList<String>();

			dbObj = result.next();

			//value.add((String) dbObj.get("emailId"));

			value.add((String) dbObj.get("HHCode"));

			String iHHDCode = (String) dbObj.get("iHHDCode");

			value.add(iHHDCode);

			Map<String, Object> monthWishDoc = (Map<String, Object>) dbObj
					.get("monthWishDoc");

			Map<String, Object> shopListDetails = (Map<String, Object>) monthWishDoc
					.get("shopList");

			Map<String, Object> ocassionList = (Map<String, Object>) shopListDetails
					.get("ocassionList");

			String ocassion = (String) ocassionList.get("ocassion");

			String shopCode = (String) shopListDetails.get("shopcode");

			String month = (String) monthWishDoc.get("month");

			ShopProfileVO shopProfileVO = new FetchFromDBManager()
			.getShopProfileInfo((String) dbObj.get("emailId"), (String) dbObj.get("HHCode"), shopCode);
			

			value.add(month);

			value.add(ocassion);

			value.add(shopCode);

			value.add(shopProfileVO.getShopName());

			value.add(shopProfileVO.getArea());

			DBObject productListDetails = (DBObject) ocassionList
					.get("productListDetails");

			value.add((String) productListDetails.get("productCatg"));

			value.add((String) productListDetails.get("subProductCatg"));

			value.add((String) productListDetails.get("brands"));

			value.add((String) productListDetails.get("subbrands"));

			value.add((String) productListDetails.get("skuitem"));

			value.add((String) productListDetails.get("mrp"));

			value.add((String) productListDetails.get("quantity"));

			value.add((String) productListDetails.get("amt"));

			value.add((String) productListDetails.get("madeyoubuy"));

			value.add((String) productListDetails.get("happypurchase"));

			value.add((String) productListDetails.get("whyhappypurchase"));

			value.add((String) productListDetails.get("repeatpurchase"));

			value.add((String) productListDetails.get("whyrepeatpurchase"));

			value.add((String) productListDetails.get("willrecommend"));

			value.add((String) productListDetails.get("whyrecommend"));

			value.add((String) productListDetails.get("brandAds"));

			value.add((String) productListDetails.get("brandAware"));

			value.add((String) productListDetails.get("brandOutlet"));

			value.add((String) productListDetails.get("brandEnquired"));

			cipbMap.put(count, value);
		}

		return cipbMap;

	}

}
