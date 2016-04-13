package com.interlink.vo;

import java.util.List;
import java.util.Map;

public class CIPVProfileVO {

	private String emailId;
	private String HHCode;
	
	private String HHIndividualCode;
	private String HHCodeOption;
	
	private String shopCode;
	
	private String month;
	
	
	private Map<String,Map<String,List<CIPVProductWiseVO>>> cIPVProductWiseVO;
	
	
	
	


	public String getMonth() {
		return month;
	}
	public void setMonth(String month) {
		this.month = month;
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
	public Map<String, Map<String, List<CIPVProductWiseVO>>> getcIPVProductWiseVO() {
		return cIPVProductWiseVO;
	}
	public void setcIPVProductWiseVO(
			Map<String, Map<String, List<CIPVProductWiseVO>>> cIPVProductWiseVO) {
		this.cIPVProductWiseVO = cIPVProductWiseVO;
	}

	
	
	
	
	
	
	

}
