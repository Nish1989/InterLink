package com.interlink.crud;

import javax.servlet.http.HttpServletRequest;

import com.interlink.vo.CIPBProductWiseVO;
import com.interlink.vo.CIPBProfileVO;
import com.interlink.vo.CIPVProductWiseVO;
import com.interlink.vo.CIPVProfileVO;
import com.interlink.vo.HMPProductWiseVO;
import com.interlink.vo.HMPProfileVO;
import com.interlink.vo.HouseholdProfileVo;
import com.interlink.vo.IHHProfileVO;
import com.interlink.vo.ShopProfileVO;

public class DataPopulaterForInsertion {

	public HouseholdProfileVo dataPopulateForHHProfileInfo(
			HttpServletRequest request) {

		HouseholdProfileVo householdProfileVo = new HouseholdProfileVo();

		String eMailId = request.getParameter("emailId");

		String HHCode = new InsertIntoDBManager().getHHCodeId(eMailId);

		String userId = new FetchFromDBManager().getUserId(eMailId);

		householdProfileVo.setHHCode(HHCode);

		householdProfileVo.setUserId(userId);

		householdProfileVo.setEmailId(eMailId);

		householdProfileVo.setArea(request.getParameter("area"));

		householdProfileVo.setGoogleLocation(request
				.getParameter("googleLocation"));

		String hhType = request.getParameter("hhType");

		if (hhType.equalsIgnoreCase("Other")) {
			hhType = request.getParameter("hhTypeOthers");
		}

		householdProfileVo.setHhType(hhType);

		String vehicleType = request.getParameter("vehicleType");

		if (vehicleType.equalsIgnoreCase("Other")) {
			vehicleType = request.getParameter("vehicleTypeOthers");
		}

		householdProfileVo.setVehicleType(vehicleType);

		householdProfileVo
				.setVehicleBrand(request.getParameter("vehicleBrand"));

		String cableConnection = request.getParameter("cableConnection");

		if (cableConnection.equalsIgnoreCase("Other")) {
			cableConnection = request.getParameter("cableConnectionOthers");
		}

		householdProfileVo.setCableConnection(cableConnection);

		String netConnection = request.getParameter("netConnection");

		if (netConnection.equalsIgnoreCase("Other")) {
			netConnection = request.getParameter("netConnectionOthers");
		}

		householdProfileVo.setNetConnection(netConnection);

		return householdProfileVo;

	}

	public IHHProfileVO dataPopulateForIHHProfile(HttpServletRequest request) {

		IHHProfileVO iHHProfileVO = new IHHProfileVO();

		String eMailId = request.getParameter("emailId");

		String HHCode = request.getParameter("HHCode");

		String HHIndividualCode = new InsertIntoDBManager()
				.getHHIndividualCode(eMailId, HHCode);

		iHHProfileVO.setEmailId(eMailId);

		iHHProfileVO.setHHCode(request.getParameter("HHCode"));

		iHHProfileVO.setHHIndividualCode(HHIndividualCode);

		iHHProfileVO.setIndividualName(request.getParameter("individualName"));

		iHHProfileVO.setAge(request.getParameter("age"));

		iHHProfileVO.setSex(request.getParameter("sex"));

		String relationship = request.getParameter("relationship");

		if (relationship.equalsIgnoreCase("Other")) {
			relationship = request.getParameter("relationshipOthers");
		}

		iHHProfileVO.setRelationship(relationship);

		String education = request.getParameter("education");

		if (education.equalsIgnoreCase("Other")) {
			education = request.getParameter("educationOthers");
		}

		iHHProfileVO.setEducation(education);

		String occupation = request.getParameter("occupation");

		if (occupation.equalsIgnoreCase("Other")) {
			occupation = request.getParameter("occupationOthers");
		}

		iHHProfileVO.setOccupation(occupation);

		iHHProfileVO.setWorkplace(request.getParameter("workplace"));

		String transport = request.getParameter("transport");

		if (transport.equalsIgnoreCase("Other")) {
			transport = request.getParameter("transportOthers");
		}

		iHHProfileVO.setTransport(transport);

		String mobileType = request.getParameter("mobileType");

		if (mobileType.equalsIgnoreCase("Other")) {
			mobileType = request.getParameter("mobileTypeOthers");
		}

		iHHProfileVO.setMobileType(mobileType);

		String mobileBrand = request.getParameter("mobileBrand");

		if (mobileBrand.equalsIgnoreCase("Other")) {
			mobileBrand = request.getParameter("mobileBrandOthers");
		}

		iHHProfileVO.setMobileBrand(mobileBrand);

		iHHProfileVO.setMobileBill(request.getParameter("mobileBill"));

		String netConnection = request.getParameter("netConnection");

		if (netConnection.equalsIgnoreCase("Other")) {
			netConnection = request.getParameter("netConnectionOthers");
		}

		iHHProfileVO.setNetConnection(netConnection);

/*		String socialMedia = request.getParameter("socialMedia");

		if (socialMedia.equalsIgnoreCase("Other")) {
			socialMedia = request.getParameter("socialMediaOthers");
		}*/

		String[] socialMedia = request.getParameterValues("socialMedia");

		String socialMediaVal = null;
		
		for (int i=0;i<socialMedia.length; i++) {
			
			if(socialMedia.length<1 || socialMediaVal == null)
			{ 
				socialMediaVal = socialMedia[i];	
			}else{
				
				socialMediaVal = socialMediaVal + "," + socialMedia[i];
			}
			
		  }
		
		iHHProfileVO.setSocialMedia(socialMediaVal);

		iHHProfileVO.setSitesfequentyvisited(request
				.getParameter("sitesfequentyvisited"));

		iHHProfileVO.setRecreationActivities(request
				.getParameter("recreationActivities"));

		iHHProfileVO.setHobbies(request.getParameter("hobbies"));

		String channels = request.getParameter("channels");

		channels = channels.replaceAll("_", " ");

		if (channels.equalsIgnoreCase("Other")) {
			channels = request.getParameter("channelsOthers");
		}

		iHHProfileVO.setChannels(channels);

		String newspapers = request.getParameter("newspapers");

		newspapers = newspapers.replaceAll("_", " ");

		if (newspapers.equalsIgnoreCase("Other")) {
			newspapers = request.getParameter("newspapersOthers");
		}

		iHHProfileVO.setNewspapers(newspapers);

		String magazines = request.getParameter("magazines");

		magazines = magazines.replaceAll("_", " ");

		if (magazines.equalsIgnoreCase("Other")) {
			magazines = request.getParameter("magazinesOthers");
		}

		iHHProfileVO.setMagazines(magazines);

		return iHHProfileVO;

	}

	public ShopProfileVO dataPopulateForShopProfile(HttpServletRequest request) {

		ShopProfileVO shopProfileVO = new ShopProfileVO();

		String eMailId = request.getParameter("emailId");

		String HHCode = request.getParameter("HHCode");

		String shopCode = new InsertIntoDBManager()
				.getShopCode(eMailId, HHCode);

		shopProfileVO.setEmailId(eMailId);

		shopProfileVO.setHHCode(HHCode);

		shopProfileVO.setShopCode(shopCode);

		shopProfileVO.setShopName(request.getParameter("shopName"));

		String outletType = request.getParameter("outletType");

		if (outletType.equalsIgnoreCase("Other")) {
			outletType = request.getParameter("outletTypeOthers");
		}

		shopProfileVO.setOutletType(outletType);

		shopProfileVO.setArea(request.getParameter("area"));

		shopProfileVO.setPincode(request.getParameter("pincode"));

		shopProfileVO.setDoordelivery(request.getParameter("doordelivery"));

		shopProfileVO.setPhoneorder(request.getParameter("phoneorder"));

		shopProfileVO.setSelfpickup(request.getParameter("selfpickup"));

		shopProfileVO.setMonthlycredit(request.getParameter("monthlycredit"));

		shopProfileVO.setShoppingbasket(request.getParameter("shoppingbasket"));

		shopProfileVO.setCreditcard(request.getParameter("creditcard"));

		shopProfileVO.setElectronicbilling(request
				.getParameter("electronicbilling"));

		shopProfileVO.setNoOfAssistant(request.getParameter("noOfAssistant"));

		shopProfileVO.setDistInMin(request.getParameter("distInMin"));

		shopProfileVO.setDistInKm(request.getParameter("distInKm"));

		shopProfileVO.setShopFrontFt(request.getParameter("shopFrontFt"));

		return shopProfileVO;

	}

	
	public HMPProfileVO dataPopulateForHMPProfile(HttpServletRequest request) {

		HMPProfileVO hMPProfileVO = new HMPProfileVO();

		String eMailId = request.getParameter("emailId");

		String HHCode = request.getParameter("HHCode");

		String month = request.getParameter("month");

		String shopinfo = request.getParameter("shopinfo");

		String ocassion = request.getParameter("ocassion");

		String[] shopTokens = shopinfo.split(" ");

		String shopcode = shopTokens[0];

		hMPProfileVO.setEmailId(eMailId);

		hMPProfileVO.setHHCode(HHCode);

		hMPProfileVO.setShopCode(shopcode);

		hMPProfileVO.setMonth(month);
		
		hMPProfileVO.setOcassion(ocassion);

		return hMPProfileVO;

	}

	public HMPProductWiseVO dataPopulateForHMPProductWise(
			HttpServletRequest request) {

		HMPProductWiseVO hMPProductWiseVO = new HMPProductWiseVO();


		String productCatg = request.getParameter("productCatg");
		
		hMPProductWiseVO.setProductCatg(productCatg);
		
		if(productCatg.equalsIgnoreCase("Other"))
		{
			hMPProductWiseVO.setSubProductCatg(request.getParameter("subProductCatgOthers"));
			
		}
		else{
	
		
			hMPProductWiseVO.setSubProductCatg(request.getParameter("subProductCatg"));
			
		}
		
		hMPProductWiseVO.setSkuitem(request.getParameter("skuitem"));

		hMPProductWiseVO.setMrp(request.getParameter("mrp"));
		
		hMPProductWiseVO.setQuantity(request.getParameter("quantity"));
		
		hMPProductWiseVO.setAmt(request.getParameter("amt"));
		
		return hMPProductWiseVO;

	}

	
	public CIPVProfileVO dataPopulateForCIPVProfile(HttpServletRequest request) {

		CIPVProfileVO cIPVProfileVO = new CIPVProfileVO();

		String eMailId = request.getParameter("emailId");

		String HHCode = request.getParameter("HHCode");

		String month = request.getParameter("month");

		String shopinfo = request.getParameter("shopinfo");

		String HHCodeOption = request.getParameter("HHCodeOption");

		String[] hhTokens = HHCodeOption.split(" ");

		String iHHDCode = hhTokens[0];

		String[] shopTokens = shopinfo.split(" ");

		String shopcode = shopTokens[0];

		cIPVProfileVO.setEmailId(eMailId);

		cIPVProfileVO.setHHCode(HHCode);

		cIPVProfileVO.setHHIndividualCode(iHHDCode);

		cIPVProfileVO.setHHCodeOption(HHCodeOption);

		cIPVProfileVO.setShopCode(shopcode);

		cIPVProfileVO.setMonth(month);

		return cIPVProfileVO;

	}

	public CIPVProductWiseVO dataPopulateForCIPVProductWise(
			HttpServletRequest request) {

		CIPVProductWiseVO cIPVProductWiseVO = new CIPVProductWiseVO();

		String productCatg = request.getParameter("productCatg");

		cIPVProductWiseVO.setProductCatg(productCatg);

		if (productCatg.equalsIgnoreCase("Other")) {

			cIPVProductWiseVO.setSubProductCatg(request
					.getParameter("subProductCatgOthers"));

		} else {

			cIPVProductWiseVO.setSubProductCatg(request
					.getParameter("subProductCatg"));

		}

		cIPVProductWiseVO.setSkuitem(request.getParameter("skuitem"));

		cIPVProductWiseVO.setMrp(request.getParameter("mrp"));

		cIPVProductWiseVO.setQuantity(request.getParameter("quantity"));

		cIPVProductWiseVO.setAmt(request.getParameter("amt"));

		String brandAds = request.getParameter("brandAds");

		if (brandAds.equalsIgnoreCase("Other")) {
			brandAds = request.getParameter("brandAdsOthers");
		}

		cIPVProductWiseVO.setBrandAds(brandAds);

		String brandAware = request.getParameter("brandAware");

		if (brandAware.equalsIgnoreCase("Other")) {
			brandAware = request.getParameter("brandAwareOthers");
		}

		cIPVProductWiseVO.setBrandAware(brandAware);

		String brandOutlet = request.getParameter("brandOutlet");

		if (brandOutlet.equalsIgnoreCase("Other")) {
			brandOutlet = request.getParameter("brandOutletOthers");
		}

		cIPVProductWiseVO.setBrandOutlet(brandOutlet);

		String brandEnquired = request.getParameter("brandEnquired");

		if (brandEnquired.equalsIgnoreCase("Other")) {
			brandEnquired = request.getParameter("brandEnquiredOthers");
		}

		cIPVProductWiseVO.setBrandEnquired(brandEnquired);

		String brandIntendToBuy = request.getParameter("brandIntendToBuy");

		if (brandIntendToBuy.equalsIgnoreCase("Other")) {
			brandIntendToBuy = request.getParameter("brandIntendToBuyOthers");
		}

		cIPVProductWiseVO.setBrandIntendToBuy(brandIntendToBuy);
		
		return cIPVProductWiseVO;

	}
	
	
	
	public CIPBProfileVO dataPopulateForCIPBProfile(
			HttpServletRequest request) {
			
		CIPBProfileVO cIPBProfileVO = new CIPBProfileVO();

		String eMailId = request.getParameter("emailId");

		String HHCode = request.getParameter("HHCode");

		String month = request.getParameter("month");

		String shopinfo = request.getParameter("shopinfo");

		String HHCodeOption = request.getParameter("HHCodeOption");

		String[] hhTokens = HHCodeOption.split(" ");

		String iHHDCode = hhTokens[0];

		String[] shopTokens = shopinfo.split(" ");

		String shopcode = shopTokens[0];
		
		cIPBProfileVO.setEmailId(eMailId);

		cIPBProfileVO.setHHCode(HHCode);
		
		cIPBProfileVO.setHHIndividualCode(iHHDCode);
		
		cIPBProfileVO.setHHCodeOption(HHCodeOption);
		
		cIPBProfileVO.setShopCode(shopcode);
		
		cIPBProfileVO.setMonth(month);
		
		cIPBProfileVO.setOcassion(request.getParameter("ocassion"));

		
		return cIPBProfileVO;
		
	}
	
	public CIPBProductWiseVO dataPopulateForCIPBProductWise(
			HttpServletRequest request) {
			
		CIPBProductWiseVO cIPBProductWiseVO = new CIPBProductWiseVO();
	
		String productCatg = request.getParameter("productCatg");
		
		cIPBProductWiseVO.setProductCatg(productCatg);

		if(productCatg.equalsIgnoreCase("Other"))
		{
			cIPBProductWiseVO.setSubProductCatg(request.getParameter("subProductCatgOthers"));
		
		}
		else{
	
			cIPBProductWiseVO.setSubProductCatg(request.getParameter("subProductCatg"));
				
		}
		

		cIPBProductWiseVO.setBrands(request.getParameter("brands"));
		
		cIPBProductWiseVO.setSubbrands(request.getParameter("subbrands"));
		
		cIPBProductWiseVO.setSkuitem(request.getParameter("skuitem"));
		
		cIPBProductWiseVO.setMrp(request.getParameter("mrp"));
		
		cIPBProductWiseVO.setQuantity(request.getParameter("quantity"));
		
		cIPBProductWiseVO.setAmt(request.getParameter("amt"));
		
		cIPBProductWiseVO.setMadeyoubuy(request.getParameter("madeyoubuy"));
		
		String happypurchase = request.getParameter("happypurchase");
		
		cIPBProductWiseVO.setHappypurchase(happypurchase);
	
		cIPBProductWiseVO.setWhyhappypurchase(request.getParameter("whyhappypurchase"));

		cIPBProductWiseVO.setRepeatpurchase(request.getParameter("repeatpurchase"));
		
		cIPBProductWiseVO.setWhyrepeatpurchase(request.getParameter("whyrepeatpurchase"));
		
		cIPBProductWiseVO.setWillrecommend(request.getParameter("willrecommend"));
		
		cIPBProductWiseVO.setWhyrecommend(request.getParameter("whyrecommend"));
		
		String brandAds = request.getParameter("brandAds");

		if(brandAds.equalsIgnoreCase("Other"))
		{
			brandAds = request.getParameter("brandAds2Others");
		}

		cIPBProductWiseVO.setBrandAds(brandAds);
		
		String brandAware = request.getParameter("brandAware");

		if(brandAware.equalsIgnoreCase("Other"))
		{
			brandAware = request.getParameter("brandAwareOthers");
		}

		
		cIPBProductWiseVO.setBrandAware(brandAware);

		
		String brandOutlet = request.getParameter("brandOutlet");

		if(brandOutlet.equalsIgnoreCase("Other"))
		{
			brandOutlet = request.getParameter("brandOutlet2Others");
		}
		

		cIPBProductWiseVO.setBrandOutlet(brandOutlet);
		
		
		String brandEnquired = request.getParameter("brandEnquired");

		if(brandEnquired.equalsIgnoreCase("Other"))
		{
			brandEnquired = request.getParameter("brandEnquired2Others");
		}
		
		cIPBProductWiseVO.setBrandEnquired(brandEnquired);
	
		
		return cIPBProductWiseVO;
		
	}

}
