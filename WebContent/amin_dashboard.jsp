<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta content="IE=edge" http-equiv="X-UA-Compatible">

<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">

<title>Admin</title>

<link href="css/style.css" rel="stylesheet"  />
<link href="css/bootstrap.min.css" rel="stylesheet"  />
<link href="css/bootstrap-theme.css" rel="stylesheet"  />
<link href="css/bootstrap-theme-min.css" rel="stylesheet"  />

<link href="css/theme.css" rel="stylesheet"  />




	<script src="js/Calendar/mootools-core.js" type="text/javascript"></script>
	<script src="js/Calendar/mootools-more.js" type="text/javascript"></script>
	<script src="js/Calendar/Locale.en-US.DatePicker.js" type="text/javascript"></script>
	<script src="js/Calendar/Picker.js" type="text/javascript"></script>
	<script src="js/Calendar/Picker.Attach.js" type="text/javascript"></script>
	<script src="js/Calendar/Picker.Date.js" type="text/javascript"></script>
	<link href="js/Calendar/style.css" rel="stylesheet" />
	<link href="js/Calendar/datepicker.css" rel="stylesheet">
	
	


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*"%>
<%@page import="java.util.ArrayList,java.util.List,java.util.Map,java.util.Iterator,java.util.Collections"%>
<%@page import="com.interlink.vo.UserInfoVo"%>
 <script src="js/jquery-1.9.0.min.js"></script>

<script>

$(document).ready(function() { 
    $('#stdPage').click(function() {
    	
    	
        $('#createprofile').submit();
       
       
    });
});
   
</script>


<script>

	window.addEvent('domready', function(){
		myPicker = new Picker.Date($$('#yearValue'), {
			pickOnly: 'years',
			format: '%Y'
		});
	});
</script>

<script type="text/javascript">


function exportDataValue(stdVal,hhcode){
	
	var elem = document.getElementById("HHCode");
	elem.value = hhcode;
	
	
	var res = document.getElementById("stdVal");
	res.value = stdVal;
	
	
	document.getElementById("download").submit();
	
	
}



</script>




<%

Map<String,Map<String,Map<String,List<String>>>> adminDashboardData = (Map<String,Map<String,Map<String,List<String>>>>) request.getAttribute("adminDashboardData");

List<String> listStdYear = (List<String>) request.getAttribute("listStdYear");

List<String> listHHPYear = (List<String>) request.getAttribute("listHHPYear");

List<String> listIHHPYear = (List<String>) request.getAttribute("listIHHPYear");

List<String> listShopYear = (List<String>) request.getAttribute("listShopYear");

List<String> listHMPYear = (List<String>) request.getAttribute("listHMPYear");

List<String> listCIPVYear = (List<String>) request.getAttribute("listCIPVYear");

List<String> listCIPBYear = (List<String>) request.getAttribute("listCIPBYear");

String yearValue = (String) request.getAttribute("yearValue");

	
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
          <a href="#" style="text-decoration: none" class="navbar-brand"> Interlink 2i - Profile's</a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div id="bs-example-navbar-collapse-1" class="collapse navbar-collapse">
          <ul class="nav navbar-nav">
          <li class="active"><a href="#" style="text-decoration: none">Dashboard</a></li>
          <li><a href="#" id="stdPage" style="text-decoration: none">Students</a></li>                        
          </ul>
          
          <ul class="nav navbar-nav navbar-right">
            <li><a href="#" style="text-decoration: none">Hi Admin</a></li>
            <li><a href="inter_login.jsp" style="text-decoration: none">Logout</a></li>
          </ul>
        </div><!-- /.navbar-collapse -->
      </div><!-- /.container-fluid -->
    </nav>
    





<form class="form-horizontal"  id="createprofile" action="createprofile"   method="post" >

 <%
  String emailId = request.getParameter( "emailId" );
  
  if(emailId == null)
  {
	  emailId = (String)session.getAttribute( "emailId" );
  }
  
   
   session.setAttribute( "emailId", emailId );
%>
  
  <input type="hidden" id="dashboard" name="dashboard"  value="dashboard" />
  
  <input type="hidden" id="emailId" name="emailId"  value="<%=emailId%>" />



</form>
      
      
      
      
  <form  id="download" action="downloadExcel"  method="post" >
  
  <input type="hidden" id="emailId" name="emailId"  value="<%=emailId%>" />
  
  <input type="hidden" id="HHCode" name="HHCode"  />
  
  <input type="hidden" id="stdVal" name="stdVal"  />

 </form>
      
      
  <div class="container dashboard">
  
  <div>
  <h4>Profile Details
  
  <span style="float: right;">
      
      
      <button type="button" class="btn btn-primary btn-xs" onclick="exportDataValue('Admin','All_Data');" >Export All Data</button>
      
      
      </span>
  
  
  </h4>
  
  
  <div class="table-responsive">
  
      <table class="table table-bordered table-striped">
        <thead>
          <tr>
            <th>#</th>
            <th>Student ID</th>
            <th>HH Code</th>
            <th>Resp Code	</th>
            <th>Month 1</th>
            <th>Month 2</th>
            <th>Month 3</th>
            <th>Month 4</th>
            <th>Report</th>
          </tr>
        </thead>
        <tbody>
          
          
          
          
          <%
          
          if(adminDashboardData != null && adminDashboardData.size() !=0 ){
      	  		
      	  		
      	  		
      	  		Iterator stdItr = adminDashboardData.entrySet().iterator();
      	  		int count = 0;
      	  		while (stdItr.hasNext()) {
      	  		
      	  			Map.Entry mapEntry1 = (Map.Entry) stdItr.next();
      	  		 
	      	  		 String stdVal = (String)mapEntry1.getKey();
	      	  		 
	      	  		Map<String,Map<String,List<String>>> hhcodeMap = adminDashboardData.get(stdVal);
	      	  		
	      	  		
	      	  		count = count+1;
	      	  		
	      	  	Iterator hhcodeMapItr = hhcodeMap.entrySet().iterator();
	      	  		
	      	  while (hhcodeMapItr.hasNext()) {
	      		  
	      		  
	      		Map.Entry mapEntry2 = (Map.Entry) hhcodeMapItr.next();
     	  		 
     	  		 String hhcode = (String)mapEntry2.getKey();
     	  		 
     	  		Map<String,List<String>> respCodeMap = hhcodeMap.get(hhcode);
     	  		
     	  		
     	  		
	      	  	  %>
	      	  	  
	      	  	  
	      <tr>
            <td><%=count%></td>
            <td><%=stdVal%></td>
            <td><%=hhcode%></td>
            <td class="resp-code">
            	
            	<%
            	
              	
            	Iterator respCodeMapItr = respCodeMap.entrySet().iterator();
            	
  	      	 	 while (respCodeMapItr.hasNext()) {
  	      		  
  	      		  
  	      		Map.Entry mapEntry3 = (Map.Entry) respCodeMapItr.next();
       	  		 
       	  		 String respCode = (String)mapEntry3.getKey();
       	  		 
       	  		List<String> monthList = respCodeMap.get(respCode);

            	%>

            	<div><%=respCode%></div>

                <% } %>
                
            </td>
            
            
            
            <td class="resp-code">
            	<%
            	
            	respCodeMapItr = respCodeMap.entrySet().iterator();
      	  		
  	      	 	 while (respCodeMapItr.hasNext()) {
  	      		  
  	      		  
  	      		Map.Entry mapEntry3 = (Map.Entry) respCodeMapItr.next();
       	  		 
       	  		 String respCode = (String)mapEntry3.getKey();
       	  		 
       	  		List<String> monthList = respCodeMap.get(respCode);
       	  		
       	  		if(monthList.size()!=0 && monthList.size()>0)
       	  		{
       	  		
            	%>

            	<div><span class="label label-success">Done</span></div>

                <%}else{
                	
                	%>

                	<div>-</div>

                    <%	
                }
                
       	  		} %>
                
            </td>
            
            
            <td class="resp-code">
            	<%
            	
            	respCodeMapItr = respCodeMap.entrySet().iterator();
      	  		
  	      	 	 while (respCodeMapItr.hasNext()) {
  	      		  
  	      		  
  	      		Map.Entry mapEntry3 = (Map.Entry) respCodeMapItr.next();
       	  		 
       	  		 String respCode = (String)mapEntry3.getKey();
       	  		 
       	  		List<String> monthList = respCodeMap.get(respCode);
       	  	if(monthList.size()!=0 && monthList.size()>1)
   	  		{
   	  		
        	%>

        	<div><span class="label label-success">Done</span></div>

            <%}else{
            	
            	%>

            	<div>-</div>

                <%	
            } } %>
                
            </td>
            
             <td class="resp-code">
            	<%
            	
            	respCodeMapItr = respCodeMap.entrySet().iterator();
      	  		
  	      	 	 while (respCodeMapItr.hasNext()) {
  	      		  
  	      		  
  	      		Map.Entry mapEntry3 = (Map.Entry) respCodeMapItr.next();
       	  		 
       	  		 String respCode = (String)mapEntry3.getKey();
       	  		 
       	  		List<String> monthList = respCodeMap.get(respCode);

            	if(monthList.size()!=0 && monthList.size()>2)
       	  		{
       	  		
            	%>

            	<div><span class="label label-success">Done</span></div>

                <%}else{
                	
                	%>

                	<div>-</div>

                    <%	
                } } %>
                
            </td>
            
             <td class="resp-code">
            	<%
            	
            	respCodeMapItr = respCodeMap.entrySet().iterator();
      	  		
  	      	 	 while (respCodeMapItr.hasNext()) {
  	      		  
  	      		  
  	      		Map.Entry mapEntry3 = (Map.Entry) respCodeMapItr.next();
       	  		 
       	  		 String respCode = (String)mapEntry3.getKey();
       	  		 
       	  		List<String> monthList = respCodeMap.get(respCode);

            	if(monthList.size()!=0 && monthList.size()>3)
       	  		{
       	  		
            	%>

            	<div><span class="label label-success">Done</span></div>

                <%}else{
                	
                	%>

                	<div>-</div>

                    <%	
                } } %>
                
            </td>
                        
            
            <td>
            
            <button type="button" class="btn btn-primary btn-xs" onclick="exportDataValue('<%=stdVal%>','<%=hhcode%>');" >Export</button>
            
            </td>
          </tr>
	      	  	  
	      	  	  
	      	  	  
	      	  	  
	      	  	  <%
          
	      	  }
      	  		
      	  		}
      	  		
          }
          
          
          
          %>
          
          
        </tbody>
      </table>
      
      
      
    </div>
  </div>
  
  
 <hr>
  
  <div style="width:50%;margin-bottom: 5%;">

	
	<form id="yearFormSearch" action="yearServlet" method="post">						
	<div class="col-lg-6">
    <div class="input-group">
    
      <input type="text" class="form-control" id="yearValue" name="yearValue" placeholder="Select Year" />
      <span class="input-group-btn">
        <button class="btn btn-primary" type="submit">Go!</button>
      </span>
    </div>
  </div>
	</form>						
					
					
							
  
  </div>
  
    <h4>Year - <%=yearValue%></h4>

  <div>
  
  
  <div class="table-responsive">
  
      <table class="table table-bordered table-striped">
        <thead>
          <tr>
			<th>Month</th>
            <th>Students</th>
            <th>House Holds</th>
            <th>Respondents</th>
            <th>Shop Profile</th>
            <th>Brands Visible</th>
            <th>Brands Bought</th>
            <th>Montly Purchase Bascket</th>          
          </tr>
        </thead>
        <tbody>
        
          <%
          String[] months = { "Jan", "Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec" };

  		for(int i = 0; i < months.length; i++) {
  		    String month = months[i];
  
  		    
  		    %>
  		    
  		    
  		     <tr>
            <td><%=month%></td>
            <td><%=Collections.frequency(listStdYear, month + " " + yearValue)%></td>
            <td><%=Collections.frequency(listHHPYear, month + " " + yearValue)%></td>
            <td><%=Collections.frequency(listIHHPYear, month + " " + yearValue)%></td>
            <td><%=Collections.frequency(listShopYear, month + " " + yearValue)%></td>
            <td><%=Collections.frequency(listCIPVYear, month + " " + yearValue)%></td>
            <td><%=Collections.frequency(listCIPBYear, month + " " + yearValue)%></td>
			<td><%=Collections.frequency(listHMPYear, month + " " + yearValue)%></td>
          </tr>
          
  		    <%
  		    
  		    
  		}
          
          %>
        
     
          
          
        </tbody>
      </table>
    </div>
  </div>
  
    
    </div>
    
     
    
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>

</body>
</html>
