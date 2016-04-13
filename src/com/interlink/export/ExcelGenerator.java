package com.interlink.export;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;

import com.interlink.config.ServerConfig;
import com.interlink.crud.FetchDataForExcel;
import com.interlink.crud.FetchFromDBManager;

public class ExcelGenerator {
	/*
	 * String dwlFilePath = ServerConfig.excelFilePath;
	 * 
	 * File dwlFile = new File(dwlFilePath);
	 */
	public ByteArrayOutputStream createExcelSheet(
			ByteArrayOutputStream outByteStream) {

		HSSFWorkbook workbook = new HSSFWorkbook();
		workbook.createSheet("Household Profile");
		workbook.createSheet("Individual Household Profile");
		workbook.createSheet("Shop Profile");
		workbook.createSheet("Household Monthly Purchase");
		workbook.createSheet("Customer Interview Product Visible");
		workbook.createSheet("Customer Interview Product Bought");

		try {
			// FileOutputStream out = new FileOutputStream(dwlFile);
			workbook.write(outByteStream);
			// out.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return outByteStream;
	}

	public ByteArrayOutputStream generateExcel(
			ByteArrayOutputStream outByteStream,
			Map<Integer, List<String>> excelData, int sheetNo) {

		try {

			// FileInputStream file = new FileInputStream(dwlFile);

			ByteArrayInputStream file = new ByteArrayInputStream(
					outByteStream.toByteArray());

			HSSFWorkbook wb = new HSSFWorkbook(file);
			Sheet sheet = wb.getSheetAt(sheetNo);

			Set<Integer> keyset = excelData.keySet();

			for (Integer key : keyset) {
				Row row = sheet.createRow(key);
				List<String> objArr = excelData.get(key);

				HSSFCellStyle cellStyle = wb.createCellStyle();
				if (key == 0) {

					HSSFFont font = wb.createFont();
					font.setColor(HSSFColor.BLACK.index);

					cellStyle = wb.createCellStyle();
					cellStyle.setFillForegroundColor(HSSFColor.SKY_BLUE.index);
					cellStyle.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
					cellStyle.setBorderTop((short) 1); // single line border
					cellStyle.setBorderBottom((short) 1); // single line border

					cellStyle.setFont(font);

				}

				int cellnum = 0;
				for (Object obj : objArr) {
					Cell cell = row.createCell(cellnum++);
					cell.setCellStyle(cellStyle);
					cell.setCellValue((String) obj);
				}

			}

			outByteStream = new ByteArrayOutputStream();

			byte[] buffer = new byte[1024];
			int bytesRead;
			while ((bytesRead = file.read(buffer)) != -1) {
				outByteStream.write(buffer, 0, bytesRead);
			}

			wb.write(outByteStream);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return outByteStream;

	}

	public byte[] populateExcelData(String userId, String HHCode) {

		FetchFromDBManager fDBMgr = new FetchFromDBManager();

		FetchDataForExcel dbExcelObj = new FetchDataForExcel();

		ByteArrayOutputStream outByteStream = new ByteArrayOutputStream();

		outByteStream = createExcelSheet(outByteStream);

		String emailId = fDBMgr.getEmailId(userId);
		
		String role = fDBMgr.getUserRole(emailId);

		// 1 - Household Profile
		Map<Integer, List<String>> houseHoldMap = dbExcelObj.getHHProfile(
				emailId, HHCode, role);

		outByteStream = generateExcel(outByteStream, houseHoldMap, 0);

		
		  // 2 - Individual Household Profile
		  
		  Map<Integer, List<String>> ihhProfileMap = dbExcelObj.getIHHPList(
		  emailId, HHCode, role);
		  
		  outByteStream = generateExcel(outByteStream,ihhProfileMap, 1);
		  
		  // 3 - Shop Profile
		  
		  Map<Integer, List<String>> spMap = dbExcelObj.getShopList(emailId,
		  HHCode, role);
		  
		  outByteStream = generateExcel(outByteStream,spMap, 2);
		  
		  // 4 - Household Monthly Purchase
		  
		  Map<Integer, List<String>> hmpMap = dbExcelObj.getHMPProfileList(
		  emailId, HHCode, role);
		  
		  outByteStream = generateExcel(outByteStream,hmpMap, 3);
		  
		  // 5 - Customer Interview Product Visible
		  
		  Map<Integer, List<String>> cipvMap = dbExcelObj.getCIPVMonth(emailId,
		  HHCode, role);
		  
		  outByteStream = generateExcel(outByteStream,cipvMap, 4);
		  
		  // 6 - Customer Interview Product Bought
		  
		  Map<Integer, List<String>> cipbMap = dbExcelObj.getCIPBMonth(emailId,
		  HHCode, role);
		  
		  outByteStream = generateExcel(outByteStream , cipbMap, 5);
		 

		  byte[] outArray = outByteStream.toByteArray();

		  return outArray;

	}

	
}