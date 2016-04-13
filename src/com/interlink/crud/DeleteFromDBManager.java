package com.interlink.crud;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.interlink.config.ServerConfig;
import com.interlink.mongo.MongoDBConnector;
import com.interlink.vo.CIPVProductWiseVO;
import com.interlink.vo.CIPVProfileVO;
import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.DBObject;
import com.sun.xml.internal.bind.v2.schemagen.xmlschema.Occurs;

public class DeleteFromDBManager {

	public void deleteEntireProfile(String emailId) {

		deleteUserProfile(emailId);
		deleteHHProfileCollection(emailId);
		deleteIHHPCollection(emailId, null);
		deleteShopProfileCollection(emailId, null);
		deleteCIPVProductInfoCollection(emailId, null);
		deleteCIPBProductInfoCollection(emailId, null);
		deleteHMPProductInfoCollection(emailId, null);

	}

	public void deleteUserProfile(String emailId) {
		DB dbobj = MongoDBConnector.mongoDbConnector();

		DBCollection coll = dbobj
				.getCollection(ServerConfig.mongoDB_User_Collection);

		BasicDBObject query = new BasicDBObject();

		query.put("emailId", emailId);

		coll.remove(query);

	}

	public void deleteHHProfileCollection(String emailId) {
		DB dbobj = MongoDBConnector.mongoDbConnector();

		DBCollection coll = dbobj
				.getCollection(ServerConfig.mongoDB_HHProfile_Collection);

		BasicDBObject query = new BasicDBObject();

		query.put("emailId", emailId);

		coll.remove(query);

	}

	public void deleteIHHPCollection(String emailId, String HHIndividualCode) {
		DB dbobj = MongoDBConnector.mongoDbConnector();

		DBCollection coll = dbobj
				.getCollection(ServerConfig.mongoDB_IHHP_Collection);

		BasicDBObject query = new BasicDBObject();

		if (HHIndividualCode != null && HHIndividualCode.length() != 0)

		{
			query.put("HHIndividualCode", HHIndividualCode);

		}

		query.put("emailId", emailId);

		coll.remove(query);

	}

	public void deleteShopProfileCollection(String emailId, String shopCode) {
		DB dbobj = MongoDBConnector.mongoDbConnector();

		DBCollection coll = dbobj
				.getCollection(ServerConfig.mongoDB_ShopProfile_Collection);

		BasicDBObject query = new BasicDBObject();

		query.put("emailId", emailId);

		if (shopCode != null && shopCode.length() != 0)

		{
			query.put("shopCode", shopCode);

		}

		coll.remove(query);

	}

	public void deleteCIPVProductInfoCollection(String emailId,
			String HHIndividualCode) {
		DB dbobj = MongoDBConnector.mongoDbConnector();

		DBCollection coll = dbobj
				.getCollection(ServerConfig.mongoDB_CIPVProduct_Collection);

		BasicDBObject query = new BasicDBObject();

		if (HHIndividualCode != null && HHIndividualCode.length() != 0)

		{
			query.put("iHHDCode", HHIndividualCode);

		}

		query.put("emailId", emailId);

		coll.remove(query);

	}

	public void deleteCIPBProductInfoCollection(String emailId,
			String HHIndividualCode) {
		DB dbobj = MongoDBConnector.mongoDbConnector();

		DBCollection coll = dbobj
				.getCollection(ServerConfig.mongoDB_CIPBProduct_Collection);

		BasicDBObject query = new BasicDBObject();

		if (HHIndividualCode != null && HHIndividualCode.length() != 0)

		{
			query.put("iHHDCode", HHIndividualCode);

		}

		query.put("emailId", emailId);

		coll.remove(query);

	}

	public void deleteHMPProductInfoCollection(String emailId, String shopCode) {
		DB dbobj = MongoDBConnector.mongoDbConnector();

		DBCollection coll = dbobj
				.getCollection(ServerConfig.mongoDB_HMPProduct_Collection);

		BasicDBObject query = new BasicDBObject();

		query.put("emailId", emailId);

		if (shopCode != null && shopCode.length() != 0)

		{
			query.put("shopcode", shopCode);

		}

		coll.remove(query);

	}

	public void deleteHHPProfileEmailId(String emailId, String shopcode,
			String month, String ocassion) {

		DB dbobj = MongoDBConnector.mongoDbConnector();

		DBCollection coll = dbobj
				.getCollection(ServerConfig.mongoDB_HMPProduct_Collection);

		BasicDBObject query = new BasicDBObject();
		query.put("emailId", emailId);

		query.put("shopcode", shopcode);

		DBCursor result = coll.find(query);

		DBObject dbObj = null;

		while (result.hasNext()) {

			dbObj = result.next();

			Map<String, Object> monthWishDoc = (Map<String, Object>) dbObj
					.get("monthWishDoc");

			Map<String, Object> ocassionList = null;

			if (monthWishDoc.containsValue(month)) {

				ocassionList = (Map<String, Object>) monthWishDoc
						.get("ocassionList");

				if (ocassionList.containsValue(ocassion)) {

					query.put("monthWishDoc", monthWishDoc);
					coll.remove(query);

				}

			}

		}

	}

	public void deleteCIPVForEmailId(String emailId, String HHIndividualCode,
			String month, String shopcode) {

		DB dbobj = MongoDBConnector.mongoDbConnector();

		DBCollection coll = dbobj
				.getCollection(ServerConfig.mongoDB_CIPVProduct_Collection);

		BasicDBObject query = new BasicDBObject();
		query.put("emailId", emailId);

		query.put("iHHDCode", HHIndividualCode);

		DBCursor result = coll.find(query);

		DBObject dbObj = null;

		while (result.hasNext()) {

			dbObj = result.next();

			Map<String, Object> monthWishDoc = (Map<String, Object>) dbObj
					.get("monthWishDoc");

			Map<String, Object> shopListDetails = null;

			if (monthWishDoc.containsValue(month)) {

				shopListDetails = (Map<String, Object>) monthWishDoc
						.get("shopList");

				if (shopListDetails.containsValue(shopcode)) {

					query.put("monthWishDoc", monthWishDoc);
					coll.remove(query);

				}

			}

		}

	}

	public void deleteCIPBForEmailId(String emailId, String HHIndividualCode,
			String month, String ocassion, String shopcode) {

		DB dbobj = MongoDBConnector.mongoDbConnector();

		DBCollection coll = dbobj
				.getCollection(ServerConfig.mongoDB_CIPBProduct_Collection);

		BasicDBObject query = new BasicDBObject();
		query.put("emailId", emailId);

		query.put("iHHDCode", HHIndividualCode);

		DBCursor result = coll.find(query);

		DBObject dbObj = null;

		while (result.hasNext()) {

			dbObj = result.next();

			Map<String, Object> monthWishDoc = (Map<String, Object>) dbObj
					.get("monthWishDoc");

			Map<String, Object> shopListDetails = null;

			Map<String, Object> ocassionDetails = null;

			if (monthWishDoc.containsValue(month)) {

				shopListDetails = (Map<String, Object>) monthWishDoc
						.get("shopList");

				if (shopListDetails.containsValue(shopcode)) {

					ocassionDetails = (Map<String, Object>) shopListDetails
							.get("ocassionList");

					if (ocassionDetails.containsValue(ocassion)) {

						query.put("monthWishDoc", monthWishDoc);

						coll.remove(query);

					}

				}

			}

		}

	}

	public static void main(String[] args) {

		new DeleteFromDBManager().deleteHHPProfileEmailId("gan@cts.com",
				"HH0001-Groc1", "January", "Ocassion 1");
	}

}
