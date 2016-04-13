package com.interlink.vo;

import java.util.List;
import java.util.Map;

public class CIPBProfileVO {

	private String emailId;
	private String HHCode;
	
	private String HHIndividualCode;
	private String HHCodeOption;
	
	private String shopCode;
	
	private String month;
	
	private String ocassion;
	
	
	private Map<String,Map<String,Map<String,List<CIPBProductWiseVO>>>> cIPBProductWiseVO;
	
	
	
	
	
	


	public String getMonth() {
		return month;
	}
	public void setMonth(String month) {
		this.month = month;
	}
	public String getOcassion() {
		return ocassion;
	}
	public void setOcassion(String ocassion) {
		this.ocassion = ocassion;
	}
	public String getHHCodeOption() {
		return HHCodeOption;
	}
	public void setHHCodeOption(String hHCodeOption) {
		HHCodeOption = hHCodeOption;
	}
	public String getHHIndividualCode() {
		return HHIndividualCode;
	}
	public void setHHIndividualCode(String hHIndividualCode) {
		HHIndividualCode = hHIndividualCode;
	}

	public String getShopCode() {
		return shopCode;
	}
	public void setShopCode(String shopCode) {
		this.shopCode = shopCode;
	}

	public String getEmailId() {
		return emailId;
	}
	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}
	public String getHHCode() {
		return HHCode;
	}
	public void setHHCode(String hHCode) {
		HHCode = hHCode;
	}
	public Map<String, Map<String, Map<String, List<CIPBProductWiseVO>>>> getcIPBProductWiseVO() {
		return cIPBProductWiseVO;
	}
	public void setcIPBProductWiseVO(
			Map<String, Map<String, Map<String, List<CIPBProductWiseVO>>>> cIPBProductWiseVO) {
		this.cIPBProductWiseVO = cIPBProductWiseVO;
	}


	
	
	

}
