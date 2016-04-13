package com.interlink.vo;

import java.util.List;
import java.util.Map;

public class HMPProfileVO {

	private String emailId;
	private String HHCode;

	private String shopInfo;

	private String shopCode;

	private String ocassion;
	
	private String month;

	private Map<String,Map<String,List<HMPProductWiseVO>>>  hMPProductWiseVO;

	
	
	
	public String getMonth() {
		return month;
	}

	public void setMonth(String month) {
		this.month = month;
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


	public String getShopInfo() {
		return shopInfo;
	}

	public void setShopInfo(String shopInfo) {
		this.shopInfo = shopInfo;
	}

	public String getShopCode() {
		return shopCode;
	}

	public void setShopCode(String shopCode) {
		this.shopCode = shopCode;
	}

	public String getOcassion() {
		return ocassion;
	}

	public void setOcassion(String ocassion) {
		this.ocassion = ocassion;
	}

	public Map<String, Map<String, List<HMPProductWiseVO>>> gethMPProductWiseVO() {
		return hMPProductWiseVO;
	}

	public void sethMPProductWiseVO(
			Map<String, Map<String, List<HMPProductWiseVO>>> hMPProductWiseVO) {
		this.hMPProductWiseVO = hMPProductWiseVO;
	}



	

}
