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

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*"%>
<%@page import="java.util.ArrayList,java.util.List,java.util.Iterator"%>
<%@page import="com.interlink.vo.UserInfoVo"%>
<script src="js/jquery-1.9.0.min.js"></script>

<script>
function deleteProfile(userId){
	
	var msg = confirm("Are you sure you want to delete this user?");
	
	if (msg) {
		
		$('#deleteField').val(userId);
	   	
    	$('#form1').submit();
    }

}




$(document).ready(function() { 
    $('#dashboardPage').click(function() {
    	
        $('#adminDashboard').submit();
       
       
    });
});



</script>


<%



List<UserInfoVo>  listUserInfo = (List<UserInfoVo>) request.getAttribute("listUserInfo");

	
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
          <li><a href="#" id="dashboardPage" >Dashboard</a></li>
          <li class="active"><a href="#">Students</a></li>                               
          </ul>
          
          <ul class="nav navbar-nav navbar-right">
            <li><a href="#">Hi Admin</a></li>
            <li><a href="inter_login.jsp">Logout</a></li>
          </ul>
        </div><!-- /.navbar-collapse -->
      </div><!-- /.container-fluid -->
    </nav>
    
    
    
  <form class="form-horizontal"  id="adminDashboard" action="adminDashboard"   method="post" >

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

      
      
  <div class="container students">
  
   <button class="btn btn-primary" data-toggle="modal" data-target="#myModal">Create Student Profile</button> 
   
   
  <div>
  <h4>Student Details</h4>
  
  
  <form action="deleteprofile" method="post" id="form1">
  
  <input type="hidden" id="deleteField" name="deleteField"  value="" />
  
  <div class="table-responsive">
  
      <table class="table table-bordered table-striped">
        <thead>
          <tr>
            <th>#</th>
            <th>Student ID</th>
            <th>Student Name</th>
            <th>College Name</th>
            <th>College Address</th>
            <th>City</th>
            <th>Created Date</th>
            <th>No of Profiles Created</th>
            <th>Actions</th>            
          </tr>
        </thead>
        <tbody>
        
        <%
					if ( listUserInfo != null && listUserInfo.size()!=0 ){

							
						UserInfoVo userInfoVo = new UserInfoVo();
				
						Iterator<UserInfoVo> itr = listUserInfo.iterator();

						int count = 0;
				
						while(itr.hasNext())
						{
					
							userInfoVo = itr.next();
					
count = count+1;

		%>
        
			        <tr>
			            <td><%=count%></td>
			            <td><%=userInfoVo.getUserId()%></td>
			            <td><%=userInfoVo.getName()%></td>
			            <td><%=userInfoVo.getCollegeName()%></td>
			            <td><%=userInfoVo.getCollegeAddr()%></td>
			            <td><%=userInfoVo.getCity()%></td>
			            <td><%=userInfoVo.getCreatedDate()%></td>
			            <td><%=userInfoVo.getNoOfProfile()%></td>
			            <td>
			            	
			            	<!-- <button class="btn btn-default btn-xs" data-toggle="modal" data-target="#myModal">Edit</button> -->
			            	<button class="btn btn-default btn-xs" onclick="deleteProfile('<%=userInfoVo.getEmailId()%>');">Delete</button>               
			            </td>            
			          </tr>
        
        <%
					}
				}
		%>
		
           
        </tbody>
      </table>
    </div>
    
    </form>
  </div>
   
  
 


    </div>
    
    <div class="modal fade create-student" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h5 class="modal-title" id="myModalLabel">Create Student Profile</h5>
      </div>
      <div class="modal-body">
        
        <form class="form-horizontal"  action="createprofile"   method="post" >
        
        <input type="hidden" id="dashboard" name="dashboard"  value="create_profile" />
        
  <div class="form-group">
    <label class="col-sm-2 control-label">Name</label>
    <div class="col-sm-10">
       <input type="text" id="name" name="name"  class="form-control" placeholder="Text input" required />
    </div>
   
  </div>
  <div class="form-group">
    <label class="col-sm-2 control-label">College</label>
     <div class="col-sm-10">
       <input type="text" class="form-control" id="collegeName" name="collegeName" placeholder="Text input" required />
    </div>
  </div>
  <div class="form-group">
    <label class="col-sm-2 control-label">Address</label>
     <div class="col-sm-10">
       <textarea class="form-control" id="collegeAddr" name=collegeAddr rows="3" required></textarea>
    </div>
   
  </div>
  
   <div class="form-group">
    <label class="col-sm-2 control-label">City</label>
     <div class="col-sm-10">
       <input type="text" class="form-control" id="city" name="city" placeholder="Text input" required />
    </div>
  </div>

  <div class="form-group">
    <label for="inputEmail3" class="col-sm-2 control-label">Email ID</label>
    <div class="col-sm-10">
      <input type="email" class="form-control" name="emailId" id="emailId" placeholder="Email" required />
    </div>
  </div>
  <div class="form-group">
    <label for="inputPassword3" class="col-sm-2 control-label">Password</label>
    <div class="col-sm-10">
      <input type="password" class="form-control" name="password" id="password" placeholder="Password" required />
    </div>
  </div>
  
  
   <div class="modal-footer">      
        <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>        
        <button type="submit" class="btn btn-primary" >Create</button>
      </div>
  
</form>
        
      </div>
     
    </div>
  </div>
</div>
    
    
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>

</body>
</html>
