<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta content="IE=edge" http-equiv="X-UA-Compatible">

<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">

<title>Form_template</title>

<link href="css/style.css" rel="stylesheet" />
<link href="css/bootstrap.min.css" rel="stylesheet" />
<link href="css/bootstrap-theme.css" rel="stylesheet" />
<link href="css/bootstrap-theme-min.css" rel="stylesheet" />
<link href="css/theme.css" rel="stylesheet" />

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*"%>
<%@page
	import="java.util.ArrayList,java.util.List,java.util.Map,java.util.Iterator"%>
<%@page
	import="com.interlink.vo.UserInfoVo,com.interlink.vo.HouseholdProfileVo,com.interlink.vo.HMPProfileVO,com.interlink.vo.HMPProductWiseVO,com.interlink.vo.CIPBProfileVO,com.interlink.vo.CIPVProfileVO,com.interlink.vo.CIPVProductWiseVO,com.interlink.vo.CIPBProductWiseVO,com.interlink.vo.IHHProfileVO,com.interlink.vo.ShopProfileVO"%>

<script src="js/jquery-1.9.0.min.js"></script>

<style type="text/css">

#subProdDes1,#subProdDes2,#subProdDes3{

margin-top:3%;

}

</style>

<script>
	
	$(document).ready(function() {
	$('#myTab a').click(function (e) {
 		 e.preventDefault()
 		 $(this).tab('show')
		})

	});
</script>
<script>
  $(function () {
    $('#myTab a:last').tab('show')
  })
</script>

<script>


$(document).ready(function() { 
	

	var channelsVal = {"1":"4 REAL NEWS","2":"A TO Z NEWS","3":"AAJ TAK","4":"AAWAZ","5":"ABP NEWS","6":"AZAD NEWS","7":"CHANNEL NO.1","8":"CNBC TV18","9":"CNN-IBN ","10":"DAY & NIGHT","11":"DD NATIONAL","12":"DD NEWS","13":"DELHI AAJ TAK","14":"ET NOW","15":"ETV UP","16":"HEADLINES TODAY","17":"IBN7","18":"INDIA NEWS","19":"NDTV 24X7","20":"NDTV GOOD TIMES","21":"NDTV INDIA","22":"NDTV PROFIT","23":"NEWS 24","24":"NEWS EXPRESS","25":"NEWS X","26":"P7 NEWS","27":"PTC NEWS","28":"SAHARA NCR","29":"SAHARA SAMAY NATIONAL","30":"SAHARA UP","31":"TEZ TV","32":"TIMES NOW","33":"UTVI NEWS","34":"ZEE BUSINESS","35":"ZEE NEWS","36":"ZEE PUNJABI","37":"Other"};

	
	var $channelsSelect = $('#channels'); 
	$channelsSelect.find('option').remove();
	$channelsSelect.append("<option value=''>...select</option>");
	$.each(channelsVal,function(key, value) 
	{
	    $channelsSelect.append("<option value="+value.replace(/\s/g, '_')+">" + value + "</option>");
	});

	
	
	
	var NewspaperVal = {"1":"THE ECONOMIC TIMES","2":"THE FINANCIAL EXPRESS","3":"BUSINESS STANDARD","4":"THE HINDU BUSINESS LINE","5":"FINANCIAL CHRONICLE","6":"MINT","7":"THE TIMES OF INDIA","8":"HINDUSTAN TIMES","9":"THE ASIAN AGE","10":"THE INDIAN EXPRESS","11":"THE HINDU","12":"DECCAN HERALD","13":"MILLENNIUM POST","14":"THE POLITICAL & BUSINESS DAILY","15":"MAIL TODAY","16":"THE PIONEER ","17":"THE TRIBUNE","18":"THE STATESMAN","19":"DAILY POST ","20":"HT EDGE","21":"THE ECONOMIC TIMES WEALTH","22":"THE SUNDAY GUARDIAN","23":"THE SUNDAY STANDARD","24":"THE SPEAKING TREE","25":"ECONOMIC TIMES","26":"BUSINESS STANDARD","27":"BUSINESS BHASKAR","28":"NAVBHARAT TIMES","29":"HINDUSTAN ","30":"DAINIK JAGRAN","31":"DAINIK JAGRAN NATIONAL EDITION","32":"PIONEER","33":"DAINIK BHASKAR","34":"AMAR UJALA","35":"RASHTRIYA SAHARA ","36":"PUNJAB KESARI","37":"JANSATTA ","38":"VIR ARJUN","39":"VIRAAT VAIBHAV","40":"SHAH TIMES","41":"HARI BHOOMI ","42":"DAINIK TRIBUNE ","43":"NATIONAL DUNIA","44":"NAIDUNIA NATIONAL EDITION","45":"AAJ SAMAJ","46":"LOKSATYA","47":"RAJASTHAN PATRIKA ","48":"NAVODAYA TIMES","49":"NAYA INDIA","50":"DAINIK AWAM-E-HIND","51":"FOCUS NEWS","52":"SANDHYA TIMES ","53":"THE TIMES OF INDIA","54":"HINDUSTAN TIMES","55":"THE INDIAN EXPRESS","56":"THE TRIBUNE","57":"FRIDAY GURGAON","58":"NAVBHARAT TIMES","59":"HINDUSTAN","60":"DAINIK JAGRAN","61":"DAINIK BHASKAR","62":"AMAR UJALA","63":"RASHTRIYA SAHARA ","64":"PUNJAB KESARI","65":"DAINIK TRIBUNE ","66":"NATIONAL DUNIA","67":"AAJ SAMAJ","68":"THE TIMES OF INDIA","69":"HINDUSTAN TIMES","70":"THE TRIBUNE","71":"NAVBHARAT TIMES","72":"HINDUSTAN ","73":"DAINIK JAGRAN","74":"DAINIK BHASKAR","75":"AMAR UJALA","76":"RASHTRIYA SAHARA ","77":"PUNJAB KESARI","78":"NATIONAL DUNIA","79":"AAJ SAMAJ","80":"THE TIMES OF INDIA","81":"HINDUSTAN TIMES","82":"THE INDIAN EXPRESS","83":"NAVBHARAT TIMES","84":"HINDUSTAN ","85":"DAINIK JAGRAN","86":"DAINIK BHASKAR","87":"AMAR UJALA","88":"RASHTRIYA SAHARA ","89":"PUNJAB KESARI","90":"NATIONAL DUNIA","91":"THE TIMES OF INDIA","92":"HINDUSTAN TIMES","93":"THE INDIAN EXPRESS","94":"NAVBHARAT TIMES","95":"HINDUSTAN","96":"DAINIK JAGRAN","97":"AMAR UJALA","98":"RASHTRIYA SAHARA","99":"PUNJAB KESARI","100":"NATIONAL DUNIA","101":"DAINIK JAGRAN","102":"THE ECONOMIC TIMES","103":"THE FINANCIAL EXPRESS","104":"BUSINESS STANDARD","105":"THE TIMES OF INDIA","106":"HINDUSTAN TIMES","107":"THE INDIAN EXPRESS","108":"THE PIONEER","109":"BUSINESS STANDARD","110":"NAVBHARAT TIMES","111":"HINDUSTAN","112":"DAINIK JAGRAN","113":"PIONEER","114":"AMAR UJALA","115":"RASHTRIYA SAHARA","116":"JANSATTA","117":"AAJ","118":"UNITED BHARAT","119":"VOICE OF LUCKNOW","120":"DAILY NEWS ACTIVIST","121":"RASHTRIYA SWAROOP","122":"SWATANTRA CHETNA","123":"SWATANTRA BHARAT","124":"RAHAT TIMES","125":"I NEXT","126":"JANSANDESH TIMES","127":"UNITED BHARAT","128":"AAJ","129":"THE ECONOMIC TIMES","130":"THE TIMES OF INDIA","131":"HINDUSTAN TIMES","132":"THE TELEGRAPH","133":"BUSINESS STANDARD","134":"HINDUSTAN","135":"DAINIK JAGRAN","136":"DAINIK BHASKAR","137":"RASHTRIYA SAHARA","138":"AAJ","139":"PRABHAT KHABAR","140":"SANMARG","141":"PRATYUSH NAV BIHAR","142":"I NEXT","143":"PUNJAB KESARI","144":"THE ECONOMIC TIMES","145":"THE FINANCIAL EXPRESS","146":"BUSINESS STANDARD","147":"THE TIMES OF INDIA","148":"HINDUSTAN TIMES","149":"THE INDIAN EXPRESS","150":"THE PIONEER","151":"THE TRIBUNE ","152":"DAILY POST","153":"DAINIK JAGRAN","154":"DAINIK BHASKAR","155":"AMAR UJALA ","156":"PUNJAB KESARI","157":"JANSATTA","158":"DAINIK TRIBUNE ","159":"AAJ SAMAJ ","160":"DIVYA HIMACHAL ","161":"PUNJABI TRIBUNE","162":"DAILY EXCELSIOR","163":" KASHMIR TIMES","164":"HINDUSTAN TIMES","165":"THE PIONEER","166":"THE TRIBUNE","167":"THE HIMACHAL TIMES","168":"GARHWAL POST","169":"HINDUSTAN","170":"DAINIK JAGRAN","171":"AMAR UJALA","172":"RASHTRIYA SAHARA","173":"PUNJAB KESARI","174":"SHAH TIMES","175":"DAINIK TRIBUNE ","176":"I NEXT ","177":"DAINIK JANBHARAT MAIL ","178":"THE ECONOMIC TIMES","179":"THE TIMES OF INDIA","180":"HINDUSTAN TIMES","181":"DAILY NEWS & ANALYSIS","182":"BUSINESS BHASKAR","183":"DAINIK BHASKAR","184":"PUNJAB KESARI","185":"RAJASTHAN PATRIKA","186":"MAHAKA BHARAT","187":"DAINIK NAVAJYOTI","188":"RASHTRADOOT","189":"DAILY NEWS ","190":"NAFA NUKSAN","191":"SAMACHAR JAGAT","192":"PRATAHKAL","193":"MORNING NEWS","194":"DAINIK LOKDASHA","195":"THE TIMES OF INDIA","196":"HINDUSTAN TIMES","197":"THE PIONEER","198":"CENTRAL CHRONICLE","199":"FREE PRESS","200":"THE HITAVADA","201":"BUSINESS STANDARD","202":"BUSINESS BHASKAR","203":"DAINIK JAGRAN","204":"DAINIK BHASKAR","205":"PATRIKA","206":"DAINIK NAIDUNIA","207":"RAJ EXPRESS","208":"NAV BHARAT","209":"NAV DUNIA","210":"PEOPLES SAMACHAR","211":"THE ECONOMIC TIMES ","212":"THE FINANCIAL EXPRESS","213":"BUSINESS STANDARD","214":"THE HINDU BUSINESS LINE","215":"THE TIMES OF INDIA","216":"HINDUSTAN TIMES","217":"THE ASIAN AGE","218":"THE INDIAN EXPRESS","219":"THE STATESMAN","220":"THE TELEGRAPH","221":"THE ECHO OF INDIA","222":"BUSINESS STANDARD","223":"DAINIK JAGRAN","224":"RAJASTHAN PATRIKA","225":"JANSATTA ","226":"PRABHAT KHABAR","227":"SANMARG","228":"DAINIK VISHWAMITRA","229":"ANANDA BAZAR PATRIKA","230":"BARTAMAN PATRIKA","231":"SANGBAD PRATIDIN","232":"THE ASSAM TRIBUNE","233":"THE SENTINEL","234":"THE SHILLONG TIMES","235":"THE ECONOMIC TIMES","236":"THE FINANCIAL EXPRESS","237":"BUSINESS STANDARD ","238":"THE HINDU BUSINESS LINE","239":"FINANCIAL CHRONICLE","240":"MINT","241":"THE TIMES OF INDIA","242":"HINDUSTAN TIMES","243":"THE ASIAN AGE","244":"THE INDIAN EXPRESS","245":"DAILY NEWS & ANALYSIS","246":"THE FREE PRESS JOURNAL","247":"MUMBAI MIRROR","248":"MID-DAY ","249":"AFTERNOON","250":"ABSOLUTE INDIA","251":"SCREEN","252":"THE ECONOMIC TIMES WEALTH","253":"THE SUNDAY GUARDIAN","254":"BUSINESS STANDARD ","255":"NAVBHARAT TIMES","256":"NAVBHARAT","257":"HAMARA MAHANAGAR","258":"PRATAHKAL","259":"JAGRUK TIMES","260":"AAJ KA ANAND","261":"DAINIK YASHOBHUMI","262":"ABSOLUTE INDIA","263":"DAKSHIN MUMBAI","264":"SAKAL","265":"LOKSATTA","266":"MAHARASHTRA TIMES","267":"SAAMANA","268":"LOKMAT","269":"PUDHARI ","270":"PUNYA NAGRI","271":"PRAHAAR","272":"MID-DAY ","273":"GUJARAT SAMACHAR","274":"MUMBAI SAMACHAR ","275":"DIVYA BHASKAR","276":"THE ECONOMIC TIMES","277":"THE FINANCIAL EXPRESS","278":"BUSINESS STANDARD","279":"THE TIMES OF INDIA","280":"THE INDIAN EXPRESS","281":"DAILY NEWS & ANALYSIS","282":"SAKAL TIMES","283":"PUNE MIRROR","284":"MID-DAY ","285":"LIFE 365","286":"AAJ KA ANAND","287":"LOKMAT SAMACHAR","288":"KESARI","289":"SAKAL","290":"LOKSATTA","291":"MAHARASHTRA TIMES","292":"SAAMANA","293":"LOKMAT","294":"PUDHARI","295":"PUNYA NAGRI","296":"PRABHAAT","297":"KESARI","298":"THE ECONOMIC TIMES","299":"THE FINANCIAL EXPRESS","300":"BUSINESS STANDARD","301":"MINT","302":"THE TIMES OF INDIA","303":"THE INDIAN EXPRESS","304":"DAILY NEWS & ANALYSIS","305":"AHMEDABAD MIRROR","306":"YOUNG LEADER","307":"METRO HERALD","308":"RAJASTHAN PATRIKA","309":"GUJARAT VAIBHAV","310":"ECONOMIC  TIMES ","311":"FINANCIAL EXPRESS","312":"JAI HIND","313":"GUJARAT SAMACHAR","314":"SANDESH","315":"DIVYA BHASKAR","316":"LOKSATTA JANSATTA","317":"THE TIMES OF INDIA","318":"THE NAVHIND TIMES","319":"OHERALDO","320":"GOMANTAK TIMES","321":"LOKMAT","322":"GOMANTAK","323":"PUDHARI","324":"GOA DOOT","325":"TARUN BHARAT","326":"NAVPRABHA","327":"THE ECONOMIC TIMES","328":"THE FINANCIAL EXPRESS","329":"BUSINESS STANDARD","330":"THE HINDU BUSINESS LINE","331":"FINANCIAL CHRONICLE","332":"MINT","333":"THE TIMES OF INDIA","334":"THE NEW INDIAN EXPRESS","335":"THE HINDU","336":"DAILY NEWS & ANALYSIS","337":"DECCAN HERALD","338":"DECCAN CHRONICLE","339":"BANGALORE MIRROR","340":"NATIONAL STANDARD","341":"RAJASTHAN PATRIKA","342":"DAKSHIN BHARAT RASHTRAMAT","343":"PRAJAVANI","344":"KANNADA PRABHA","345":"UDAYAVANI","346":"THE ECONOMIC TIMES","347":"THE FINANCIAL EXPRESS","348":"BUSINESS STANDARD","349":"THE HINDU BUSINESS LINE","350":"FINANCIAL CHRONICLE","351":"THE TIMES OF INDIA","352":"THE NEW INDIAN EXPRESS","353":"THE HINDU","354":"DECCAN CHRONICLE","355":"METRO INDIA","356":"SWATANTRA VAARTTHA","357":"DAILY HINDI MILAP","358":"EENADU","359":"VAARTHA","360":"ANDHRA PRABHA","361":"ANDHRA JYOTHY","362":"PRAJA SAKTI","363":"SURYAA","364":"THE ECONOMIC TIMES","365":"BUSINESS STANDARD","366":"THE HINDU BUSINESS LINE","367":"FINANCIAL CHRONICLE","368":"MINT","369":"THE TIMES OF INDIA","370":"THE NEW INDIAN EXPRESS","371":"THE HINDU","372":"DECCAN CHRONICLE","373":"RAJASTHAN PATRIKA","374":"DINAKARAN","375":"DAILY THANTHI","376":"DINAMANI","377":"DINAMALAR","378":"Other"};
	
	var $NewspaperSelect = $('#newspapers'); 
	$NewspaperSelect.find('option').remove();
	$NewspaperSelect.append("<option value=''>...select</option>");
	$.each(NewspaperVal,function(key, value) 
	{
	    $NewspaperSelect.append("<option value="+value.replace(/\s/g, '_')+">" + value + "</option>");
	});
	
	
	
	var magazinesVal = {"1":"BUSINESS TODAY","2":"BUSINESS WORLD","3":"BUSINESS ECONOMICS","4":"BUSINESS & ECONOMY","5":"BUSINESS INDIA","6":"CAMPAIGN INDIA","7":"FORBES INDIA","8":"FRONT LINE","9":"INDIA TODAY","10":"INDIA TODAY (H)","11":"OPEN","12":"OUTLOOK BUSINESS","13":"OUTLOOK MONEY","14":"OUTLOOK","15":"OUTLOOK (H)","16":"TEHELKA","17":"THE CARAVAN","18":"THE WEEK","19":"CAREER 360","20":"EDUCATION WORLD","21":"AFAQS! REPORTER","22":"IMPACT","23":"PITCH","24":"ANDPERSAND","25":"BY THE WAY","26":"CELEBRATING VIVAHA","27":"ABRAXAS LIFESTYLE","28":"ESTETICA","29":"ELLE","30":"EXOTICA","31":"FEMINA BRIDES","32":"GORGEOUS LOOKS","33":"GRAZIA","34":"GQ","35":"IS2","36":"HARPER'S BAZAAR INDIA","37":"HELLO!","38":"KLICK FASHION","39":"LE CITY DELUXE","40":"L'OFFICIEL INDIA","41":"SALON INTERNATIONAL","42":"STYLESPEAK","43":"HAIR","44":"MANDATE","45":"MEN'S HEALTH","46":"MAN'S WORLD","47":"MARWAR INDIA","48":"MAXIM","49":"MILLIONAIREASIA","50":"PLAN YOUR WEDDING","51":"PLATFORM","52":"RAVISHING","53":"SHOES & ACCESSORIES","54":"THE MAN","55":"THE GLOBAL GUJARATI","56":"TIME' N STYLE","57":"TIMELESS JEWELS","58":"UPPER CRUST","59":"VERVE","60":"VOGUE INDIA","61":"WEDDING AFFAIR","62":"WEDDING VOWS","63":"ASIANA WEDDING INTERNATIONAL","64":"ASIASPA INDIA","65":"BBC GOOD FOOD INDIA","66":"FOOD & HOSPITALITY WORLD","67":"FHRAI","68":"FIRST CITY","69":"FOOD AND NIGHTLIFE","70":"HOTELIER INDIA","71":"HOTEL SCAPES","72":"TIME OUT BENGALURU","73":"TIMEOUT DELHI","74":"TIME OUT MUMBAI","75":"COSMOPOLITAN","76":"FEMINA","77":"FEMINA (H)","78":"FHM","79":"FUSION LIFE","80":"BEAUTY LAUNCHPAD","81":"GRAHA SHOBHA","82":"GREHLAKSHMI","83":"NEW WOMAN","84":"PERFECT WOMAN","85":"SAVVY","86":"SMART LIFE","87":"SOCIETY","88":"VANITA","89":"WOMAN'S ERA","90":"WOMEN'S HEALTH","91":"CONDENAST TRAVELLER","92":"DISCOVER INDIA","93":"EXPRESS TRAVELWORLD","94":"GO NOW","95":"INDIA TODAY TRAVEL PLUS","96":"LONLEY PLANET","97":"OUTLOOK TRAVELLER","98":"PLANET-GOA","99":"RAILBANDHU","100":"TODAY'S TRAVELLER","101":"TOURISM INDIA","102":"TRAVEL SECRETS","103":"TRAVTALK","104":"TRAVEL+ LEISURE","105":"TRAVEL AND HOSPITALITY","106":"TRAVEL TRADE JOURNAL","107":"TRAVEL TRENDS TODAY","108":"TRIP THE LIFE FANTASTIC","109":"ARCHITECTURE + DESIGN","110":"ARCHITECTURAL DIGEST","111":"BETTER INTERIORS","112":"BETTER HOMES AND GARDENS","113":"CASAVIVA","114":"CW INTERIORS INDIA","115":"DESIGN MATRIX","116":"DESIGNTODAY","117":"ELLE DÉCOR","118":"GOOD HOUSEKEEPING","119":"GOOD HOMES","120":"HOME REVIEW","121":"HOME TRENDS","122":"INSIDE OUTSIDE","123":"PROPERTY FOR SALE","124":"PROPERTY OBSERVER","125":"REAL ESTATE OBSERVER","126":"REALTY PLUS","127":"SOCIETY INTERIORS","128":"THE IDEAL HOME AND GARDEN","129":"THE DESIGN SOURCE","130":"DIGIT","131":"DATA QUEST","132":"ELECTRONICS FOR YOU","133":"MY MOBILE","134":"PC QUEST","135":"STUFF INDIA","136":"VOICE & DATA","137":"EXHIBIT","138":"T3","139":"WHAT HI-FI?","140":"AUTO INDIA","141":"AUTO BILD INDIA","142":"AUTOCAR INDIA","143":"AUTOCAR PROFESSIONAL","144":"AUTO X","145":"BIKE INDIA","146":"CAR INDIA","147":"EVO INDIA","148":"EXTRA BRAKING HORSE POWER","149":"MOTORING","150":"MOTOWN INDIA","151":"OVERDRIVE","152":"TOP GEAR","153":"WHATCAR?","154":"ZIG WHEELS","155":"CINE BLITZ","156":"FILMFARE","157":"GR8!","158":"HI BLITZ","159":"ROLLING STONE","160":"STARDUST","161":"YOU & I","162":"STAR VIEW","163":"STAR WEEK","164":"IMAGES RETAIL","165":"IMAGES BUSINESS OF FASHION","166":"RETAILER","167":"SHOPPING CENTRE NEWS","168":"THE FRANCHISING WORLD","169":"WATCH TIME INDIA","170":"SPORTS ILLUSTRATED","171":"Other"};
	
	var $MagazinesSelect = $('#magazines'); 
	$MagazinesSelect.find('option').remove();
	$MagazinesSelect.append("<option value=''>...select</option>");
	$.each(magazinesVal,function(key, value) 
	{
	    $MagazinesSelect.append("<option value="+value.replace(/\s/g, '_')+">" + value + "</option>");
	});
	
	
	
	
	var myJson1 = {"country": [{"name": "Personal care","id": "Personal care","states": [{"name":"Toilet Soaps"},{"name":"Hair Wash"},{"name":"Tooth Pastes"},{"name":"Tooth Powders"},{"name":"Tooth Brushes"},{"name":"Talcum Powders"},{"name":"Hair Oils/Dressings"},{"name":"Deodorants"},{"name":"Shaving Preparations"},{"name":"Shaving Blades"},{"name":"SkinCreams"},{"name":"Hair Colourant"},{"name":"Sanitary Napkins"},{"name":"After Shave lotion"},{"name":"Depiletories"},{"name":"Shaving Blades",}]},
	                          {"name": "Food & Beverages","id": "Food & Beverages","states": [{"name":"Milk Food Drinks"},{"name":"Coffee"},{"name":"Noodles"},{"name":"Squashes / Powdered Drinks"},{"name":"Tea"},{"name":"Edible Oils"},{"name":"Ghee"},{"name":"Vanaspati"},{"name":"Sauces / Ketchups"},{"name":"Spices"},{"name":"Bottled Soft Drinks"},{"name":"Milk Powders"},{"name":"Milk"},{"name":"Jams"},{"name":"Atta"},{"name":"Salt"},{"name":"Butter / Cheese"},{"name":"Chocolates & Confectionary"},{"name":"Biscuits / Cookies"},{"name":"Breakfast Cereals"},{"name":"Tomato Purees / Paste"},{"name":"Soups"},{"name":"Ready to eat food"},{"name":"Ready to cook mixes"},{"name":"Ready to cook curry"},{"name":"Condensed Milk"},{"name":"Salty snacks"},{"name":"Honey"}]},
	                          {"name": "Household care","id": "Household care","states": [{"name":"Washing Soaps / Detergents"},{"name":"Optical Whiteners"},{"name":"Floor Cleaners"},{"name":"Scourers"},{"name":"Toilet / Bathroom Cleaners"},{"name":"Washing Powders"},{"name":"Insecticides"},{"name":"Agarbatti"},{"name":"Antiseptic Creams"}]},
	                          {"name": "OTC","id": "OTC","states": [{"name":"Rubs / Balms"},{"name":"Medicated Dressings"},{"name":"Glucose Powders"},{"name":"Chyvanprash"},{"name":"Rejuvinators / Cough /cold syrups"},{"name":"Digestives"}]},
	                          {"name": "Other","id": "Other"}
	                          ]};
	
	$.each(myJson1.country, function (index, value) {
	    $("#productCatg1,#productCatg2,#productCatg3").append('<option value="'+value.id+'">'+value.name+'</option>');
	});

	$('#productCatg1,#productCatg2,#productCatg3').on('change', function(){
		
		 if($(this).val() == 'Other'){
 	    	
		      $("#subProdDes1,#subProdDes2,#subProdDes3").removeClass( 'other-des' );
		      
		      $("#subProd1,#subProd2,#subProd3").addClass( 'other-des' );
		      
		    
		    }
		    else{
		      $("#subProdDes1,#subProdDes2,#subProdDes3").addClass( 'other-des' );
		      
		      $("#subProd1,#subProd2,#subProd3").removeClass( 'other-des' );
		    }
			
		 
	    console.log($(this).val());
	    for(var i = 0; i < myJson1.country.length; i++)
	    {
	      if(myJson1.country[i].id == $(this).val())
	      {
	         $("#subProductCatg1,#subProductCatg2,#subProductCatg3").html('<option value="">...select</option>');
	         $.each(myJson1.country[i].states, function (index, value) {
	            $("#subProductCatg1,#subProductCatg2,#subProductCatg3").append('<option value="'+value.name+'">'+value.name+'</option>');
	        });
	      }
	    }
	});
	
	

	$('#socialMedia').click(function() {
	    var $this = $(this);
	    if ($this.is(".class1")) {
	        if ($(".class1:checked").length > 0) {
	            $(".class3").prop({ disabled: true, checked: false });
	        } else {
	            $(".class3").prop("disabled", false);
	        }
	    } 
	});

	
	var myJson = {"country": [{"name": "House Hold Care","id": "House Hold Care","states": [{"name":"Surf Excel"},{"name":"Tide"},{"name":"Good Knight"},{"name":"All Out"},{"name":"Ariel"},{"name":"Rin"},{"name":"vim"},{"name":"domex"},{"name":"Mortein"},{"name":"wheel"},{"name":"ujala"},{"name":"nirma"},{"name":"harpic"},{"name":"boroplus"}]},
		                          {"name": "Personal Care","id": "Personal Care","states": [{"name":"Colgate"},{"name":"dettol"},{"name":"Clinc Plus"},{"name":"lifebouy"},{"name":"Lux"},{"name":"Close Up"},{"name":"Dove"},{"name":"babool"},{"name":"Ponds"},{"name":"Parachute"},{"name":"Sunsilk"},{"name":"Pepsodent"},{"name":"Fair and lovely"},{"name":"Panteen"},{"name":"Head and Shoulders"},{"name":"Cinthol"},{"name":"Santoor"},{"name":"medimix"},{"name":"Godrej no 1"},{"name":"Johnson and johnson"},{"name":"godrej hair dye"},{"name":"hamam"},{"name":"Garneir"},{"name":"lakme"},{"name":"vaseline"},{"name":"boroline"},{"name":"dabur hair oil"},{"name":"rexona"},{"name":"vivel"},{"name":"oral b"}]},
		                          {"name": "Food & Beverages","id": "Food & Beverages","states": [{"name":"Mazza"},{"name":"Britania"},{"name":"Maggi"},{"name":"Pepsi"},{"name":"Thumps Up"},{"name":"Kurkure"},{"name":"Rasna"},{"name":"Frooti"},{"name":"boost"},{"name":"Mirinda"},{"name":"hajmola"},{"name":"Tata Salt"},{"name":"Bournvita"},{"name":"Parle product"},{"name":"Cadbury Dairy milk"},{"name":"7 up"},{"name":"Coca cola"},{"name":"Horlicks"},{"name":"Limca"},{"name":"Sprite"},{"name":"Slice"},{"name":"Complan"},{"name":"Fanta"},{"name":"5 star"},{"name":"Tata tea"},{"name":"kissan"},{"name":"Sunfeast"},{"name":"munch"},{"name":"Amul"},{"name":"kitkat"},{"name":"netsle"},{"name":"bisleri"},{"name":"nescafe"},{"name":"aashirvad"},{"name":"lays"}]},
		                          {"name": "OTC","id": "OTC","states": [{"name":"crocin"},{"name":"amrutanjan"},{"name":"vicks"},{"name":"glucon d"},{"name":"d cold"},{"name":"iodex"},{"name":"saridon"},{"name":"zandu balm"},{"name":"moov"}]},
		                          {"name": "Others","id": "Others","states": [{"name":"big bazar"},{"name":"Nokia"},{"name":"Airtel"},{"name":"Bata"},{"name":"Vodafone"},{"name":"Samsung"},{"name":"BSNL"},{"name":"SBI"},{"name":"titan"},{"name":"lg"},{"name":"fevicol"},{"name":"samsung cansumer durables"}]}]};
		

	                          $.each(myJson.country, function (index, value) {
	                              $("#brands").append('<option value="'+value.name+'">'+value.name+'</option>');
	                          });

	                          $('#brands').on('change', function(){
	                              console.log($(this).val());
	                              for(var i = 0; i < myJson.country.length; i++)
	                              {
	                                if(myJson.country[i].id == $(this).val())
	                                {
	                                   $('#subbrands').html('<option value="">...select</option>');
	                                   $.each(myJson.country[i].states, function (index, value) {
	                                      $("#subbrands").append('<option value="'+value.name+'">'+value.name+'</option>');
	                                  });
	                                }
	                              }
	                          });
	
	
	
	
	
	
       
$('#stdDashboardPage').click(function() {
    	
        $('#stdDashboard').submit();
       
       
    });
    
    
});




function deleteHHPProfile(emailId,indHHCode,tabId){
	
	var msg = confirm("Are you sure you want to delete this?");

	if (msg) {
	
	document.location = "deleteUserInfo?emailId="+emailId+"&&HHCodeOption="+indHHCode+"&&tabId="+tabId;
	}
}


function deleteCIPVForEmailId(emailId,indHHCode,month,shopCode,tabId){
	
	
	var msg = confirm("Are you sure you want to delete this?");
	
	if (msg) {
		
		document.location = "deleteUserInfo?emailId="+emailId+"&&HHCodeOption="+indHHCode+"&&month="+month+"&&shopinfo="+shopCode+"&&tabId="+tabId;

	 }
}



function deleteCIPBForEmailId(emailId,indHHCode,month,ocassion,shopCode,tabId){
	
	
	var msg = confirm("Are you sure you want to delete this?");
	
	if (msg) {
		
		document.location = "deleteUserInfo?emailId="+emailId+"&&HHCodeOption="+indHHCode+"&&month="+month+"&&ocassion="+ocassion+"&&shopinfo="+shopCode+"&&tabId="+tabId;

	 }
}



function deleteShopProfile(emailId,shopinfo,tabId){
	
	var msg = confirm("Are you sure you want to delete this?");

	if (msg) {
	
	document.location = "deleteUserInfo?emailId="+emailId+"&&shopinfo="+shopinfo+"&&tabId="+tabId;
	}
}



function deleteHMProfile(emailId,shopinfo,month,ocassion,tabId){
	
	var msg = confirm("Are you sure you want to delete this?");

	if (msg) {
	
	document.location = "deleteUserInfo?emailId="+emailId+"&&shopinfo="+shopinfo+"&&month="+month+"&&ocassion="+ocassion+"&&tabId="+tabId;
	}
}






function onChangeAppear(idVal){
	
	 var selected = $("#"+idVal).val();
	 
	
    
    if(selected == 'Other'){
    	    	
      $("#"+idVal+"OtherDes").removeClass( 'other-des' );
    }
    else{
      $("#"+idVal+"OtherDes").addClass( 'other-des' );
    }
	
}





</script>

<%
	HouseholdProfileVo hhProfileVo = (HouseholdProfileVo) request.getAttribute("hhProfileVo");

List<String> hhCodeList = (List<String>) request.getAttribute("hhCodeList");

List<String> hhIndividualCodeList = (List<String>) request.getAttribute("hhIndividualCodeList");

List<IHHProfileVO> listIHHProfileVO = (List<IHHProfileVO>) request.getAttribute("listIHHProfileVO");

List<ShopProfileVO> listShopProfileVO = (List<ShopProfileVO>) request.getAttribute("listShopProfileVO");

List<String> shopListForHHProfile = (List<String>) request.getAttribute("shopListForHHProfile");

CIPVProfileVO cIPVProfileVO =  (CIPVProfileVO) request.getAttribute("cIPVProfileVO");

CIPBProfileVO cIPBProfileVO =  (CIPBProfileVO) request.getAttribute("cIPBProfileVO");

HMPProfileVO hMPProfileVO =  (HMPProfileVO) request.getAttribute("hMPProfileVO");






String activeTab =  (String) request.getAttribute("activeTab");


	
	  String emailId = request.getParameter( "emailId" );
	   
	  if(emailId == null)
	  {
		  emailId = (String)session.getAttribute( "emailId" );
	  }
	  
	   session.setAttribute( "emailId", emailId );
%>




</head>

<body>

	<input type="hidden" id="activeTab" name="activeTab"
		value="<%=activeTab%>" />

	<nav role="navigation" class="navbar navbar-inverse header">
		<div class="container-fluid">
			
			<div class="navbar-header">
				<button data-target="#bs-example-navbar-collapse-1"
					data-toggle="collapse" class="navbar-toggle" type="button">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<span class="logo"> </span> <a href="#" class="navbar-brand">
					Interlink 2i - Profile's</a>
			</div>

			<!-- Collect the nav links, forms, and other content for toggling -->
			<div id="bs-example-navbar-collapse-1"
				class="collapse navbar-collapse">
				<ul class="nav navbar-nav">
					<li><a href="#" id="stdDashboardPage">Dashboard</a>
					</li>
					<li><a href="create_profile.jsp">Create Profile</a>
					</li>
					<li class="active"><a href="#">Update Profile</a>
					</li>
				</ul>

				<ul class="nav navbar-nav navbar-right">
					<li><a href="inter_login.jsp">Logout</a>
					</li>
				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container-fluid -->
	</nav>


	<form class="form-horizontal" id="stdDashboard" action="stdDashboard"
		method="post">

		<input type="hidden" id="emailId" name="emailId" value="<%=emailId%>" />

	</form>

	<div class="container">


		<div class="form-structure">

			<form action="createhhprofile" method="post">

				<input type="hidden" id="emailId" name="emailId"
					value="<%=emailId%>" />

				<div class="select-hh">
					<span class="title-lable">House Hold Profile</span>
					<div class="inpu">
						<select class="form-control" required="required" id="HHCodeOption" name="HHCodeOption">

							<option value="">.. Select HHCode</option>

							<%
     		     		 	if ( hhCodeList != null && hhCodeList.size()!=0 ){

     		     		      		     		 					String val = null;
     		     		      		     		 							
     		     		      		     		 				Iterator<String> itr = hhCodeList.iterator();

     		     		      		     		 		
     		     		      		     		 				while(itr.hasNext())
     		     		      		     		 				{
     		     		      		     		 			
     		     		      		     		 					val = itr.next();
     		     		      		     		 					
     		     		      		     		 					if(hhProfileVo!= null && hhProfileVo.getHHCode().equalsIgnoreCase(val))
     		     		      		     		 					{
     		     		 %>

							<option value="<%=val%>" selected>
								<%=val%>
							</option>

							<%
				                  				        	}
				                  				        		                  				        					
				                  				        		                  				        					else{
				                  				        %>

							<option value="<%=val%>">
								<%=val%>
							</option>

							<%
				                  				        	}

				                  				        		                  				        	
				                  				        		                  				        			}
				                  				        		                  				        		}
				                  				        %>
						</select>
					</div>

					<button type="submit" class="btn btn-info"
						style="margin-top: 10px;">GO!</button>
				</div>

			</form>

			<div class="clear2"></div>
			<!-- Nav tabs -->
			<ul class="nav nav-tabs">
				<li><a href="#hp" data-toggle="tab">HP</a>
				</li>
				<li><a href="#ihhp" data-toggle="tab">IHHP</a>
				</li>
				<li><a href="#sp" data-toggle="tab">SP</a>
				</li>
				<li><a href="#hmp" data-toggle="tab">HMP</a>
				</li>
				<li><a href="#cipv" data-toggle="tab">CIPV</a>
				</li>
				<li><a href="#cipb" data-toggle="tab">CIPB</a>
				</li>
			</ul>



			<%
	if(hhProfileVo != null){
%>

			<!-- Tab panes -->
			<div class="tab-content">
				<div class="tab-pane active" id="hp">

					<div class="household-profile">
						<h4>1 - Household Profile</h4>

						<span class="title-lable">Area</span> <span class="text-output"><%=hhProfileVo.getArea()%></span>

						<span class="title-lable">HH Code</span> <span class="text-output"><%=hhProfileVo.getHHCode()%></span>

						<span class="title-lable">Google Co-ordinate</span> <span
							class="text-output"><%=hhProfileVo.getGoogleLocation()%></span> <span
							class="title-lable">Type of household</span> <span
							class="text-output"><%=hhProfileVo.getHhType()%> </span> <span
							class="title-lable">Vehicle Type</span> <span class="text-output"><%=hhProfileVo.getVehicleType()%></span>

						<span class="title-lable">Vehical Brand</span> <span
							class="text-output"><%=hhProfileVo.getVehicleBrand()%></span> <span
							class="title-lable">Cable/Dish connection </span> <span
							class="text-output"><%=hhProfileVo.getCableConnection()%></span>

						<span class="title-lable">Net connection </span> <span
							class="text-output"><%=hhProfileVo.getNetConnection()%></span>


						<div class="clear"></div>
					</div>

				</div>


				<div class="tab-pane" id="ihhp">

					<div class="individual-house-profile">
						<h4>2 - Individual Household Profile</h4>

						<div class="panel-group" id="accordion">



							<%
                  	if(listIHHProfileVO != null && listIHHProfileVO.size() !=0 ){
                                    		
                                    		
                                    		Iterator<IHHProfileVO> itr = listIHHProfileVO.iterator();

                                    		
                                    		while(itr.hasNext())
                                    		{
                                    	
                                    	IHHProfileVO iHHProfileVO = itr.next();
                                    	
                                    	String id = iHHProfileVO.getHHIndividualCode();
                                    	
                                    	String hrefVal = "#"+id;
                  %>



							<div class="panel panel-default">
								<div class="panel-heading">
									<div class="panel-title">
										<a data-toggle="collapse" data-parent="#accordion"
											href="<%=hrefVal%>"> <%=iHHProfileVO.getHHIndividualCode()%>
											- <%=iHHProfileVO.getIndividualName()%> </a>
										
		<button type="button" class="btn btn-warning btn-xs" onclick="deleteHHPProfile('<%=iHHProfileVO.getEmailId()%>','<%=iHHProfileVO.getHHIndividualCode()%>','ihhp');" >Delete</button>
									</div>
								</div>
								<div id="<%=iHHProfileVO.getHHIndividualCode()%>"
									class="panel-collapse collapse">
									<div class="panel-body created-profile">
										<span class="title-lable">House Hold Profile</span> <span
											class="text-output"><%=iHHProfileVO.getHHCode()%></span> <span
											class="title-lable">Individual Name</span> <span
											class="text-output"><%=iHHProfileVO.getIndividualName()%>
										</span> <span class="title-lable">HH Individual Code</span> <span
											class="text-output"><%=iHHProfileVO.getHHIndividualCode()%></span>

										<span class="title-lable">Age</span> <span class="text-output"><%=iHHProfileVO.getAge()%></span>

										<span class="title-lable">Sex</span> <span class="text-output"><%=iHHProfileVO.getSex()%></span>

										<span class="title-lable">Relationship</span> <span
											class="text-output"><%=iHHProfileVO.getRelationship()%></span>

										<span class="title-lable">Education</span> <span
											class="text-output"><%=iHHProfileVO.getEducation()%></span> <span
											class="title-lable">Occupation</span> <span
											class="text-output"><%=iHHProfileVO.getOccupation()%></span>


										<span class="title-lable">Place of Work</span> <span
											class="text-output"><%=iHHProfileVO.getWorkplace()%></span> <span
											class="title-lable">Mode of Transport</span> <span
											class="text-output"><%=iHHProfileVO.getTransport()%></span> <span
											class="title-lable">Type of Mobile</span> <span
											class="text-output"><%=iHHProfileVO.getMobileType()%></span>


										<span class="title-lable">Mobile Brand</span> <span
											class="text-output"><%=iHHProfileVO.getMobileBrand()%></span>


										<span class="title-lable">Avg monthly mobile bill</span> <span
											class="text-output"><%=iHHProfileVO.getMobileBill()%></span>

										<span class="title-lable">Type of internet access</span> <span
											class="text-output"><%=iHHProfileVO.getNetConnection()%></span>

										<span class="title-lable">Access to social media</span> <span
											class="text-output"><%=iHHProfileVO.getSocialMedia()%></span>

										<span class="title-lable">Sits fequenty visited</span> <span
											class="text-output"><%=iHHProfileVO.getSitesfequentyvisited()%></span>

										<span class="title-lable">Recreation activities</span> <span
											class="text-output"><%=iHHProfileVO.getRecreationActivities()%></span>

										<span class="title-lable">Hobbies</span> <span
											class="text-output"><%=iHHProfileVO.getHobbies()%></span> <span
											class="title-lable">Channels Watch</span> <span
											class="text-output"><%=iHHProfileVO.getChannels()%></span> <span
											class="title-lable">Newspapers Subscribed</span> <span
											class="text-output"><%=iHHProfileVO.getNewspapers()%></span>

										<span class="title-lable">Magazines Subscribed</span> <span
											class="text-output"><%=iHHProfileVO.getMagazines()%></span>

									</div>
								</div>
							</div>



							<%
      	}
            }
      %>



							<form id="IHHP" action="ihhpservlet" method="post">

								<input type="hidden" id="emailId" name="emailId"
									value="<%=emailId%>" />

								<%
    	if(hhProfileVo!= null)
        	  
          {
    %>

								<input type="hidden" id="HHCode" name="HHCode"
									value="<%=hhProfileVo.getHHCode()%>" />

								<%
     	}
     %>

								<div class="panel panel-default">
									<div class="panel-heading">
										<div class="panel-title">
											<a data-toggle="collapse" data-parent="#accordion"
												href="#collapseTwo"> Create New Respondent </a>
										</div>

									</div>
									<div id="collapseTwo" class="panel-collapse collapse  in">
										<div class="panel-body">

											<span class="title-lable">Individual Name</span>
											<div class="inpu">
												<input class="form-control" id="individualName"
													name="individualName" required="required" />
											</div>

											<span class="title-lable">Age</span>
											<div class="inpu">
												<input class="form-control" id="age" name="age" required="required" />
											</div>

											<span class="title-lable">Sex</span>
											<div class="form-group inpu">
												<div>
													<div class="radio">
														<label> <input type="radio" value="Male"
															name="sex" checked="checked" /> Male </label>
													</div>
													<div class="radio">
														<label> <input type="radio" value="Female"
															name="sex" /> Female </label>
													</div>
													<div class="radio">
														<label> <input type="radio" value="Other"
															name="sex" /> Other </label>
													</div>
												</div>
											</div>

											<span class="title-lable">Relationship</span>
											<div class="inpu">
												<select class="form-control" id="relationship"
													name="relationship"
													required="required"
													onchange="onChangeAppear('relationship');">


													<option value="">...select</option>
													<option value="CWE">CWE</option>
													<option value="Housewife">Housewife</option>
													<option value="Father">Father</option>
													<option value="Mother">Mother</option>
													<option value="Son">Son</option>
													<option value="Daughter">Daughter</option>
													<option value="Other">Other</option>
												</select>
												<div class="other-des" id="relationshipOtherDes">
													<input class="form-control other-inpu"  name="relationshipOthers" placeholder="Other Relationship">
												</div>
											</div>

											<span class="title-lable">Education</span>
											<div class="inpu">
												<select  required="required" class="form-control" id="education" name="education" onchange="onChangeAppear('education');">
													<option value="">...select</option>
													<option value="Illiterate">Illiterate</option>
													<option value="Literate, but no formal schooling">Literate,
														but no formal schooling</option>
													<option value="School - upto 4th standard">School
														- upto 4th standard</option>
													<option value="School - 5th to 9th standard">School
														- 5th to 9th standard</option>
													<option value="SSC/HSC (10th -12th)">SSC/HSC (10th
														-12th)</option>
													<option value="some college(incl. Dip) but not graduate">some
														college(incl. Dip) but not graduate</option>
													<option value="Graduate - General- BA, Bsc, Bcom">Graduate
														- General- BA, Bsc, Bcom</option>
													<option value="Graduate - profess- Be, MBBS, Btec">Graduate
														- profess- Be, MBBS, Btec</option>
													<option value="Post Grad - General - MA, Msc, Mcom">Post
														Grad - General - MA, Msc, Mcom</option>
													<option value="Post Grad - General - ME, MD, Mtec">Post
														Grad - General - ME, MD, Mtec</option>
													
												<option value="Other">Other</option>
												</select>
												<div class="other-des" id="educationOtherDes">
													<input class="form-control other-inpu"  name="educationOthers" placeholder="Other education">
												</div>
											</div>

											<span class="title-lable">Occupation</span>
											<div class="inpu">
												<select class="form-control" required="required" id="occupation"
													name="occupation" onchange="onChangeAppear('occupation');">
													<option value="">...select</option>
													<option value="Unskilled worker">Unskilled worker</option>
													<option value="Skilled worker">Skilled worker</option>
													<option value="Petty trader">Petty trader</option>
													<option value="Shop owner">Shop owner</option>
													<option value="Businessman -none">Businessman
														-none</option>
													<option value="Industrialist (no of 1 - 9)">Industrialist
														(no of 1 - 9)</option>
													<option value="Industrialist (10+)">Industrialist
														(10+)</option>
													<option value="Self employed professional">Self
														employed professional</option>
													<option value="Cleark salesman">Cleark salesman</option>
													<option value="Supervisory level">Supervisory
														level</option>
														<option value="Housewife">Housewife</option>
													<option value="Student">Student</option>
													<option value="Student">Not Working</option>
												
												<option value="Other">Other</option>
												</select>
												<div class="other-des" id="occupationOtherDes">
													<input class="form-control other-inpu"  name="occupationOthers" placeholder="Other Occupation">
												</div>
											</div>

											<span class="title-lable">Place of Work</span>
											<div class="inpu">
												<input class="form-control" id="workplace" required="required" name="workplace" />
											</div>

											<span class="title-lable">Mode of Transport</span>
											<div class="inpu">
												<select class="form-control" required="required" id="transport" name="transport"
													onchange="onChangeAppear('transport');">
													<option value="">...select</option>
													<option value="Walking">Walking</option>
													<option value="Bus">Bus</option>
													<option value="Train">Train</option>
													<option value="2 Wheler">2 Wheler</option>
													<option value="4 Wheler">4 Wheler</option>
													<option value="Other">Other</option>
												</select>
												<div class="other-des" id="transportOtherDes">
													<input class="form-control other-inpu"
														name="transportOthers"  placeholder="Other Mode of Transport">
												</div>
											</div>

											<span class="title-lable">Type of Mobile</span>
											<div class="inpu">
												<select required="required" class="form-control" id="mobileType"
													name="mobileType" onchange="onChangeAppear('mobileType');">
													<option value="">...select</option>
													<option value="Reggular">Reggular</option>
													<option value="Android">Android</option>
													<option value="Windows">Windows</option>
													<option value="iPhone">iPhone</option>
													<option value="Other">Other</option>
												</select>
												<div class="other-des" id="mobileTypeOtherDes">
													<input class="form-control other-inpu"  name="mobileTypeOthers" placeholder="Other Type of Mobile">
												</div>
											</div>


											<span class="title-lable">Mobile Brand</span>
											<div class="inpu">
												<select required="required" class="form-control" id="mobileBrand"
													name="mobileBrand" onchange="onChangeAppear('mobileBrand');">
													<option value="">...select</option>
													<option value="Nokia">Nokia</option>
													<option value="Smasung">Smasung</option>
													<option value="Motorola">Motorola</option>
													<option value="iPhone">iPhone</option>
													<option value="Nexus">Nexus</option>
												<option value="Other">Other</option>
												</select>
												<div class="other-des" id="mobileBrandOtherDes">
													<input class="form-control other-inpu"  name="mobileBrandOthers" placeholder="Mobile Brand">
												</div>
											</div>


											<span class="title-lable">Avg monthly mobile bill</span>
											<div class="inpu">
												<select required="required" class="form-control" id="mobileBill"
													name="mobileBill">
													<option value="">...select</option>
													<option value="Less than 300">Less than 300</option>
													<option value="300 to 800">300 to 800</option>
													<option value="800 to 1500">800 to 1500</option>
													<option value="1500 to 3000">1500 to 3000</option>
													<option value="3000 +">3000 +</option>
												</select>
											</div>

											<span class="title-lable">Type of internet access</span>
											<div class="inpu">
												<select class="form-control" required="required" name="netConnection"
													id="netConnection"
													onchange="onChangeAppear('netConnection');">
													<option value="">...select</option>
													<option value="Wifi">Wireless (Wifi)</option>
													<option value="Broadband">Cable/Broadband</option>
													<option value="DC">Data Card</option>
													<option value="LeasedLine">Leased Line</option>
													<option value="Other">Other</option>
												</select>
												<div class="other-des" id="netConnectionOtherDes">
													<input class="form-control other-inpu"
														name="netConnectionOthers"  placeholder="Other Type of Internet">
												</div>
											</div>

											<span class="title-lable">Access to social media</span>
											<!-- <div class="inpu">
												<select class="form-control" required="required" name="socialMedia"
													id="socialMedia" onchange="onChangeAppear('socialMedia');">
													<option value="">...select</option>
													<option value="No">No</option>
													<option value="Facebook, Twitter, Google+">Facebook,
														Twitter, Google+</option>
													<option value="Facebook">Facebook</option>
													<option value="Google+">Google+</option>
													<option value="Twitter">Twitter</option>
													<option value="Facebook and Googel+">Facebook and
														Googel+</option>
													<option value="Google and Twitter">Google and
														Twitter</option>
													<option value="Twitter and Facebook">Twitter and
														Facebook</option>
													<option value="Other">Other</option>
												</select>
												<div class="other-des" id="socialMediaOtherDes">
													<input class="form-control other-inpu"
														name="socialMediaOthers"  placeholder="Other Type of Social Media">
												</div>
											</div> -->
											<div class="form-group inpu">
												<div>
													<div class="radio">
														<label> <input type="checkbox" value="Google"
															name="socialMedia" disabled="disabled" class="class3" /> Google </label>
													</div>
													<div class="radio">
														<label> <input type="checkbox" value="Twitter"
															name="socialMedia" disabled="disabled" class="class3"  /> Twitter </label>
													</div>
													<div class="radio">
														<label> <input type="checkbox" value="Facebook"
															name="socialMedia" disabled="disabled" class="class3"  /> Facebook </label>
													</div>
													
													
													<div class="radio">
														<label> <input type="checkbox" value="LinkedIn"
															name="socialMedia" disabled="disabled" class="class3"  /> LinkedIn </label>
													</div>
													<div class="radio">
														<label> <input type="checkbox" value="Others"
															name="socialMedia" disabled="disabled" class="class3"  /> Others </label>
													</div>
													<div class="radio">
														<label> <input type="checkbox" value="No"
															id="socialMedia" name="socialMedia" checked="checked" class="class1" /> No </label>
													</div>
												</div>
											</div>
											

											<span class="title-lable">Sites fequenty visited</span>
											<div class="inpu">
												<input class="form-control" name="sitesfequentyvisited" required="required" />
											</div>

											<span class="title-lable">Recreation activities</span>
											<div class="inpu">
												<input class="form-control" name="recreationActivities" required="required" />
											</div>

											<span class="title-lable">Hobbies</span>
											<div class="inpu">
												<input class="form-control" name="hobbies" required="required" />
											</div>


											<span class="title-lable">Channels Watch</span>
											<div class="inpu">
												<select class="form-control" required="required" name="channels" id="channels"
													onchange="onChangeAppear('channels');">
													
												</select>
												<div class="other-des" id="channelsOtherDes">
													<input class="form-control other-inpu"  name="channelsOthers" placeholder="Other Channels">
												</div>
											</div>

											<span class="title-lable">Newspapers Subscribed</span>
											<div class="inpu">
												<select class="form-control" required="required" id="newspapers" name="newspapers"
												onchange="onChangeAppear('newspapers');">
													
													
												</select>
												
												<div class="other-des" id="newspapersOtherDes">
													<input class="form-control other-inpu"  name="newspapersOthers" placeholder="Other newspapers">
												</div>

											</div>

											<span class="title-lable">Magazines Subscribed</span>
											<div class="inpu">
												<select class="form-control"  id="magazines" name="magazines"
													onchange="onChangeAppear('magazines');">
													
												</select>
												
												<div class="other-des" id="magazinesOtherDes">
													<input class="form-control other-inpu" name="magazinesOthers" placeholder="Other magazines">
												</div>

											</div>


											<div class="clear"></div>
											<div class="form-footer">
												<button type="submit" class="btn btn-danger">Create</button>

											</div>
										</div>
									</div>
								</div>

							</form>

						</div>

						<div class="clear"></div>
					</div>
				</div>


				<div class="tab-pane" id="sp">

					<div class="shop-profile">

						<h4>3 - Shop Profile</h4>


						<div class="panel-group" id="accordion">


							<%
	  	  	  	if(listShopProfileVO != null && listShopProfileVO.size() !=0 ){
	  	  	  	  	  	  		
	  	  	  	  	  	  		
	  	  	  	  	  	  		Iterator<ShopProfileVO> itr = listShopProfileVO.iterator();

	  	  	  	  	  	  		
	  	  	  	  	  	  		while(itr.hasNext())
	  	  	  	  	  	  		{
	  	  	  	  	  	  	
	  	  	  	  	  	  	ShopProfileVO shopProfileVO = itr.next();
	  	  	  	  	  	  	
	  	  	  	  	  	  	String id = shopProfileVO.getShopCode();
	  	  	  	  	  	  	
	  	  	  	  	  	  	String hrefVal = "#"+id;
	  	  	  %>




							<div class="panel panel-default">
								<div class="panel-heading">
									<div class="panel-title">
										<a href="<%=hrefVal%>" data-parent="#accordion"
											data-toggle="collapse" class="collapsed"> <%=id%> - <%=shopProfileVO.getArea()%>
										</a>
										
		<button class="btn btn-warning btn-xs" type="button" onclick="deleteShopProfile('<%=shopProfileVO.getEmailId()%>','<%=shopProfileVO.getShopCode()%>','sp');" >Delete</button>
									</div>
								</div>
								<div id="<%=id%>" class="panel-collapse collapse">
									<div class="panel-body created-profile">

										<span class="title-lable">HH Code</span> <span
											class="text-output"><%=shopProfileVO.getHHCode()%></span> <span
											class="title-lable">Type of Outlet Code</span> <span
											class="text-output"><%=shopProfileVO.getOutletType()%></span>


										<span class="title-lable">Shop Name</span> <span
											class="text-output"><%=shopProfileVO.getShopName()%></span> <span
											class="title-lable">Shop Code</span> <span
											class="text-output"> <%=shopProfileVO.getShopCode()%></span>

										<span class="title-lable">Area</span> <span
											class="text-output"><%=shopProfileVO.getArea()%></span> <span
											class="title-lable">Pincode</span> <span class="text-output"><%=shopProfileVO.getPincode()%></span>

										<span class="title-lable">Door delivery</span> <span
											class="text-output"><%=shopProfileVO.getDoordelivery()%></span>

										<span class="title-lable">Phone Order</span> <span
											class="text-output"><%=shopProfileVO.getPhoneorder()%></span>

										<span class="title-lable">Selfpickup</span> <span
											class="text-output"><%=shopProfileVO.getSelfpickup()%></span>

										<span class="title-lable">Monthly Credit</span> <span
											class="text-output"><%=shopProfileVO.getMonthlycredit()%></span>

										<span class="title-lable">Shop Bascket</span> <span
											class="text-output"><%=shopProfileVO.getShoppingbasket()%></span>

										<span class="title-lable">Credit Card</span> <span
											class="text-output"><%=shopProfileVO.getCreditcard()%></span>

										<span class="title-lable">Electronic Billing</span> <span
											class="text-output"><%=shopProfileVO.getElectronicbilling()%></span>

										<span class="title-lable">No. of Assistant</span> <span
											class="text-output"><%=shopProfileVO.getNoOfAssistant()%></span>

										<span class="title-lable">Dist in Min from home</span> <span
											class="text-output"><%=shopProfileVO.getDistInMin()%></span>

										<span class="title-lable">Dist in KM from home</span> <span
											class="text-output"><%=shopProfileVO.getDistInKm()%></span> <span
											class="title-lable">Shop Front in Ft from home</span> <span
											class="text-output"><%=shopProfileVO.getShopFrontFt()%></span>

									</div>
								</div>
							</div>


							<%
      			}
      		      		}
      		%>



							<form id="SP" action="shopProfileServlet" method="post">

								<input type="hidden" id="emailId" name="emailId"
									value="<%=emailId%>" />

								<%
    	if(hhProfileVo!= null)
        	  
          {
    %>

								<input type="hidden" id="HHCode" name="HHCode"
									value="<%=hhProfileVo.getHHCode()%>" />

								<%
     	}
     %>


								<div class="panel panel-default">
									<div class="panel-heading">
										<div class="panel-title">
											<a href="#spnew" data-parent="#accordion"
												data-toggle="collapse" class="collapsed"> Add New Shop </a>

										</div>
									</div>
									<div id="spnew" class="panel-collapse collapse in">
										<div class="panel-body">
											<span class="title-lable">HH Code</span> <span
												class="text-output"><%=hhProfileVo.getHHCode()%></span> <span
												class="title-lable">Type of Outlet Code</span>
											<div class="inpu">
												<select class="form-control" required="required" id="outletType"
													name="outletType" onchange="onChangeAppear('outletType');">
													<option value="">...select</option>
													<option value="GROCERS/GENERAL STORES">GROCERS/GENERAL
														STORES</option>
													<option value="Cosmetic Stores">Cosmetic Stores</option>
													<option value="Food/Bakery Stores">Food/Bakery
														Stores</option>
													<option value="Medical Stores">Medical Stores</option>
													<option value="Modern Format stores">Modern Format
														stores</option>
													<option value="Other">Other</option>
												</select>
												<div class="other-des" id="outletTypeOtherDes">
													<input class="form-control other-inpu" 
														name="outletTypeOthers" placeholder="Other Channels">
												</div>
											</div>

											<span class="title-lable">Shop Name</span>
											<div class="inpu">
												<input class="form-control" id="shopName" name="shopName" required="required" />
											</div>

											<!--       <span class="title-lable">Shop Code</span>
      <span class="text-output"> HH001-Groc1(Auto generate)</span>  -->

											<span class="title-lable">Area</span>
											<div class="inpu">
												<input class="form-control" id="area" name="area" required="required" />
											</div>

											<span class="title-lable">Pincode</span>
											<div class="inpu">
												<input class="form-control" id="pincode" name="pincode" required="required" />
											</div>

											<span class="title-lable">Door delivery</span>
											<div class="form-group inpu">
												<div>
													<div class="radio">
														<label> <input type="radio" name="doordelivery"
															value="Yes" /> Yes </label>
													</div>
													<div class="radio">
														<label> <input type="radio" name="doordelivery"
															value="No" checked="checked" /> No </label>
													</div>
												</div>
											</div>

											<span class="title-lable">Phone Order</span>
											<div class="form-group inpu">
												<div>
													<div class="radio">
														<label> <input type="radio" name="phoneorder"
															value="Yes" checked="checked"> Yes </label>
													</div>
													<div class="radio">
														<label> <input type="radio" name="phoneorder"
															value="No"> No </label>
													</div>
												</div>
											</div>

											<span class="title-lable">Selfpickup</span>
											<div class="form-group inpu">
												<div>
													<div class="radio">
														<label> <input type="radio" name="selfpickup"
															value="Yes" checked="checked"> Yes </label>
													</div>
													<div class="radio">
														<label> <input type="radio" name="selfpickup"
															value="No"> No </label>
													</div>
												</div>
											</div>

											<span class="title-lable">Monthly Credit</span>
											<div class="form-group inpu">
												<div>
													<div class="radio">
														<label> <input type="radio" name="monthlycredit"
															value="Yes" checked="checked"> Yes </label>
													</div>
													<div class="radio">
														<label> <input type="radio" name="monthlycredit"
															value="No"> No </label>
													</div>
												</div>
											</div>

											<span class="title-lable">Shopping Bascket</span>
											<div class="form-group inpu">
												<div>
													<div class="radio">
														<label> <input type="radio" name="shoppingbasket"
															value="Yes" checked="checked"> Yes </label>
													</div>
													<div class="radio">
														<label> <input type="radio" name="shoppingbasket"
															value="No"> No </label>
													</div>
												</div>
											</div>

											<span class="title-lable">Credit Card</span>
											<div class="form-group inpu">
												<div>
													<div class="radio">
														<label> <input type="radio" name="creditcard"
															value="Yes" checked="checked" /> Yes </label>
													</div>
													<div class="radio">
														<label> <input type="radio" name="creditcard"
															value="No"> No </label>
													</div>
												</div>
											</div>

											<span class="title-lable">Electronic Billing</span>
											<div class="form-group inpu">
												<div>
													<div class="radio">
														<label> <input type="radio"
															name="electronicbilling" value="Yes" checked="checked">
															Yes </label>
													</div>
													<div class="radio">
														<label> <input type="radio"
															name="electronicbilling" value="No"> No </label>
													</div>
												</div>
											</div>

											<span class="title-lable">No. of Assistant</span>
											<div class="inpu">
												<input class="form-control" id="noOfAssistant"
													name="noOfAssistant" required="required" />
											</div>

											<span class="title-lable">Dist in Min from home</span>
											<div class="inpu">
												<select class="form-control" required="required" name="distInMin">
													<option value="">...select</option>
													<option value="Less than 30">Less than 30</option>
													<option value="30 to 60">30 to 60</option>
													<option value="60+">60+</option>
												</select>
											</div>

											<span class="title-lable">Dist in KM from home</span>
											<div class="inpu">
												<select class="form-control" required="required" name="distInKm">
													<option value="">...select</option>
													<option value="0 -1 klm">0 -1 klm</option>
													<option value="1- 3 klm">1- 3 klm</option>
													<option value="3+">3+</option>
												</select>
											</div>

											<span class="title-lable">Shop Front in Ft from home</span>
											<div class="inpu">
												<select class="form-control" required="required" name="shopFrontFt">
													<option value="">...select</option>
													<option value="0 - 10">0 - 10</option>
													<option value="10 to 20">10 to 20</option>
													<option value="20+">20+</option>
												</select>
											</div>


											<div class="clear"></div>
											<div class="form-footer">
												<button type="submit" class="btn btn-danger">Create</button>
											</div>
										</div>
									</div>
								</div>


							</form>


						</div>



					</div>
				</div>





				<div class="tab-pane" id="hmp">
					<div class="household-monthly-purchase">

						<h4>4 - Household Monthly Purchase</h4>


						<div class="select-rp">
							<form id="hmpHead" action="hmpservlet" method="post">

								<input type="hidden" id="emailId" name="emailId"
									value="<%=emailId%>" />

								<%
  
  if(hhProfileVo!= null)
	  
  {
   %>
								<input type="hidden" id="HHCode" name="HHCode"
									value="<%=hhProfileVo.getHHCode()%>" />

								<%

  }
	%>


								<span class="title-lable info-lable">Search Shop</span>
								<div class="inpu form-probtn">
									<select class="form-control" required="required" id="shopinfo" name="shopinfo">

										<option value="">.. Select Shop</option>

										<%
   					if ( shopListForHHProfile != null && shopListForHHProfile.size()!=0 ){

							String val = null;
							
							
									
						Iterator<String> itr = shopListForHHProfile.iterator();

				
						while(itr.hasNext())
						{
					
							val = itr.next();
							
						
								%>

										<option value="<%=val%>">
											<%=val%>
										</option>

										<%
						
					}
				}
		%>
									</select>
									<button class="btn btn-success btn-sm" type="submit">Go</button>
								</div>


							</form>
						</div>
						<div class="clear2"></div>

						<div class="panel-group" id="accordion">






							<%
                                     	  	if(hMPProfileVO != null && hMPProfileVO.gethMPProductWiseVO().size() !=0 ){
                                     	                                       	  		
                                     	                                       	  		
                                     	                                       	  		
                                     	                                       	  		Iterator maphMPMonthList = hMPProfileVO.gethMPProductWiseVO().entrySet().iterator();
                                     	                                       	  		while (maphMPMonthList.hasNext()) {
                                     	                                       	  	Map.Entry mapEntry = (Map.Entry) maphMPMonthList.next();

                                     	                                       	  		 
                                     	                                       	  		 String month = (String)mapEntry.getKey();
                                     	                                       	  		 
                                     	                                       	  		
                                     	                                       	  		
                                     	                                       	  		 Map<String, List<HMPProductWiseVO>> occList = (Map<String, List<HMPProductWiseVO>>) mapEntry.getValue();
                                     	                                       	  		 
                                     	                                       	  		 
                                     	                                       	  		 
                                     	                                       	  		 Iterator itrshopMap = occList.entrySet().iterator();
                                     	                                       	  	while (itrshopMap.hasNext()) {
                                     	                                       	  		Map.Entry mapEntry1 = (Map.Entry) itrshopMap.next();
                                     	                                       	  		
                                     	                                       	  		String occation = (String)mapEntry1.getKey();
                                     	                                       	  		
                                     	                                       	  	 String id = hMPProfileVO.getShopCode()+month+occation;
                                 	                                       	  		 
                                     	                                       	  	 id = id.replaceAll(" ", "");
                                 	                                       	  		 
                                 	                                       	  		 String hrefVal = "#"+id;
                                     	                                      		 
                                     	                                       	  		List<HMPProductWiseVO> productList = (List<HMPProductWiseVO>) mapEntry1.getValue();
                                     	                                       	  		
                                     	                                       	  	String shopInfo = hMPProfileVO.getShopInfo().substring(hMPProfileVO.getShopCode().length());
                                     	                                       	  		
                                     	                                       	  			/* if ( shopListForHHProfile != null && shopListForHHProfile.size()!=0 ){

                                     	                                       	  					String val = null;
                                     	                                       	  					
                                     	                                       	  					
                                     	                                       	  					
                                     	                                       	  							
                                     	                                       	  				Iterator<String> itr = shopListForHHProfile.iterator();
                                     	                                       	  				
                                     	                                       	  				

                                     	                                       	  		
                                     	                                       	  				while(itr.hasNext())
                                     	                                       	  				{
                                     	                                       	  					
                                     	                                       	  					val = itr.next();
                                     	                                       	  					
                                     	                                       	  					if(val.startsWith(shopCode))
                                     	                                       	  					{
                                     	                                       	  							
                                     	                                       	  						shopInfo = val.substring(shopCode.length());
                                     	                                       	  					}
                                     	                                       	  					
                                     	                                       	  					
                                     	                                       	  				}
                                     	                                       	  			} */
                                     	  %>









							<div class="panel panel-default">
								<div class="panel-heading">
									<div class="panel-title">
										<a href="<%=hrefVal%>" data-parent="#accordion"
											data-toggle="collapse" class="collapsed"> <%=hMPProfileVO.getShopInfo()%>
											- <%=month%> </a>
										<button class="btn btn-warning btn-xs" type="button" onclick="deleteHMProfile('<%=hMPProfileVO.getEmailId()%>','<%=hMPProfileVO.getShopCode()%>','<%=month%>','<%=occation%>','hmp');" >Delete</button>
									</div>
								</div>
								<div id="<%=id%>" class="panel-collapse collapse">
									<div class="panel-body created-profile">

										<span class="title-lable">HH Code</span> <span
											class="text-output"><%=hMPProfileVO.getHHCode()%></span> <span
											class="title-lable">Month</span> <span class="text-output">
											<%=month%> </span> <span class="title-lable">Purcahse
											occasion</span> <span class="text-output"><%=occation%></span>



										<%--   
        <span class="title-lable info-lable">Shop Name</span>
	   <span class="text-output"><%=cIPVProfileVO.getShopName()%></span>	 
	   --%>
										<span class="title-lable info-lable">Shop Code</span> <span
											class="text-output"><%=hMPProfileVO.getShopCode()%></span> <span
											class="title-lable info-lable">Shop Info</span> <span
											class="text-output"><%=shopInfo%></span>


										<div class="clear"></div>

										<%
	    
		
    	  	
	    
                   	Iterator itrProd = productList.iterator();
                                      		
                                      		while(itrProd.hasNext())
                                      		{
                                      	HMPProductWiseVO hMPProductWiseVO = (HMPProductWiseVO) itrProd.next();
                   %>
										<div class="product-set">

											<span class="title-lable">Product Catg</span> <span
												class="text-output"><%=hMPProductWiseVO.getProductCatg()%></span>

											<span class="title-lable">Sub Product</span> <span
												class="text-output"><%=hMPProductWiseVO.getSubProductCatg()%></span>

											<span class="title-lable">SKU - Item (Size/Grams)</span> <span
												class="text-output"><%=hMPProductWiseVO.getSkuitem()%></span>

											<span class="title-lable">MRP</span> <span
												class="text-output"><%=hMPProductWiseVO.getMrp()%></span> <span
												class="title-lable">Quantity</span> <span
												class="text-output"><%=hMPProductWiseVO.getQuantity()%></span>

											<span class="title-lable">Amouont</span> <span
												class="text-output"><%=hMPProductWiseVO.getAmt()%></span>

											<div class="clear"></div>

										</div>

										<%
                                      		}
      %>
									</div>
								</div>
							</div>



							<%
	}
		}
		
	}
		
		%>





							<form id="hmpForm" action="hmpservlet" method="post">

								<input type="hidden" id="emailId" name="emailId"
									value="<%=emailId%>" />

								<%
  
  if(hhProfileVo!= null)
	  
  {
   %>

								<input type="hidden" id="HHCode" name="HHCode"
									value="<%=hhProfileVo.getHHCode()%>" />

								<%

  }
	%>


								<div class="panel panel-default">
									<div class="panel-heading">
										<div class="panel-title">
											<a href="#mpnew" data-parent="#accordion"
												data-toggle="collapse" class="collapsed"> Add Monthly
												Purchase </a>
										</div>
									</div>
									<div id="mpnew" class="panel-collapse collapse in">
										<div class="panel-body">
											<span class="title-lable">HH Code</span> <span
												class="text-output">HH001</span> <span class="title-lable">Month</span>
											<div class="monthdate">
												<div class="inpu">
													<select class="form-control" required="required" id="month" name="month">
														<option value="">...select</option>
														<option value="January">January</option>
														<option value="February">February</option>
														<option value="March">March</option>
														<option value="April">April</option>
														<option value="May">May</option>
														<option value="June">June</option>
														<option value="July">July</option>
														<option value="August">August</option>
														<option value="September">September</option>
														<option value="October">October</option>
														<option value="November">November</option>
														<option value="December">December</option>
													</select>
												</div>
											</div>

											<span class="title-lable">Purcahse occasion</span>
											<div class="inpu">
												<select class="form-control" required="required" id="ocassion" name="ocassion">
													<option value="">...select</option>
													<option value="Ocassion 1">Ocassion 1</option>
													<option value="Ocassion 2">Ocassion 2</option>
													<option value="Ocassion 3">Ocassion 3</option>
													<option value="Ocassion 4">Ocassion 4</option>
													<option value="Ocassion 5">Ocassion 5</option>
													<option value="Ocassion 6">Ocassion 6</option>
												</select>
											</div>

											<span class="title-lable info-lable">Shop Name</span>
											<div class="inpu">


												<select class="form-control" required="required" id="shopinfo" name="shopinfo">

													<option value="">.. Select Shop</option>

													<%
   					if ( shopListForHHProfile != null && shopListForHHProfile.size()!=0 ){

							String val = null;
							
							
									
						Iterator<String> itr = shopListForHHProfile.iterator();

				
						while(itr.hasNext())
						{
					
							val = itr.next();
							
						
								%>

													<option value="<%=val%>">
														<%=val%>
													</option>

													<%
						
					}
				}
		%>
												</select>


											</div>

											<!--   <span class="title-lable info-lable">Shop Code</span>
	  <span class="text-output">HH001-Groc1</span>	  
	 
	  
	  <span class="title-lable info-lable">Shop Area</span>
	  <span class="text-output">Ashok nagar</span>   -->

											<div class="clear"></div>
											<div class="product-set">

												<span class="title-lable">Product Catg</span>
												<div class="inpu">
													<select class="form-control" required="required" id="productCatg1"
														name="productCatg">
														<option value="">...select</option>
													</select>
												</div>

												<span class="title-lable">Sub product Catg</span>
												<div class="inpu">
												
												<div id="subProd1">
													<select class="form-control"  id="subProductCatg1" required="required"
														name="subProductCatg">
														<option value="">...select</option>
														
													</select>
													
													</div>
													<div class="other-des" id="subProdDes1">
													<input class="form-control other-inpu"
														name="subProductCatgOthers" placeholder="Other Sub Product">
												</div>
													
													
												</div>

												<span class="title-lable">SKU - Item (Size/Grams)</span>
												<div class="inpu">
													<input class="form-control" id="skuitem" name="skuitem" required="required" />
												</div>

												<span class="title-lable">MRP</span>
												<div class="inpu">
													<input class="form-control" id="mrp" name="mrp" required="required" />
												</div>


												<span class="title-lable">Quantity</span>
												<div class="inpu">
													<input class="form-control" id="quantity" name="quantity" required="required" />
												</div>

												<span class="title-lable">Amount</span>
												<div class="inpu">
													<input class="form-control" id="amt" name="amt" required="required" />
												</div>


												<div class="clear"></div>


											</div>
											<!--    <button class="btn btn-default" type="button">+ Add Purchase</button>
	  <button class="btn btn-default" type="button">- Delete Prev </button>      
	  -->
										</div>
										<div class="form-footer">
											<button type="submit" class="btn btn-danger">Create</button>
										</div>
									</div>
								</div>

							</form>


						</div>

					</div>
				</div>

				<div class="clear"></div>



				<div class="tab-pane" id="cipv">

					<div class="customer-interview-productvisib">

						<h4>5 - Customer Interview Product Visible</h4>

						<div class="select-rp">


							<form id="cipvFormSearch" action="cipvservlet" method="post">

								<input type="hidden" id="emailId" name="emailId"
									value="<%=emailId%>" />

								<%
      	if(hhProfileVo!= null)
            	  
              {
      %>
								<input type="hidden" id="HHCode" name="HHCode"
									value="<%=hhProfileVo.getHHCode()%>" />

								<%
       	}
       %>


								<span class="title-lable info-lable">Search Respondent
									Data</span>
								<div class="inpu form-probtn">
									<select class="form-control" required="required" id="HHCodeOption"
										name="HHCodeOption">

										<option value="">.. Select IndividualCodeList</option>

										<%
     		     		 	if ( hhIndividualCodeList != null && hhIndividualCodeList.size()!=0 ){

     		     		      		     		 					String val = null;
     		     		      		     		 					
     		     		      		     		 					
     		     		      		     		 							
     		     		      		     		 				Iterator<String> itr = hhIndividualCodeList.iterator();

     		     		      		     		 		
     		     		      		     		 				while(itr.hasNext())
     		     		      		     		 				{val = itr.next();
     		     		      								
     		     		      								
     		     		      								
     		     		      								 if(hhIndividualCodeList!= null && val.startsWith(cIPVProfileVO.getHHIndividualCode()))
     		     		      								{ 
     		     		      									%>

										<option value="<%=val%>" selected>
											<%=val%>
										</option>

										<%
     		     		      								}
     		     		      								
     		     		      								else{
     		     		      									%>

										<option value="<%=val%>">
											<%=val%>
										</option>

										<%
     		     		      									
     		     		      							}}
				                  				        		                  				        		}
				                  				        %>
									</select>
									<button class="btn btn-success btn-sm" type="submit">Go</button>
								</div>


							</form>

						</div>

						<div class="clear2"></div>

						<div id="accordioncipv" class="panel-group">








							<%
                                     	  	if(cIPVProfileVO != null && cIPVProfileVO.getcIPVProductWiseVO().size() !=0 ){
                                     	                                       	  		
                                     	                                       	  		
                                     	                                       	  		
                                     	                                       	  		Iterator mapCIPVMonthList = cIPVProfileVO.getcIPVProductWiseVO().entrySet().iterator();
                                     	                                       	  		while (mapCIPVMonthList.hasNext()) {
                                     	                                       	  	Map.Entry mapEntry = (Map.Entry) mapCIPVMonthList.next();

                                     	                                       	                                  	  		 
                                     	                                       	  		 String month = (String)mapEntry.getKey();
                                     	                                       	  		 
                                     	                                       	  		
                                     	                                       	  		
                                     	                                       	  		 Map<String, List<CIPVProductWiseVO>> shopList = (Map<String, List<CIPVProductWiseVO>>) mapEntry.getValue();
                                     	                                       	  		 
                                     	                                       	  		 
                                     	                                       	  		 
                                     	                                       	  		 Iterator itrshopMap = shopList.entrySet().iterator();
                                     	                                       	  	while (itrshopMap.hasNext()) {
                                     	                                       	  		Map.Entry mapEntry1 = (Map.Entry) itrshopMap.next();
                                     	                                       	  		
                                     	                                       	  		String shopCode = (String)mapEntry1.getKey();
                                     	                                       	  		String shopInfo = null;
                                     	                                       	  		
                                     	                                       	  	 String id = cIPVProfileVO.getHHIndividualCode()+month+shopCode;
                                 	                                       	  		 
                                 	                                       	  		 id = id.trim();
                                 	                                       	  		 
                                 	                                       	  		 String hrefVal = "#"+id;
                                     	                                       	  		
                                     	                                       	  		List<CIPVProductWiseVO> productList = (List<CIPVProductWiseVO>) mapEntry1.getValue();
                                     	                                       	  		
                                     	                                       	  		
                                     	                                       	  		
                                     	                                       	  			if ( shopListForHHProfile != null && shopListForHHProfile.size()!=0 ){

                                     	                                       	  					String val = null;
                                     	                                       	  					
                                     	                                       	  					
                                     	                                       	  					
                                     	                                       	  							
                                     	                                       	  				Iterator<String> itr = shopListForHHProfile.iterator();
                                     	                                       	  				
                                     	                                       	  				

                                     	                                       	  		
                                     	                                       	  				while(itr.hasNext())
                                     	                                       	  				{
                                     	                                       	  					
                                     	                                       	  					val = itr.next();
                                     	                                       	  					
                                     	                                       	  					if(val.startsWith(shopCode))
                                     	                                       	  					{
                                     	                                       	  							
                                     	                                       	  						shopInfo = val.substring(shopCode.length());
                                     	                                       	  					}
                                     	                                       	  					
                                     	                                       	  					
                                     	                                       	  				}
                                     	                                       	  			}
                                     	  %>





							<div class="panel panel-default">
								<div class="panel-heading">
									<div class="panel-title">
										<a href="<%=hrefVal%>" data-parent="#accordioncipv"
											data-toggle="collapse" class="collapsed"> <%=cIPVProfileVO.getHHCodeOption()%>
											- <%=month%> </a>
										
										<button type="button" class="btn btn-warning btn-xs" onclick="deleteCIPVForEmailId('<%=cIPVProfileVO.getEmailId()%>','<%=cIPVProfileVO.getHHIndividualCode()%>','<%=month%>','<%=shopCode%>','cipv');" >Delete</button>
									</div>
								</div>
								<div class="panel-collapse collapse" id="<%=id%>">
									<div class="panel-body created-profile">

										<span class="title-lable">HH Code</span> <span
											class="text-output"><%=cIPVProfileVO.getHHCode()%></span> <span
											class="title-lable">Respondent Code</span> <span
											class="text-output"><%=cIPVProfileVO.getHHIndividualCode()%></span>

										<span class="title-lable">Month</span> <span
											class="text-output"> <%=month%> </span>
	
										<span class="title-lable info-lable">Shop Code</span> <span
											class="text-output"><%=shopCode%></span> <span
											class="title-lable info-lable">Shop Info</span> <span
											class="text-output"><%=shopInfo%></span>

										<div class="clear"></div>


										<%
                   	Iterator itrProd = productList.iterator();
                                      		
                                      		while(itrProd.hasNext())
                                      		{
                                      	CIPVProductWiseVO cIPVProductWiseVO = (CIPVProductWiseVO) itrProd.next();
                   %>



										<div class="product-set">

											<span class="title-lable">Product Catg</span> <span
												class="text-output"><%=cIPVProductWiseVO.getProductCatg()%></span>

											<span class="title-lable">Sub Product</span> <span
												class="text-output"><%=cIPVProductWiseVO.getSubProductCatg()%></span>

											<span class="title-lable">SKU - Item</span> <span
												class="text-output"><%=cIPVProductWiseVO.getSkuitem()%> </span>

											<span class="title-lable">MRP</span> <span
												class="text-output"><%=cIPVProductWiseVO.getMrp()%></span> <span
												class="title-lable">Quantity</span> <span
												class="text-output"><%=cIPVProductWiseVO.getQuantity()%></span>

											<span class="title-lable">Amouont</span> <span
												class="text-output"><%=cIPVProductWiseVO.getAmt()%></span> <span
												class="title-lable">Brands you have seen ads</span> <span
												class="text-output"><%=cIPVProductWiseVO.getBrandAds()%></span>

											<span class="title-lable">Brands you are aware</span> <span
												class="text-output"><%=cIPVProductWiseVO.getBrandAware()%></span>

											<span class="title-lable">Brands Visible at Outlet</span> <span
												class="text-output"><%=cIPVProductWiseVO.getBrandOutlet()%></span>

											<span class="title-lable">Brands you searched Enquired</span>
											<span class="text-output"><%=cIPVProductWiseVO.getBrandEnquired()%></span>

											<span class="title-lable">Brands you intend to buy</span> <span
												class="text-output"><%=cIPVProductWiseVO.getBrandIntendToBuy()%></span>

											<div class="clear"></div>

										</div>



										<%
		}
		
		%>


									</div>
								</div>
							</div>




							<%
	}
		}
		
	}
		
		%>







							<form id="cipvFormFull" action="cipvservlet" method="post">

								<input type="hidden" id="emailId" name="emailId"
									value="<%=emailId%>" />

								<%
  
  if(hhProfileVo!= null)
	  
  {
   %>

								<input type="hidden" id="HHCode" name="HHCode"
									value="<%=hhProfileVo.getHHCode()%>" />



								<%

  }
	%>


								<div class="panel panel-default">
									<div class="panel-heading">
										<div class="panel-title">
											<a href="#cipvnew" data-parent="#accordioncipv"
												data-toggle="collapse" class="collapsed"> Create New
												Product Visible </a>
										</div>
									</div>

									<div class="panel-collapse collapse in" id="cipvnew">
										<div class="panel-body">




											<span class="title-lable info-lable">Respondent Code</span>
											<div class="inpu">


												<select class="form-control" required="required" id="HHCodeOption"
													name="HHCodeOption">

													<option value="">.. Select IndividualCodeList</option>

													<%
   					if ( hhIndividualCodeList != null && hhIndividualCodeList.size()!=0 ){

							String val = null;
							
							
									
						Iterator<String> itr = hhIndividualCodeList.iterator();

				
						while(itr.hasNext())
						{
					
							val = itr.next();
							
				
								%>

													<option value="<%=val%>">
														<%=val%>
													</option>

													<%
					}
				}
		%>
												</select>


											</div>

											<span class="title-lable">Month</span>
											<div class="monthdate">
												<div class="inpu">
													<select class="form-control" required="required" id="month" name="month">
													<option value="">.. select</option>
														<option value="January">January</option>
														<option value="February">February</option>
														<option value="March">March</option>
														<option value="April">April</option>
														<option value="May">May</option>
														<option value="June">June</option>
														<option value="July">July</option>
														<option value="August">August</option>
														<option value="September">September</option>
														<option value="October">October</option>
														<option value="November">November</option>
														<option value="December">December</option>
													</select>
												</div>
											</div>

											<span class="title-lable info-lable">Shop Name</span>
											<div class="inpu">


												<select class="form-control" id="shopinfo" required="required" name="shopinfo">

													<option value="">.. Select Shop</option>

													<%
   					if ( shopListForHHProfile != null && shopListForHHProfile.size()!=0 ){

							String val = null;
							
							
									
						Iterator<String> itr = shopListForHHProfile.iterator();

				
						while(itr.hasNext())
						{
					
							val = itr.next();
							
						
								%>

													<option value="<%=val%>">
														<%=val%>
													</option>

													<%
						
					}
				}
		%>
												</select>


											</div>

											<!--   <span class="title-lable info-lable">Shop Code</span>
	  <span class="text-output">HH001-Groc1</span>
	  
	  <span class="title-lable info-lable">Shop Area</span>
	  <span class="text-output">Ashok nagar</span>
       -->

											<div class="clear"></div>
											<div class="product-set">

												<span class="title-lable">Product Catg</span>
												<div class="inpu">
													<select class="form-control"  required="required" id="productCatg2"
														name="productCatg">
														<option value="">...select</option>
													</select>
													
												</div>

												<span class="title-lable">Sub product Catg</span>
												<div class="inpu">
												
												<div id="subProd2">
													<select class="form-control"  id="subProductCatg2" required="required"
														name="subProductCatg">
														<option value="">...select</option>
														
													</select>
													
													
													</div>
													
													<div class="other-des" id="subProdDes2">
													<input class="form-control other-inpu"
														name="subProductCatgOthers" placeholder="Other Sub Product">
												</div>
												</div>

												<span class="title-lable">SKU - Item</span>
												<div class="inpu">
													<input class="form-control" id="skuitem" name="skuitem" required="required" />
												</div>

												<span class="title-lable">MRP</span>
												<div class="inpu">
													<input class="form-control" id="mrp" name="mrp" required="required" />
												</div>


												<span class="title-lable">Quantity</span>
												<div class="inpu">
													<input class="form-control" id="quantity" name="quantity" required="required" />
												</div>

												<span class="title-lable">Amount</span>
												<div class="inpu">
													<input class="form-control" id="amt" name="amt" required="required" />
												</div>


												<span class="title-lable">Brands you have seen ads</span>
												<div class="inpu">
													<select class="form-control" id="brandAds" required="required" name="brandAds"
														onchange="onChangeAppear('brandAds');">
														<option value="">...select</option>
														<option value="House hold care">House hold care</option>
														<option value="Personal care">Personal care</option>
														<option value="Food and beverage">Food and
															beverage</option>
														<option value="OTC">OTC</option>
														<option value="Other">Other</option>
													</select>
													<div class="other-des" id="brandAdsOtherDes">
														<input class="form-control other-inpu"
															name="brandAdsOthers" placeholder="Other">
													</div>
												</div>

												<span class="title-lable">Brands you are aware</span>
												<div class="inpu">
													<select class="form-control" id="brandAware" required="required"
														name="brandAware" onchange="onChangeAppear('brandAware');">
														<option value="">...select</option>
														<option value="House hold care">House hold care</option>
														<option value="Personal care">Personal care</option>
														<option value="Food and beverage">Food and
															beverage</option>
														<option value="OTC">OTC</option>
														<option value="Other">Other</option>
													</select>
													<div class="other-des" id="brandAwareOtherDes">
														<input class="form-control other-inpu"
															name="brandAwareOthers" placeholder="Other">
													</div>
												</div>


												<span class="title-lable">Brands Visible at Outlet</span>
												<div class="inpu">
													<select class="form-control" id="brandOutlet"
														name="brandOutlet" required="required"
														onchange="onChangeAppear('brandOutlet');">
														<option value="">...select</option>
														<option value="House hold care">House hold care</option>
														<option value="Personal care">Personal care</option>
														<option value="Food and beverage">Food and
															beverage</option>
														<option value="OTC">OTC</option>
														<option value="Other">Other</option>
													</select>
													<div class="other-des" id="brandOutletOtherDes">
														<input class="form-control other-inpu"
															name="brandOutletOthers" placeholder="Other">
													</div>
												</div>


												<span class="title-lable">Brands you searched
													Enquired</span>
												<div class="inpu">
													<select class="form-control" id="brandEnquired"
														name="brandEnquired" required="required"
														onchange="onChangeAppear('brandEnquired');">
														<option>...select</option>
														<option value="House hold care">House hold care</option>
														<option value="Personal care">Personal care</option>
														<option value="Food and beverage">Food and
															beverage</option>
														<option value="OTC">OTC</option>
														<option value="Other">Other</option>
													</select>
													<div class="other-des" id="brandEnquiredOtherDes">
														<input class="form-control other-inpu"
															name="brandEnquiredOthers" placeholder="Other">
													</div>
												</div>

												<div class="clear"></div>

												<span class="title-lable">Brands you intend to buy</span>
												<div class="inpu">
													<select class="form-control" id="brandIntendToBuy"
														name="brandIntendToBuy" required="required"
														onchange="onChangeAppear('brandIntendToBuy');">
														<option value="">...select</option>
														<option value="House hold care">House hold care</option>
														<option value="Personal care">Personal care</option>
														<option value="Food and beverage">Food and
															beverage</option>
														<option value="OTC">OTC</option>
														<option value="Other">Other</option>
													</select>
													<div class="other-des" id="brandIntendToBuyOtherDes">
														<input class="form-control other-inpu"
															name="brandIntendToBuyOthers" placeholder="Other">
													</div>
												</div>
												<div class="clear"></div>
											</div>
											<!-- <button type="button" class="btn btn-default">+ Add Product Cat</button>
	  <button type="button" class="btn btn-default">- Delete Prev Cat </button>
      -->

											<div class="clear"></div>
											<div class="form-footer">

												<button type="submit" class="btn btn-success">Save</button>
											</div>
										</div>
									</div>
								</div>


							</form>


						</div>

						<div class="clear"></div>
					</div>
				</div>



				<div class="tab-pane" id="cipb">
					<div class="customer-interview-product-boug">

						<h4>6 - Customer Interview Product Bought</h4>

						<div class="select-rp">
							<form id="cipbHead" action="cipbservlet" method="post">

								<input type="hidden" id="emailId" name="emailId"
									value="<%=emailId%>" />

								<%
  
  if(hhProfileVo!= null)
	  
  {
   %>
								<input type="hidden" id="HHCode" name="HHCode"
									value="<%=hhProfileVo.getHHCode()%>" />

								<%

  }
	%>


								<span class="title-lable info-lable">Search Respondent
									Data</span>
								<div class="inpu form-probtn">
									<select class="form-control" id="HHCodeOption" required="required"
										name="HHCodeOption">

										<option value="">.. Select IndividualCodeList</option>

										<%
   					if ( hhIndividualCodeList != null && hhIndividualCodeList.size()!=0 ){

							String val = null;
							
							
									
						Iterator<String> itr = hhIndividualCodeList.iterator();

				
						while(itr.hasNext())
						{
					
							val = itr.next();
							
							
							
							 if(hhIndividualCodeList!= null && val.startsWith(cIPBProfileVO.getHHIndividualCode()))
							{ 
								%>

										<option value="<%=val%>" selected>
											<%=val%>
										</option>

										<%
							}
							
							else{
								%>

										<option value="<%=val%>">
											<%=val%>
										</option>

										<%
								
						}

			
					}
				}
		%>
									</select>
									<button class="btn btn-success btn-sm" type="submit">Go</button>
								</div>


							</form>
						</div>
						<div class="clear2"></div>

						<div id="accordioncipb" class="panel-group">



							<%
                                     	  	if(cIPBProfileVO != null && cIPBProfileVO.getcIPBProductWiseVO().size() !=0 ){
                                     	                                       	  		
                                     	                                       	  	
                                     	                                       	  		Iterator mapCIPBMonthList = cIPBProfileVO.getcIPBProductWiseVO().entrySet().iterator();
                                     	                                       	  		while (mapCIPBMonthList.hasNext()) {
                                     	                                       	  	Map.Entry mapEntry = (Map.Entry) mapCIPBMonthList.next();

                                     	                                       	   String month = (String)mapEntry.getKey();
                                     	                                       	  		
                                     	                                       	
                                     	                                       	  	Map<String,Map<String,List<CIPBProductWiseVO>>> shopList = (Map<String,Map<String,List<CIPBProductWiseVO>>>) mapEntry.getValue();
                                     	                                       	  		 
                                     	                                       	
                                     	                                       	  		 
                                     	                                       	  		 Iterator itrshopMap = shopList.entrySet().iterator();
                                     	                                       	  	while (itrshopMap.hasNext()) {
                                     	                                       	  		Map.Entry mapEntry1 = (Map.Entry) itrshopMap.next();
                                     	                                       	  		
                                     	                                       	  		String shopCode = (String)mapEntry1.getKey();
                                     	                                       	  		String shopInfo = null;
                                     	                                       	  		
                                     	                                       	  		
                                     	                                       	  		
                                     	                                       	  		
                                     	                                       	  	Map<String,List<CIPBProductWiseVO>> occationList = (Map<String,List<CIPBProductWiseVO>>) mapEntry1.getValue();
                                     	                                       	  		
                                     	                                       	Iterator itrOccationMap = occationList.entrySet().iterator();
                                 	                                       	  	while (itrOccationMap.hasNext()) {
                                 	                                       	  		Map.Entry mapEntry2 = (Map.Entry) itrOccationMap.next();
                                 	                                       	  		
                                 	                                       	  		String occation = (String)mapEntry2.getKey();
                                 	                                       	  		
                                 	                                       	                                  	                                       	  		 
                                	                                       	  	String id = cIPBProfileVO.getHHIndividualCode()+shopCode+month+occation;
                            	                                       	  		 
                                	                                       	  	 id = id.replaceAll(" ", "");
                                	                                       	  	 
                                	                                       	  		id = id.trim();
                            	                                       	  		 
                            	                                       	  		 String hrefVal = "#"+id;
                                	                                                                     	                                       	  				
                                     	                               	  		List<CIPBProductWiseVO> productList = occationList.get(occation);
                                     	                                       	  		
                                     	                                       	  		
                                     	                                       	  		
                                     	                                       	  			if ( shopListForHHProfile != null && shopListForHHProfile.size()!=0 ){

                                     	                                       	  					String val = null;
                                     	                                       	  					
                                     	                                       	  					
                                     	                                       	  					
                                     	                                       	  							
                                     	                                       	  				Iterator<String> itr = shopListForHHProfile.iterator();
                                     	                                       	  				
                                     	                                       	  				

                                     	                                       	  		
                                     	                                       	  				while(itr.hasNext())
                                     	                                       	  				{
                                     	                                       	  					
                                     	                                       	  					val = itr.next();
                                     	                                       	  					
                                     	                                       	  					if(val.startsWith(shopCode))
                                     	                                       	  					{
                                     	                                       	  							
                                     	                                       	  						shopInfo = val.substring(shopCode.length());
                                     	                                       	  					}
                                     	                                       	  					
                                     	                                       	  					
                                     	                                       	  				}
                                     	                                       	  			}
                                     	  %>


							<div class="panel panel-default">
								<div class="panel-heading">
									<div class="panel-title">
										<a href="<%=hrefVal%>" data-parent="#accordioncipb"
											data-toggle="collapse" class="collapsed"> <%=cIPBProfileVO.getHHCodeOption()%>
											- <%=month%> </a>
										
										<button type="button" class="btn btn-warning btn-xs" onclick="deleteCIPBForEmailId('<%=cIPBProfileVO.getEmailId()%>','<%=cIPBProfileVO.getHHIndividualCode()%>','<%=month%>','<%=occation%>','<%=shopCode%>','cipb');" >Delete</button>
										
										
										
									</div>
								</div>

								<div class="panel-collapse collapse" id="<%=id%>">
									<div class="panel-body created-profile">


										<span class="title-lable">HH Code</span> <span
											class="text-output"><%=cIPBProfileVO.getHHCode()%></span> <span
											class="title-lable">Respondent Code</span> <span
											class="text-output"><%=cIPBProfileVO.getHHIndividualCode()%></span>

										<span class="title-lable">Month</span> <span
											class="text-output"> <%=month%> </span>
										<%--   
        <span class="title-lable info-lable">Shop Name</span>
	   <span class="text-output"><%=cIPVProfileVO.getShopName()%></span>	 
	   --%>
										<span class="title-lable info-lable">Shop Code</span> <span
											class="text-output"><%=shopCode%></span> <span
											class="title-lable info-lable">Shop Info</span> <span
											class="text-output"><%=shopInfo%></span> <span
											class="title-lable">Purchase Occation</span> <span
											class="text-output"><%=occation%></span>



										<%
                   	Iterator itrProd = productList.iterator();
                                      		
                                      		while(itrProd.hasNext())
                                      		{
                                      	CIPBProductWiseVO cIPBProductWiseVO = (CIPBProductWiseVO) itrProd.next();
                   %>



										<div class="clear"></div>


										<div class="product-set">

											<span class="title-lable">Product Catg</span> <span
												class="text-output"><%=cIPBProductWiseVO.getProductCatg()%></span>

											<span class="title-lable">Sub Product</span> <span
												class="text-output"><%=cIPBProductWiseVO.getSubProductCatg()%></span>

											<span class="title-lable">Brand</span> <span
												class="text-output"><%=cIPBProductWiseVO.getBrands()%></span>

											<span class="title-lable">Sub Brand</span> <span
												class="text-output"><%=cIPBProductWiseVO.getSubbrands()%></span>

											<span class="title-lable">SKU - Item</span> <span
												class="text-output"><%=cIPBProductWiseVO.getSkuitem()%></span>

											<span class="title-lable">MRP</span> <span
												class="text-output"><%=cIPBProductWiseVO.getMrp()%></span> <span
												class="title-lable">Quantity</span> <span
												class="text-output"><%=cIPBProductWiseVO.getQuantity()%></span>

											<span class="title-lable">Amouont</span> <span
												class="text-output"><%=cIPBProductWiseVO.getAmt()%></span> <span
												class="title-lable">What made you buy</span> <span
												class="text-output"><%=cIPBProductWiseVO.getMadeyoubuy()%></span>

											<span class="title-lable">Happy with the purchase ?</span> <span
												class="text-output"><%=cIPBProductWiseVO.getHappypurchase()%></span>

											<span class="title-lable">Why</span> <span
												class="text-output"><%=cIPBProductWiseVO.getWhyhappypurchase()%></span>

											<span class="title-lable">Will you repeat the purchase
												?</span> <span class="text-output"><%=cIPBProductWiseVO.getRepeatpurchase()%></span>

											<span class="title-lable">Why</span> <span
												class="text-output"><%=cIPBProductWiseVO.getWhyrepeatpurchase()%></span>

											<span class="title-lable">will you recommend ?</span> <span
												class="text-output"><%=cIPBProductWiseVO.getWillrecommend()%></span>

											<span class="title-lable">Why</span> <span
												class="text-output"><%=cIPBProductWiseVO.getWhyrecommend()%></span>

											<span class="title-lable">Brands you are aware</span> <span
												class="text-output"><%=cIPBProductWiseVO.getBrandAware()%></span>

											<span class="title-lable">Brands you have seen ads</span> <span
												class="text-output"><%=cIPBProductWiseVO.getBrandAds()%></span>

											<span class="title-lable">Brands Visible at Outlet</span> <span
												class="text-output"><%=cIPBProductWiseVO.getBrandOutlet()%></span>

											<span class="title-lable">Brands you searched Enquired</span>
											<span class="text-output"><%=cIPBProductWiseVO.getBrandEnquired()%></span>

											<div class="clear"></div>

										</div>


										<%
		}
		
		%>


									</div>
								</div>
							</div>


							<%
	}
		}
                                     	                                       	  	
}
		
	}
		
		%>


							<form id="cipbnewform" action="cipbservlet" method="post">

								<input type="hidden" id="emailId" name="emailId"
									value="<%=emailId%>" />

								<%
  
  if(hhProfileVo!= null)
	  
  {
   %>

								<input type="hidden" id="HHCode" name="HHCode"
									value="<%=hhProfileVo.getHHCode()%>" />



								<%

  }
	%>




								<div class="panel panel-default">
									<div class="panel-heading">
										<div class="panel-title">
											<a href="#cipbnew" data-parent="#accordioncipb"
												data-toggle="collapse" class="collapsed"> Create New
												Product Bought </a>
										</div>
									</div>

									<div class="panel-collapse collapse in" id="cipbnew">
										<div class="panel-body">






											<span class="title-lable info-lable">Respondent Code</span>
											<div class="inpu">


												<select class="form-control" id="HHCodeOption" required="required"
													name="HHCodeOption">

													<option value="">.. Select IndividualCodeList</option>

													<%
   					if ( hhIndividualCodeList != null && hhIndividualCodeList.size()!=0 ){

							String val = null;
							
							
									
						Iterator<String> itr = hhIndividualCodeList.iterator();

				
						while(itr.hasNext())
						{
					
							val = itr.next();
							
				
								%>

													<option value="<%=val%>">
														<%=val%>
													</option>

													<%
					}
				}
		%>
												</select>


											</div>

											<span class="title-lable">Month</span>
											<div class="monthdate">
												<div class="inpu">
													<select class="form-control" id="month" required="required" name="month">
														<option value="">...select</option>
														<option value="January">January</option>
														<option value="February">February</option>
														<option value="March">March</option>
														<option value="April">April</option>
														<option value="May">May</option>
														<option value="June">June</option>
														<option value="July">July</option>
														<option value="August">August</option>
														<option value="September">September</option>
														<option value="October">October</option>
														<option value="November">November</option>
														<option value="December">December</option>
													</select>
												</div>
											</div>

											<span class="title-lable info-lable">Shop Name</span>
											<div class="inpu">


												<select class="form-control" id="shopinfo" required="required" name="shopinfo">

													<option value="">.. Select Shop</option>

													<%
   					if ( shopListForHHProfile != null && shopListForHHProfile.size()!=0 ){

							String val = null;
							
							
									
						Iterator<String> itr = shopListForHHProfile.iterator();

				
						while(itr.hasNext())
						{
					
							val = itr.next();
							
						
								%>

													<option value="<%=val%>">
														<%=val%>
													</option>

													<%
						
					}
				}
		%>
												</select>


											</div>

											<!-- <span class="title-lable info-lable">Shop Code</span>
	  <span class="text-output">HH001-Groc1</span>
	  
	  <span class="title-lable info-lable">Shop Area</span>
	  <span class="text-output">Ashok nagar</span>
  -->
											<span class="title-lable">Purcahse occasion</span>
											<div class="inpu">
												<select class="form-control" id="ocassion" required="required" name="ocassion">
													<option value="">...select</option>
													<option value="Ocassion 1">Ocassion 1</option>
													<option value="Ocassion 2">Ocassion 2</option>
													<option value="Ocassion 3">Ocassion 3</option>
												</select>
											</div>


											<div class="clear"></div>
											<div class="product-set">

												<span class="title-lable">Product Catg</span>
												<div class="inpu">
													<select class="form-control" id="productCatg3"
														required="required" name="productCatg">
														<option value="">...select</option>
													</select>
													<div class="other-des">
														<input class="form-control other-inpu" placeholder="Other">
													</div>
												</div>

												<span class="title-lable">Sub product Catg</span>
												<div class="inpu">
												
												<div id="subProd3">
													<select class="form-control" id="subProductCatg3" required="required"
														name="subProductCatg">
														
														<option value="">...select</option>
													</select>
													
												</div>
											<div class="other-des" id="subProdDes3">
													<input class="form-control other-inpu"
														name="subProductCatgOthers" placeholder="Other Sub Product">
												</div>



												</div>

												<span class="title-lable">Brands</span>
												<div class="inpu">
													<select class="form-control" required="required" id="brands" name="brands">
														<option value="">...select</option>
														
													</select>
													
												</div>

												<span class="title-lable">Sub Brands</span>
												<div class="inpu">
													<select class="form-control" id="subbrands" required="required"
														name="subbrands">
														<option value="">...select</option>
														
													</select>
													
												</div>


												<span class="title-lable">SKU - Item</span>
												<div class="inpu">
													<input class="form-control" id="skuitem" name="skuitem" required="required" />
												</div>

												<span class="title-lable">MRP</span>
												<div class="inpu">
													<input class="form-control" id="mrp" name="mrp" required="required" />
												</div>


												<span class="title-lable">Quantity</span>
												<div class="inpu">
													<input class="form-control" id="quantity" name="quantity" required="required" />
												</div>

												<span class="title-lable">Amount</span>
												<div class="inpu">
													<input class="form-control" id="amt" name="amt" required="required" />
												</div>


												<span class="title-lable">What Made you buy</span>
												<div class="inpu">
													<input class="form-control" id="madeyoubuy"
														name="madeyoubuy" required="required" />
												</div>

												<span class="title-lable">Happy with the purchase ?</span>
												<!-- <div class="form-group inpu">
													<div class="checkbox">
														<label> <input type="checkbox"
															name="happypurchase" value="No">No </label>
													</div>
												</div> -->
												
												
												<div class="form-group inpu">
													<div>
														<div class="radio">
															<label> <input type="radio" name="happypurchase"
																value="Yes" checked="checked" /> Yes </label>
														</div>
														<div class="radio">
															<label> <input type="radio" name="happypurchase"
																value="No" /> No </label>
														</div>
													</div>
												</div>

												<span class="title-lable">Why</span>
												<div class="inpu">
													<input class="form-control" id="whyhappypurchase"
														name="whyhappypurchase" required="required" />
												</div>

												<span class="title-lable">will you repeat the
													purchase ?</span>
												<div class="form-group inpu">
													<div>
														<div class="radio">
															<label> <input type="radio" name="repeatpurchase"
																value="Yes" checked="checked" /> Yes </label>
														</div>
														<div class="radio">
															<label> <input type="radio" name="repeatpurchase"
																value="No" /> No </label>
														</div>
													</div>
												</div>

												<span class="title-lable">Why</span>
												<div class="inpu">
													<input class="form-control" id="whyrepeatpurchase"
														name="whyrepeatpurchase" required="required" />
												</div>

												<span class="title-lable">will you recommend ?</span>
												<div class="form-group inpu">
													<div>
														<div class="radio">
															<label> <input type="radio" name="willrecommend"
																value="Yes" checked="checked" /> Yes </label>
														</div>
														<div class="radio">
															<label> <input type="radio" name="willrecommend"
																value="No" /> No </label>
														</div>
													</div>
												</div>

												<span class="title-lable">Why</span>
												<div class="inpu">
													<input class="form-control" id="whyrecommend"
														name="whyrecommend" required="required" />
												</div>

												<span class="title-lable">Brands you are aware</span>
												<div class="inpu">
													<select class="form-control" id="brandAware2"
														name="brandAware" required="required"
														onchange="onChangeAppear('brandAware2');">
														<option value="">...select</option>
														<option value="House hold care">House hold care</option>
														<option value="Personal care">Personal care</option>
														<option value="Food and beverage">Food and
															beverage</option>
														<option value="OTC">OTC</option>
														<option value="Other">Other</option>
													</select>
													<div class="other-des" id="brandAware2OtherDes">
														<input class="form-control other-inpu"
															name="brandAwareOthers" placeholder="Other">
													</div>
												</div>

												<span class="title-lable">Brands you have seen ads</span>
												<div class="inpu">
													<select class="form-control" id="brandAds2" name="brandAds"
														required="required" onchange="onChangeAppear('brandAds2');">
														<option value="">...select</option>
														<option value="House hold care">House hold care</option>
														<option value="Personal care">Personal care</option>
														<option value="Food and beverage">Food and
															beverage</option>
														<option value="OTC">OTC</option>
														<option value="Other">Other</option>
													</select>
													<div class="other-des" id="brandAds2OtherDes">
														<input class="form-control other-inpu"
															name="brandAds2Others" placeholder="Other">
													</div>
												</div>

												<span class="title-lable">Brands Visible at Outlet</span>
												<div class="inpu">
													<select class="form-control" id="brandOutlet2"
														name="brandOutlet" required="required"
														onchange="onChangeAppear('brandOutlet2');">
														<option value="">...select</option>
														<option value="House hold care">House hold care</option>
														<option value="Personal care">Personal care</option>
														<option value="Food and beverage">Food and
															beverage</option>
														<option value="OTC">OTC</option>
														<option value="Other">Other</option>
													</select>
													<div class="other-des" id="brandOutlet2OtherDes">
														<input class="form-control other-inpu"
															name="brandOutlet2Others" placeholder="Other">
													</div>
												</div>


												<span class="title-lable">Brands you searched
													Enquired</span>
												<div class="inpu">
													<select class="form-control" id="brandEnquired2"
														name="brandEnquired" required="required"
														onchange="onChangeAppear('brandEnquired2');">
														<option value="">...select</option>
														<option value="House hold care">House hold care</option>
														<option value="Personal care">Personal care</option>
														<option value="Food and beverage">Food and
															beverage</option>
														<option value="OTC">OTC</option>
														<option value="Other">Other</option>
													</select>
													<div class="other-des" id="brandEnquired2OtherDes">
														<input class="form-control other-inpu"
															name="brandEnquired2Others" placeholder="Other">
													</div>
												</div>

												<div class="clear"></div>
											</div>
											<!--  <button class="btn btn-default" type="button">+ Add Product Boug</button>
	   <button class="btn btn-default" type="button">- Delete Prev Boug </button>
      -->
											<div class="clear"></div>
											<div class="form-footer">
												<!-- <button type="button" class="btn btn-danger">Save & Close</button> -->
												<button type="submit" class="btn btn-success">Save</button>
											</div>
										</div>
									</div>
								</div>



							</form>


						</div>

						<div class="clear"></div>

					</div>
				</div>

			</div>

			<%
	}
		%>



		</div>









	</div>


	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script src="js/jquery-1.9.0.min.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="js/bootstrap.min.js"></script>

	<script>
$(document).ready(function(){
	
	var activeTab = $('#activeTab').val();
	
	var value = '.nav-tabs a[href="'+activeTab+'"]';
		
	$(value).tab('show');
	
});




</script>

</body>
</html>
