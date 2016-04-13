<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta content="IE=edge" http-equiv="X-UA-Compatible">

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*"%>

<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">

<title>Form_template</title>

<link href="css/style.css" rel="stylesheet"  />
<link href="css/bootstrap.min.css" rel="stylesheet"  />
<link href="css/bootstrap-theme.css" rel="stylesheet"  />
<link href="css/bootstrap-theme-min.css" rel="stylesheet"  />
<link href="css/theme.css" rel="stylesheet"  />



<%



String loginErrorMsg = (String) request.getAttribute("loginErrorMsg");


    				
	%>


</head>

<body style="background-color:#fafafa;">

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

      </div><!-- /.container-fluid -->
    </nav>  
    
    
 
      
  <div class="container">
  
  <div class="login-container">
  
  <form class="form-horizontal"  action="login"   method="post" >
					
					
					
					<% if(loginErrorMsg!= null && loginErrorMsg.length() != 0){ %>
					
					
	<%=loginErrorMsg%>

	<%} %>
					
					
  <div class="form-group">
    <label for="inputEmail3" class="col-sm-3 control-label">Email</label>
    <div class="col-sm-8">
      <input type="email" class="form-control" id="emailId" name="emailId" placeholder="Email">
    </div>
  </div>
  <div class="form-group">
    <label for="inputPassword3" class="col-sm-3 control-label">Password</label>
    <div class="col-sm-8">
      <input type="password" class="form-control" id="password" name="password" placeholder="Password">
    </div>
  </div>
  <div class="form-group">
    <div class="col-sm-offset-3 col-sm-8">
      <div class="checkbox">
        <label>
          <input type="checkbox"> Remember me
        </label>
      </div>
    </div>
  </div>
  <div class="form-group">
    <div class="col-sm-offset-3 col-sm-8">
      <button type="submit" class="btn btn-primary">Sign in</button>
    </div>
  </div>
</form> 
  
  </div>


    </div>
    
    
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>

</body>
</html>
