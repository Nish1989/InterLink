package com.interlink.vo;

import java.util.List;

public class StudentDashboardVO {

	private String individualName;
	private boolean shop;
	private List<String> ProductVisible;
	private List<String> ProductBought;
	private List<String> HHPurchase;
	
	
	public String getIndividualName() {
		return individualName;
	}
	public void setIndividualName(String individualName) {
		this.individualName = individualName;
	}
	public boolean isShop() {
		return shop;
	}
	public void setShop(boolean shop) {
		this.shop = shop;
	}
	public List<String> getProductVisible() {
		return ProductVisible;
	}
	public void setProductVisible(List<String> productVisible) {
		ProductVisible = productVisible;
	}
	public List<String> getProductBought() {
		return ProductBought;
	}
	public void setProductBought(List<String> productBought) {
		ProductBought = productBought;
	}
	public List<String> getHHPurchase() {
		return HHPurchase;
	}
	public void setHHPurchase(List<String> hHPurchase) {
		HHPurchase = hHPurchase;
	}
	
	
	
	

}
