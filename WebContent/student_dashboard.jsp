<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta content="IE=edge" http-equiv="X-UA-Compatible">

<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">

<title>Student_DashBoard</title>

<link href="css/style.css" rel="stylesheet"  />
<link href="css/bootstrap.min.css" rel="stylesheet"  />
<link href="css/bootstrap-theme.css" rel="stylesheet"  />
<link href="css/bootstrap-theme-min.css" rel="stylesheet"  />
<link href="css/theme.css" rel="stylesheet"  />

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*"%>
<%@page import="java.util.ArrayList,java.util.List,java.util.Map,java.util.Iterator,java.util.HashSet"%>
<%@page import="com.interlink.vo.UserInfoVo,com.interlink.vo.StudentDashboardVO"%>
 <script src="js/jquery-1.9.0.min.js"></script>


<%



Map<String, Map<String, Map<String, List<StudentDashboardVO>>>> stdDashboardData = (Map<String,Map<String,Map<String,List<StudentDashboardVO>>>>) request.getAttribute("stdDashboardData");

	
	%>

 
 <script>
 
 


 
$(document).ready(function() { 
    $('#updatePage').click(function() {
    	
    	
        $('#createForm').submit();
       
       
    });
    
    
    $('#i_submit').click( function() {
	    //check whether browser fully supports all File API
	    if (window.File && window.FileReader && window.FileList && window.Blob)
	    {
	        //get the file size and file type from file input field
	    
	        var ftype = $('#i_file')[0].files[0].type;
	        
	        var excelType = 'application/vnd.ms-excel';
	   
	        var areEqual = ftype.toUpperCase() === excelType.toUpperCase();
	        
	        if(areEqual)
	        	{
	        	
	        	$('#fileUploadForm').submit();
	        	
	        	}
	        
	        else{
	        	
	        	alert("Unsupported File Format");
	        }
	        
	        
	        
	        
	    }else{
	        alert("Please upgrade your browser, because your current browser lacks some new features we need!");
	    }
	});
    
    
});
   
</script>


<script type="text/javascript">


function valSubmit(hhcode,respCode,formId){
	
	var elem = document.getElementById("HHCode"+formId);
	elem.value = hhcode;
	
	
	var res = document.getElementById("HHCodeOption"+formId);
	res.value = respCode;
	
	
	document.getElementById(formId).submit();
	
}





</script>


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
          <li class="active"><a href="#">Dashboard</a></li>
            <li><a href="create_profile.jsp">Create Profile</a></li>          
			<li><a href="#" id="updatePage" >Update Profile</a></li>            
          </ul>
          
          <ul class="nav navbar-nav navbar-right">            
            <li><a href="inter_login.jsp">Logout</a></li>
          </ul>
        </div><!-- /.navbar-collapse -->
      </div><!-- /.container-fluid -->
    </nav>
    
    
    


        <form  id="createForm" action="createhhprofile"  method="post" >
  
  <%
  
  String emailId = request.getParameter( "emailId" );
  
  if(emailId == null)
  {
	  emailId = (String)session.getAttribute( "emailId" );
  }
  
   
   session.setAttribute( "emailId", emailId );
   
   
   
%>
  
  <input type="hidden" id="emailId" name="emailId"  value="<%=emailId%>" />
  
  
  </form>
  
  
  
 <form  id="cipvForm" action="cipvservlet"  method="post" >
  
  <input type="hidden" id="emailId" name="emailId"  value="<%=emailId%>" />
  
  <input type="hidden" id="HHCodecipvForm" name="HHCode"  />
  
  <input type="hidden" id="HHCodeOptioncipvForm" name="HHCodeOption"  />

 </form>
    
    
    
 <form  id="cipbHead" action="cipbservlet"  method="post" >
  
  <input type="hidden" id="emailId" name="emailId"  value="<%=emailId%>" />
  
  <input type="hidden" id="HHCodecipbHead" name="HHCode"  />
  
  <input type="hidden" id="HHCodeOptioncipbHead" name="HHCodeOption"  />

 </form>
      
 
 
  <form  id="SP" action="shopProfileServlet"  method="post" >
  
  <input type="hidden" id="emailId" name="emailId"  value="<%=emailId%>" />
  
  <input type="hidden" id="HHCodeSP" name="HHCodeOption"  />
  
  <input type="hidden" id="HHCodeOptionSP" name="HHCodeOptionSP"  />

 </form>
 
 
 
  <form  id="hhp" action="hmpservlet"  method="post" >
  
  <input type="hidden" id="emailIdhhp" name="emailId"  value="<%=emailId%>" />
  
  <input type="hidden" id="HHCodehhp" name="HHCode" />
  
  <input type="hidden" id="HHCodeOptionhhp" name="HHCodeOption"  />
  
 
 </form>
 
 
 
   <form  id="viewform" action="createhhprofile"  method="post" >
  
  <input type="hidden" id="emailIdview" name="emailId"  value="<%=emailId%>" />
  
 <input type="hidden" id="HHCodeviewform" name="HHCodeOption"  />
  
  <input type="hidden" id="HHCodeOptionviewform" name="HHCodeOptionSP"  />

 
 </form>
 
 
  
   <div class="container dashboard">
  
  <div>
  <h4>Profile Details
  
  
  
   <span style="float: right;">
      
      <button class="btn btn-primary btn-xs" data-toggle="modal" data-target="#myModal">Import Data</button> 
      
    </span>
  
  </h4>
  
  <div class="table-responsive">
  
  <table class="table table-bordered table-striped">
        <thead>
          <tr>    
		   <th>Sl	</th>
			<th>HH Code	</th>       
            <th>Resp Code	</th>
			<th>Resp Name	</th>
			<th>Shop</th>
            <th>Product Visible</th>
            <th>Product Bought</th>
            <th>HH Purchase</th>            
            <th>Action</th>
          </tr>
        </thead>
        <tbody>
        
        
        
		
          
          
             <%

          if(stdDashboardData != null && stdDashboardData.size() !=0 ){
      	  		
      	  		
      	  		
      	  		Iterator stdItr = stdDashboardData.entrySet().iterator();
      	  		int count = 0;
      	  		while (stdItr.hasNext()) {
      	  		
      	  			Map.Entry mapEntry1 = (Map.Entry) stdItr.next();
      	  		 
	      	  		 String stdVal = (String)mapEntry1.getKey();
	      	  		 
	      	  		Map<String,Map<String,List<StudentDashboardVO>>> hhcodeMap = stdDashboardData.get(stdVal);
	      	       	 
	      	  	  	Iterator hhcodeMapItr = hhcodeMap.entrySet().iterator();
	      	  		
	      	  while (hhcodeMapItr.hasNext()) {
	      		  
	      		count = count+1;
	      		Map.Entry mapEntry2 = (Map.Entry) hhcodeMapItr.next();
     	  		 
     	  		 String hhcode = (String)mapEntry2.getKey();
     	  		 
     	  		Map<String,List<StudentDashboardVO>> respCodeMap = hhcodeMap.get(hhcode);
   
              	Iterator respCodeMapItr = respCodeMap.entrySet().iterator();
              	

	      	  	 %>
	      	  	 <tr>
	             <td colspan="9" class="dash-head"><b><%=hhcode%> Profile</b></td>			
	           </tr>		
	      	  	
	      	  	<%	 
      	  		
  	      	 	 while (respCodeMapItr.hasNext()) {
  	      		  
  	      		  
  	      		Map.Entry mapEntry3 = (Map.Entry) respCodeMapItr.next();
       	  		 
       	  		 String respCode = (String)mapEntry3.getKey();
       	  		 
       	  		 
       	  		List<StudentDashboardVO> stdList = respCodeMap.get(respCode);
       	  		
       	  

            	%>


          
          
          <tr>
		  	<td class="resp-code">           
            	<%=count%>
            </td> 
			<td class="resp-code">           
            	<%=hhcode%>        
            </td>            
			<td>
          		<%=respCode%>           	
            </td>
            
            
            <%
            
            		
            Iterator stdListItr = stdList.iterator();
  	  		
	      	 	 while (stdListItr.hasNext()) {
	      	 		 
	      	 		StudentDashboardVO stdDashboardVO = (StudentDashboardVO)stdListItr.next();
	      	 		 
	      	 	 %>
	      	 	 
	      	 	            
			<td>
            	<%=stdDashboardVO.getIndividualName()%>          	
            </td> 
			 <td>				
			 
			 			<%if(stdDashboardVO.isShop()) { %>
			 
			 
					<span class="label label-success">Done</span> 
					
					<%}else{ %>
					
					<button type="button" class="btn btn-primary btn-xs" onclick="valSubmit('<%=hhcode%>','<%=respCode%>','SP');" ><span class="glyphicon glyphicon-plus"></span> Add</button>
				
					<%} %>
					
					
			</td>
            <td class="resp-code">
            	<div>
            	
            	<%   
            	
            	List<String> prodVisible = stdDashboardVO.getProductVisible();
            	
            	
        		HashSet<String> listToSet = new HashSet<String>(prodVisible);
        	      
        		prodVisible = new ArrayList<String>(listToSet);

				int lenPV = prodVisible.size();
				
				int countPV = 0;
        		
            	Iterator prodVisibleItr = prodVisible.iterator();
            	
            	 while (prodVisibleItr.hasNext()) {
            		 
            		 countPV = countPV +1;
            		 
            		 String val = (String)prodVisibleItr.next();
            		 
            		 if(lenPV != countPV)
            		 {
            		 
            		 %> 
            		
            		 <span class="label label-success" style="margin-right: 2%;"> <%=countPV%> </span> 
            	 
            		 <%
            	 
            		 }else{
            			 
            			 
            			 %> 
                 		
                		 <span class="label label-success" title="Last updated" style="margin-right: 2%;" > <%=val.substring(0,3)%> </span> 
                		
                		 <%
            			 
            		 }
            	 }
            	
            	
            	%>

                	<button type="button" class="btn btn-primary btn-xs" onclick="valSubmit('<%=hhcode%>','<%=respCode%>','cipvForm');" ><span class="glyphicon glyphicon-plus"></span> Add</button>
                	 
                	 
				</div> 
				          
            </td>
            <td class="resp-code">
            	<div>
            	
            	<%   
            	
            	List<String> prodBought = stdDashboardVO.getProductBought();
            	
            	
        		HashSet<String> listToSet1 = new HashSet<String>(prodBought);
        	      
        		prodBought = new ArrayList<String>(listToSet1);

				int lenPB = prodBought.size();
				
				int countPB = 0;
        		
            	Iterator prodBoughtItr = prodBought.iterator();
            	
            	 while (prodBoughtItr.hasNext()) {
            		 
            		 countPB = countPB +1;
            		 
            		 String val = (String)prodBoughtItr.next();
            		 
            		 if(lenPB != countPB)
            		 {
            		 
            		 %> 
            		
            		 <span class="label label-success" style="margin-right: 2%;"> <%=countPB%> </span> 
            	 
            		 <%
            	 
            		 }else{
            			 
            			 
            			 %> 
                 		
                		 <span class="label label-success" title="Last updated" style="margin-right: 2%;" > <%=val.substring(0,3)%> </span> 
                		
                		 <%
            			 
            		 }
            	 }
            	
            	
            	%>

                	<button type="button" class="btn btn-primary btn-xs" onclick="valSubmit('<%=hhcode%>','<%=respCode%>','cipbHead');" ><span class="glyphicon glyphicon-plus"></span> Add</button>
                	 
                	 
				</div> 
				          
            </td>
             <td class="resp-code">
            	<div>
            	
            	<%   
            	
            	List<String> listHHP = stdDashboardVO.getHHPurchase();
            	
            	
        		HashSet<String> listToSet2 = new HashSet<String>(listHHP);
        	      
        		listHHP = new ArrayList<String>(listToSet2);

				int lenHHP = listHHP.size();
				
				int countHHP = 0;
        		
            	Iterator listHHPItr = listHHP.iterator();
            	
            	 while (listHHPItr.hasNext()) {
            		 
            		 countHHP = countHHP +1;
            		 
            		 String val = (String)listHHPItr.next();
            		 
            		 if(lenHHP != countHHP)
            		 {
            		 
            		 %> 
            		
            		 <span class="label label-success" style="margin-right: 2%;"> <%=countHHP%> </span> 
            	 
            		 <%
            	 
            		 }else{
            			 
            			 
            			 %> 
                 		
                		 <span class="label label-success" title="Last updated" style="margin-right: 2%;" > <%=val.substring(0,3)%> </span> 
                		
                		 <%
            			 
            		 }
            	 }
            	
            	
            	%>

                	<button type="button" class="btn btn-primary btn-xs" onclick="valSubmit('<%=hhcode%>','<%=respCode%>','hhp');" ><span class="glyphicon glyphicon-plus"></span> Add</button>
                	 
                	 
				</div> 
				          
            </td>            
            <td>
            
				<button type="button" class="btn btn-primary btn-xs" onclick="valSubmit('<%=hhcode%>','<%=respCode%>','viewform');" >View</button>
			</td>
          </tr>  
          
          
          
          
          
          
          
          
                	  	  <%
	      	 	 }
                	  	  
  	      	 	 }
          
	      	  }
      	  		
      	  		}
      	  		
          }
          
          
          
          %>
          
          
          
          
          
          
          
          
		  
		  
        </tbody>
		
	
		
      </table>
	  


    </div>
  </div>
    
    </div>
	
    <form class="form-horizontal" id="fileUploadForm" action="fileUploadServlet" method="post"
                        enctype="multipart/form-data">
  
      <div class="modal fade create-student" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header alert-success">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h5 class="modal-title" id="myModalLabel">Import Data From Excel</h5>
      </div>
      <div class="modal-body">
     
            
        <input type="hidden" name="emailId" value="<%=emailId%>" >
        
        
  <div class="form-group">
    <label class="col-sm-4 control-label">Select File to Upload : </label>
    <div class="col-sm-8">
       <input type="file" id="i_file" name="file"  class="form-control" placeholder="Browse File" required />
    </div>
   
  </div>



  <div class="modal-footer">      
  
  	<span style="float:left; text-decoration:underline;"><a href="Sample_Import_Format.xls">Download Import File Template File</a></span>
  
        <button type="button" class="btn btn-default btn-sm" data-dismiss="modal">Cancel</button>        
        <button type="button" id="i_submit" class="btn btn-primary btn-sm" >Upload</button>
        
        

      </div>
  

        
      </div>
     
    </div>
  </div>
</div>

    </form>
    

    
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>

</body>
</html>
