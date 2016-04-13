package com.interlink.importExcel;

import java.io.InputStream;
import java.util.Iterator;

import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Row;

import com.interlink.crud.InsertIntoDBManager;
import com.interlink.vo.CIPBProductWiseVO;
import com.interlink.vo.CIPBProfileVO;
import com.interlink.vo.CIPVProductWiseVO;
import com.interlink.vo.CIPVProfileVO;
import com.interlink.vo.HMPProductWiseVO;
import com.interlink.vo.HMPProfileVO;
import com.interlink.vo.HouseholdProfileVo;
import com.interlink.vo.IHHProfileVO;
import com.interlink.vo.ShopProfileVO;

public class ExcelImportManager {

	public void readDataFromExcel(String emailId,InputStream filecontent) {

		try {

			
			// Get the workbook instance for XLS file
			HSSFWorkbook workbook = new HSSFWorkbook(filecontent);

			readHHProfileFromExcel(emailId,workbook);

			readIHHProfileFromExcel(emailId,workbook);

			readShopProfileFromExcel(emailId,workbook);

			readHMPProfileFromExcel(emailId,workbook);

			readCIPVProfileFromExcel(emailId,workbook);

			readCIPBProfileFromExcel(emailId,workbook);

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	public void readHHProfileFromExcel(String emailId,HSSFWorkbook workbook) {

		try {

			// Get first sheet from the workbook
			HSSFSheet sheet = workbook.getSheetAt(0);

			// Iterate through each rows from first sheet
			Iterator<Row> rowIterator = sheet.iterator();

			while (rowIterator.hasNext()) {

				Row row = rowIterator.next();
				if (row.getRowNum() == 0) {
					continue; // Skip Header Row
				}

				HouseholdProfileVo hhProfileVo = new HouseholdProfileVo();

				hhProfileVo.setEmailId(emailId);

				hhProfileVo.setHHCode(row.getCell(0).getStringCellValue());

				hhProfileVo.setArea(row.getCell(1).getStringCellValue());

				hhProfileVo.setGoogleLocation(row.getCell(2)
						.getStringCellValue());

				hhProfileVo.setHhType(row.getCell(3).getStringCellValue());

				hhProfileVo.setVehicleType(row.getCell(4).getStringCellValue());

				hhProfileVo
						.setVehicleBrand(row.getCell(5).getStringCellValue());

				hhProfileVo.setCableConnection(row.getCell(6)
						.getStringCellValue());

				hhProfileVo.setNetConnection(row.getCell(7)
						.getStringCellValue());

				new InsertIntoDBManager().insertHHProfileInfo(hhProfileVo);

			}

		} catch (Exception e) {

			e.printStackTrace();
		}
	}

	public void readIHHProfileFromExcel(String emailId,HSSFWorkbook workbook) {

		try {

			// Get first sheet from the workbook
			HSSFSheet sheet = workbook.getSheetAt(1);

			// Iterate through each rows from first sheet
			Iterator<Row> rowIterator = sheet.iterator();

			while (rowIterator.hasNext()) {

				Row row = rowIterator.next();
				if (row.getRowNum() == 0) {
					continue; // Skip Header Row
				}

				IHHProfileVO iHHProfileVO = new IHHProfileVO();

				iHHProfileVO.setEmailId(emailId);

				iHHProfileVO.setHHCode(row.getCell(0).getStringCellValue());

				iHHProfileVO.setHHIndividualCode(row.getCell(1)
						.getStringCellValue());

				iHHProfileVO.setIndividualName(row.getCell(2)
						.getStringCellValue());

				iHHProfileVO.setAge(row.getCell(3).getStringCellValue());

				iHHProfileVO.setSex(row.getCell(4).getStringCellValue());

				iHHProfileVO.setRelationship(row.getCell(5)
						.getStringCellValue());

				iHHProfileVO.setEducation(row.getCell(6).getStringCellValue());

				iHHProfileVO.setOccupation(row.getCell(7).getStringCellValue());

				iHHProfileVO.setWorkplace(row.getCell(8).getStringCellValue());

				iHHProfileVO.setTransport(row.getCell(9).getStringCellValue());

				iHHProfileVO
						.setMobileType(row.getCell(10).getStringCellValue());

				iHHProfileVO.setMobileBrand(row.getCell(11)
						.getStringCellValue());

				iHHProfileVO
						.setMobileBill(row.getCell(12).getStringCellValue());

				iHHProfileVO.setNetConnection(row.getCell(13)
						.getStringCellValue());

				iHHProfileVO.setSocialMedia(row.getCell(14)
						.getStringCellValue());

				iHHProfileVO.setSitesfequentyvisited(row.getCell(15)
						.getStringCellValue());

				iHHProfileVO.setRecreationActivities(row.getCell(16)
						.getStringCellValue());

				iHHProfileVO.setHobbies(row.getCell(17).getStringCellValue());

				iHHProfileVO.setChannels(row.getCell(18).getStringCellValue());

				iHHProfileVO
						.setNewspapers(row.getCell(19).getStringCellValue());

				iHHProfileVO.setMagazines(row.getCell(20).getStringCellValue());

				new InsertIntoDBManager().insertIHHPInfo(iHHProfileVO);

			}

		} catch (Exception e) {

			e.printStackTrace();
		}
	}

	public void readShopProfileFromExcel(String emailId,HSSFWorkbook workbook) {

		try {

			// Get first sheet from the workbook
			HSSFSheet sheet = workbook.getSheetAt(2);

			// Iterate through each rows from first sheet
			Iterator<Row> rowIterator = sheet.iterator();

			while (rowIterator.hasNext()) {

				Row row = rowIterator.next();
				if (row.getRowNum() == 0) {
					continue; // Skip Header Row
				}

				ShopProfileVO shopProfileVO = new ShopProfileVO();

				shopProfileVO.setEmailId(emailId);

				shopProfileVO.setHHCode(row.getCell(0).getStringCellValue());

				shopProfileVO.setShopCode(row.getCell(1).getStringCellValue());

				shopProfileVO.setShopName(row.getCell(2).getStringCellValue());

				shopProfileVO
						.setOutletType(row.getCell(3).getStringCellValue());

				shopProfileVO.setArea(row.getCell(4).getStringCellValue());

				shopProfileVO.setPincode(row.getCell(5).getStringCellValue());

				shopProfileVO.setDoordelivery(row.getCell(6)
						.getStringCellValue());

				shopProfileVO
						.setPhoneorder(row.getCell(7).getStringCellValue());

				shopProfileVO
						.setSelfpickup(row.getCell(8).getStringCellValue());

				shopProfileVO.setMonthlycredit(row.getCell(9)
						.getStringCellValue());

				shopProfileVO.setShoppingbasket(row.getCell(10)
						.getStringCellValue());

				shopProfileVO.setCreditcard(row.getCell(11)
						.getStringCellValue());

				shopProfileVO.setElectronicbilling(row.getCell(12)
						.getStringCellValue());

				shopProfileVO.setNoOfAssistant(row.getCell(13)
						.getStringCellValue());

				shopProfileVO
						.setDistInMin(row.getCell(14).getStringCellValue());

				shopProfileVO.setDistInKm(row.getCell(15).getStringCellValue());

				shopProfileVO.setShopFrontFt(row.getCell(16)
						.getStringCellValue());

				new InsertIntoDBManager().insertShopProfileInfo(shopProfileVO);

			}

		} catch (Exception e) {

			e.printStackTrace();
		}
	}

	public void readHMPProfileFromExcel(String emailId,HSSFWorkbook workbook) {

		try {

			// Get first sheet from the workbook
			HSSFSheet sheet = workbook.getSheetAt(3);

			// Iterate through each rows from first sheet
			Iterator<Row> rowIterator = sheet.iterator();

			while (rowIterator.hasNext()) {

				Row row = rowIterator.next();
				if (row.getRowNum() == 0) {
					continue; // Skip Header Row
				}

				HMPProfileVO hMPProfileVO = new HMPProfileVO();

				HMPProductWiseVO hMPProductWiseVO = new HMPProductWiseVO();

				hMPProfileVO.setEmailId(emailId);

				hMPProfileVO.setHHCode(row.getCell(0).getStringCellValue());

				hMPProfileVO.setShopCode(row.getCell(1).getStringCellValue());

				// 2 - shopname , 3- area

				hMPProfileVO.setMonth(row.getCell(4).getStringCellValue());

				hMPProfileVO.setOcassion(row.getCell(5).getStringCellValue());

				hMPProductWiseVO.setProductCatg(row.getCell(6)
						.getStringCellValue());

				hMPProductWiseVO.setSubProductCatg(row.getCell(7)
						.getStringCellValue());

				hMPProductWiseVO
						.setSkuitem(row.getCell(8).getStringCellValue());

				hMPProductWiseVO.setMrp(row.getCell(9).getStringCellValue());

				hMPProductWiseVO.setQuantity(row.getCell(10)
						.getStringCellValue());

				hMPProductWiseVO.setAmt(row.getCell(11).getStringCellValue());

				new InsertIntoDBManager().insertHMPProfileInfo(hMPProfileVO,
						hMPProductWiseVO);
			}

		} catch (Exception e) {

			e.printStackTrace();
		}
	}

	public void readCIPVProfileFromExcel(String emailId,HSSFWorkbook workbook) {

		try {

			// Get first sheet from the workbook
			HSSFSheet sheet = workbook.getSheetAt(4);

			// Iterate through each rows from first sheet
			Iterator<Row> rowIterator = sheet.iterator();

			while (rowIterator.hasNext()) {

				Row row = rowIterator.next();
				if (row.getRowNum() == 0) {
					continue; // Skip Header Row
				}

				CIPVProfileVO cIPVProfileVO = new CIPVProfileVO();

				CIPVProductWiseVO cIPVProductWiseVO = new CIPVProductWiseVO();

				cIPVProfileVO.setEmailId(emailId);

				cIPVProfileVO.setHHCode(row.getCell(0).getStringCellValue());

				cIPVProfileVO.setHHIndividualCode(row.getCell(1)
						.getStringCellValue());

				cIPVProfileVO.setMonth(row.getCell(2).getStringCellValue());

				cIPVProfileVO.setShopCode(row.getCell(3).getStringCellValue());

				// 4- shop name , 5-Area

				cIPVProductWiseVO.setProductCatg(row.getCell(6)
						.getStringCellValue());

				cIPVProductWiseVO.setSubProductCatg(row.getCell(7)
						.getStringCellValue());

				cIPVProductWiseVO.setSkuitem(row.getCell(8)
						.getStringCellValue());

				cIPVProductWiseVO.setMrp(row.getCell(9).getStringCellValue());

				cIPVProductWiseVO.setQuantity(row.getCell(10)
						.getStringCellValue());

				cIPVProductWiseVO.setAmt(row.getCell(11).getStringCellValue());

				cIPVProductWiseVO.setBrandAds(row.getCell(12)
						.getStringCellValue());

				cIPVProductWiseVO.setBrandAware(row.getCell(13)
						.getStringCellValue());

				cIPVProductWiseVO.setBrandOutlet(row.getCell(14)
						.getStringCellValue());

				cIPVProductWiseVO.setBrandEnquired(row.getCell(15)
						.getStringCellValue());

				cIPVProductWiseVO.setBrandIntendToBuy(row.getCell(16)
						.getStringCellValue());

				new InsertIntoDBManager().insertCIPVProfileInfo(cIPVProfileVO,
						cIPVProductWiseVO);
			}

		} catch (Exception e) {

			e.printStackTrace();
		}
	}

	public void readCIPBProfileFromExcel(String emailId,HSSFWorkbook workbook) {

		try {

			// Get first sheet from the workbook
			HSSFSheet sheet = workbook.getSheetAt(5);

			// Iterate through each rows from first sheet
			Iterator<Row> rowIterator = sheet.iterator();

			while (rowIterator.hasNext()) {

				Row row = rowIterator.next();
				if (row.getRowNum() == 0) {
					continue; // Skip Header Row
				}

				CIPBProfileVO cIPBProfileVO = new CIPBProfileVO();

				CIPBProductWiseVO cIPBProductWiseVO = new CIPBProductWiseVO();

				cIPBProfileVO.setEmailId(emailId);

				cIPBProfileVO.setHHCode(row.getCell(0).getStringCellValue());

				cIPBProfileVO.setHHIndividualCode(row.getCell(1)
						.getStringCellValue());

				cIPBProfileVO.setMonth(row.getCell(2).getStringCellValue());

				cIPBProfileVO.setOcassion(row.getCell(3).getStringCellValue());

				cIPBProfileVO.setShopCode(row.getCell(4).getStringCellValue());

				// 5- shop name , 6-Area

				cIPBProductWiseVO.setProductCatg(row.getCell(7)
						.getStringCellValue());

				cIPBProductWiseVO.setSubProductCatg(row.getCell(8)
						.getStringCellValue());

				cIPBProductWiseVO.setBrands(row.getCell(9)
						.getStringCellValue());

				cIPBProductWiseVO.setSubbrands(row.getCell(10)
						.getStringCellValue());

				cIPBProductWiseVO.setSkuitem(row.getCell(11)
						.getStringCellValue());

				cIPBProductWiseVO.setMrp(row.getCell(12).getStringCellValue());

				cIPBProductWiseVO.setQuantity(row.getCell(13)
						.getStringCellValue());

				cIPBProductWiseVO.setAmt(row.getCell(14).getStringCellValue());

				cIPBProductWiseVO.setMadeyoubuy(row.getCell(15)
						.getStringCellValue());

				cIPBProductWiseVO.setHappypurchase(row.getCell(16)
						.getStringCellValue());

				cIPBProductWiseVO.setWhyhappypurchase(row.getCell(17)
						.getStringCellValue());

				cIPBProductWiseVO.setRepeatpurchase(row.getCell(18)
						.getStringCellValue());

				cIPBProductWiseVO.setWhyrepeatpurchase(row.getCell(19)
						.getStringCellValue());

				cIPBProductWiseVO.setWillrecommend(row.getCell(20)
						.getStringCellValue());

				cIPBProductWiseVO.setWhyrecommend(row.getCell(21)
						.getStringCellValue());

				cIPBProductWiseVO.setBrandAware(row.getCell(22)
						.getStringCellValue());

				cIPBProductWiseVO.setBrandAds(row.getCell(23)
						.getStringCellValue());

				cIPBProductWiseVO.setBrandOutlet(row.getCell(24)
						.getStringCellValue());

				cIPBProductWiseVO.setBrandEnquired(row.getCell(25)
						.getStringCellValue());

				new InsertIntoDBManager().insertCIPBProfileInfo(cIPBProfileVO,
						cIPBProductWiseVO);
			}

		} catch (Exception e) {

			e.printStackTrace();
		}
	}

	
}