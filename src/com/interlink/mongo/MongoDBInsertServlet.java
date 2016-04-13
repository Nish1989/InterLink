package com.interlink.mongo;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

// Extend HttpServlet class
public class MongoDBInsertServlet extends HttpServlet {
 
  private String message;

  public void doGet(HttpServletRequest request,
                    HttpServletResponse response)
            throws ServletException, IOException
  {
      // Set response content type
      response.setContentType("text/html");
      
      
      MongoDataInserter mongoDataInserter = new MongoDataInserter(); 
      
      PrintWriter out = response.getWriter();
      
      String msg = " * * * * * MongoDB Insertion Successful * * * * * ";
      
      try {
		mongoDataInserter.dataInserter();
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
		
		msg = " * * * * * MongoDB Insertion Unsuccessful * * * * * " ;
		
	}

      out.println("<h1>" + msg + "</h1>");
      // Actual logic goes here.
    
  }
  
  public void destroy()
  {
      // do nothing.
  }
}
