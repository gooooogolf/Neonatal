<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="author" content="Sirimongkol Panwa, RAMA">
<link rel="icon" type="image/png" sizes="96x96" href="${pageContext.request.contextPath}/resources/images/favicon-96x96.png">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap-select.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/sticky-footer-navbar.css">
<title>Neonatal Data</title>
</head>
<body>
<%-- <jsp:include page="navbar.jsp"></jsp:include> --%>
  <div class="container">    
        <div id="loginbox" style="margin-top:50px;" class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">                    
            <div class="panel panel-info" >
                    <div class="panel-heading">
                        <div class="panel-title">เข้าสู่ระบบ Neonatal Data</div>
<!--                         <div style="float:right; font-size: 80%; position: relative; top:-10px"><a href="#">Forgot password?</a></div> -->
                    </div>     

                    <div style="padding-top:30px" class="panel-body" >

                        <div style="display:none" id="login-alert" class="alert alert-danger col-sm-12"></div>
                            
                        <form id="loginform" class="form-horizontal" role="form">
                                    
                            <div style="margin-bottom: 25px" class="input-group">
                                        <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                        <input id="login-username" type="text" class="form-control" name="username" value="" placeholder="รหัสบุคคล">                                        
                                    </div>
                                
                            <div style="margin-bottom: 25px" class="input-group">
                                        <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                                        <input id="login-password" type="password" class="form-control" name="password" placeholder="รหัสผ่าน">
                                    </div>
                                    

                                
<!--                             <div class="input-group"> -->
<!--                                       <div class="checkbox"> -->
<!--                                         <label> -->
<!--                                           <input id="login-remember" type="checkbox" name="remember" value="1"> Remember me -->
<!--                                         </label> -->
<!--                                       </div> -->
<!--                                     </div> -->


                                <div style="margin-top:10px" class="form-group">
                                    <!-- Button -->

                                    <div class="col-sm-12 controls">
                                      <a id="btn-login" href="${pageContext.request.contextPath}/answer/ipd" class="btn btn-success">Login  </a>
                                      <button type="reset" class="btn btn-danger">ยกเลิก</button>
<!--                                       <a id="btn-fblogin" href="#" class="btn btn-primary">Login with Facebook</a> -->
                                    </div>
                                </div>


<!--                                 <div class="form-group"> -->
<!--                                     <div class="col-md-12 control"> -->
<!--                                         <div style="border-top: 1px solid#888; padding-top:15px; font-size:85%" > -->
<!--                                             Don't have an account!  -->
<!--                                         </div> -->
<!--                                     </div> -->
<!--                                 </div>     -->
                            </form>     



                        </div>                     
                    </div>  
        </div>
    </div>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/respond.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/bootstrap/js/bootstrap-select.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$('#login-username').select();
});
</script>
</body>
</html>