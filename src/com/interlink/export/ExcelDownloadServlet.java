package com.interlink.export;

import java.io.IOException;
import java.io.OutputStream;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ExcelDownloadServlet extends HttpServlet {
	

	@Override
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		
		String stdVal = request.getParameter("stdVal");
        
        String HHCode = request.getParameter("HHCode");
   
        ExcelGenerator exG = new ExcelGenerator();

        byte [] outArray = exG.populateExcelData(stdVal, HHCode);
        
        
        
        response.setContentType("text/plain");
    	response.setHeader("Content-Disposition",
                         "attachment;filename="+stdVal+"_"+ HHCode+"_Details.xls");
    	/*ServletContext ctx = getServletContext();
    	InputStream is = ctx.getResourceAsStream("/resource/workbook.xls");
    	*/
    	
    	
    	OutputStream outStream = response.getOutputStream();
    	outStream.write(outArray);
    	outStream.flush();
     
    	outStream.close();

		

	}

}
