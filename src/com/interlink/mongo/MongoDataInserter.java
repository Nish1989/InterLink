package com.interlink.mongo;

import com.interlink.config.ServerConfig;
import com.interlink.crud.InsertIntoDBManager;
import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;

public class MongoDataInserter {

	public void dataInserter() {

		DB dbobj = MongoDBConnector.mongoDbConnector();

		DBCollection collection = dbobj
				.getCollection(ServerConfig.mongoDB_User_Collection);

		BasicDBObject document = new BasicDBObject();

		document.put("userId", "Admin");

		document.put("password", "password-1");

		document.put("emailId", "admin@interlink.com");

		document.put("role", "Admin");

		document.put("name", "Admin");

		document.put("collegeName", "-");

		document.put("collegeAddr", "Whitefield");

		document.put("city", "Bangalore");

		document.put("createdDate", new InsertIntoDBManager().getCreatedDate());

		collection.insert(document);

	}


}
