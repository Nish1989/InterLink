<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta content="IE=edge" http-equiv="X-UA-Compatible">

<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">

<title>Form_template</title>

<link href="css/style.css" rel="stylesheet"  />
<link href="css/bootstrap.min.css" rel="stylesheet"  />
<link href="css/bootstrap-theme.css" rel="stylesheet"  />
<link href="css/bootstrap-theme-min.css" rel="stylesheet"  />
<link href="css/theme.css" rel="stylesheet"  />


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*"%>
<%@page import="java.util.ArrayList,java.util.List,java.util.Iterator"%>
<%@page import="com.interlink.vo.UserInfoVo"%>
 <script src="js/jquery-1.9.0.min.js"></script>


<script>
	
	$(document).ready(function() {
	$('#myTab a').click(function (e) {
 		 e.preventDefault();
 		 $(this).tab('show');
		});
		
	
	});


</script>	

<script>

function showPosition(position) {
	
	
	$('#googleLocation').val("Latitude: " + position.coords.latitude + 
		    " - Longitude: " + position.coords.longitude);

}

$(document).ready(function() { 
	
	
	
	  if (navigator.geolocation) {
	        navigator.geolocation.getCurrentPosition(showPosition);
	    } else { 
	    	
	    	$('#googleLocation').val("Geolocation is not supported by this browser.");
	    	
	    	
	        
	    }
	
	
	
	
    $('#updatePage').click(function() {
    	
    	
        $('#createForm').submit();
       
       
    });
    
  
    
$('#stdDashboardPage').click(function() {
    	
        $('#stdDashboard').submit();
       
       
    });
    
        
    
});




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
<script>
  $(function () {
    $('#myTab a:last').tab('show')
  })
</script>


<%

UserInfoVo userInfoVo  = (UserInfoVo) request.getAttribute("userInfoVo");
	
	%>

</head>

<body>
    
    <nav role="navigation" class="navbar navbar-inverse header">
      <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
          <button data-target="#bs-example-navbar-collapse-1" data-toggle="collapse" class="navbar-toggle" type="button">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
		  <span class="logo"> </span>
          <a href="#" class="navbar-brand"> Interlink 2i - Profile's</a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div id="bs-example-navbar-collapse-1" class="collapse navbar-collapse">
          <ul class="nav navbar-nav">
          <li><a href="#" id="stdDashboardPage" >Dashboard</a></li>
            <li class="active"><a href="create_profile.jsp">Create Profile</a></li>
            <li><a href="#" id="updatePage" >Update Profile</a></li>            
          </ul>
          
          <ul class="nav navbar-nav navbar-right">           
            <li><a href="inter_login.jsp">Logout</a></li>
          </ul>
        </div><!-- /.navbar-collapse -->
      </div><!-- /.container-fluid -->
    </nav>
    
  <%
  
  String emailId = request.getParameter( "emailId" );
  
  if(emailId == null)
  {
	  emailId = (String)session.getAttribute( "emailId" );
  }
  
   
   session.setAttribute( "emailId", emailId );
%>
  
    
    <form class="form-horizontal"  id="stdDashboard" action="stdDashboard"   method="post" >

  <input type="hidden" id="emailId" name="emailId"  value="<%=emailId%>" />

</form>

      
      
  <div class="container">
  
  
  <div class="form-structure">
  <!-- Nav tabs -->


  <form  id="createForm" action="createhhprofile"  method="post" >
  

  <%-- <input type="hidden" id="userId" name="userId"  value="<%=userInfoVo.getUserId()%>" /> --%>
  
  <input type="hidden" id="emailId" name="emailId"  value="<%=emailId%>" />
  
  
  
  <div class="household-profile">
  	<h4>1 - Household Profile</h4>
 	 <span class="title-lable">Area</span>
      <div class="inpu">
     		<input class="form-control" id="area" name="area" required="required" />      
      </div>
      
      <span class="title-lable">Google Co-ordinate</span>
      <div class="inpu">
     		<input class="form-control" id="googleLocation" name="googleLocation" required="required" />     
      </div>
            
      <span class="title-lable">Type of household</span>
      <div class="inpu">
     		<select class="form-control" name="hhType" id="hhType" required="required" onchange= "onChangeAppear('hhType');" >
            	<option value="">...select</option>                  
                  <option value="Appartment">Appartment</option>
                  <option value="Individual">Individual</option>
                  <option value="Chawl">Chawl</option>
                  <option value="Chawl">Chawl</option>
                  <option value="Other">Other</option>
			</select>
        	<div class="other-des" id="hhTypeOtherDes" > 
            <input class="form-control other-inpu" name="hhTypeOthers" placeholder="Other Type of household" >  
            </div>      
     	 </div>
      
      
       			<span class="title-lable">Vehicle Type</span>
     				 <div class="inpu">
                    <select class="form-control" name="vehicleType" id="vehicleType" required="required" onchange= "onChangeAppear('vehicleType');">
                         <option value="">...select</option>                
                          <option value="2 Wheeler">2 Wheeler</option>
                          <option value="4 Wheeler">4 Wheeler</option>                  
                          <option value="Other">Other</option>
                    </select>  
                     <div class="other-des" id="vehicleTypeOtherDes"> 
                    <input class="form-control other-inpu" name="vehicleTypeOthers" placeholder="Other Vehicle">  
                    </div>     
      </div>
      
       			 <span class="title-lable">Vehical Brand</span>
                      <div class="inpu">
                            <input class="form-control" id="vehicleBrand" name="vehicleBrand" required="required" />    
                      </div>
                      
                 <span class="title-lable">Cable/Dish connection </span>
      				<div class="inpu">
                        <select class="form-control" name="cableConnection" required="required" id="cableConnection" onchange= "onChangeAppear('cableConnection');"> 
                        	<option value="">...select</option> 
                          <option value="Airtel">Airtel</option>
                          <option value="Reliance">Reliance</option>  
                          <option value="Tata">Tata</option> 
                          <option value="BSNL">BSNL</option> 
                          <option value="SunDTH">SunDTH</option>  
                          <option value="VideoconD2H">VideoconD2H</option> 
                          <option value="ApnaDTH">ApnaDTH</option>               
                          <option value="Other">Other</option>
                        </select>  
                         <div class="other-des" id="cableConnectionOtherDes">  
                        <input class="form-control other-inpu" name="cableConnectionOthers" placeholder="Other Cable Connection">  
                        </div>     
     				 </div>
                     
                       				
                    
                <span class="title-lable"  >Net connection </span>
     				<div class="inpu">
     					<select class="form-control" name="netConnection" id="netConnection" required="required" onchange= "onChangeAppear('netConnection');">   
                        	 <option value="">...select</option>               
                              <option value="Wifi">Wireless (Wifi)</option>
                              <option value="Broadband">Cable/Broadband</option>  
                              <option value="DC">Data Card</option> 
                              <option value="LeasedLine">Leased Line</option>                                             
                              <option value="Other">Other</option>
						</select>  
                         <div class="other-des" id="netConnectionOtherDes"> 
                        <input class="form-control other-inpu" name="netConnectionOthers" placeholder="Other Net Connection">  
                        </div>     
      				</div>
      

        
      
      <div class="clear"></div>  
        <div class="form-footer">
           <!-- <button type="button" class="btn btn-danger">Save & Close</button> -->
           <button type="submit" class="btn btn-success">Save & Next</button>
    </div>
 
    </div>
    
  <div class="clear"></div>  
  
    
  </form>
  
  </div>
  
  
    
  
   
  
 


    </div>
    
    
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
   
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>

</body>
</html>
