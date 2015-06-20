<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
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

                       <c:if test="${error == true}">
                       	<div id="login-alert" class="alert alert-danger col-sm-12">${message } </div>
                       </c:if>
                        
                            
                        <form id="loginform" class="form-horizontal" role="form" action="${pageContext.request.contextPath}/j_spring_security_check" method="post">          
                            <div style="margin-bottom: 25px" class="input-group">
                                        <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                        <input tabindex="1" id="login-username" type="text" class="form-control" name="j_username" value="" placeholder="รหัสบุคคล">                                        
                                    </div>
                                
                            <div style="margin-bottom: 25px" class="input-group">
                                        <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                                        <input tabindex="2" id="login-password" type="password" class="form-control" name="j_password" placeholder="รหัสผ่าน">
                                    </div>

                                <div style="margin-top:10px" class="form-group">
                                    <!-- Button -->

                                    <div class="col-sm-12 controls">
                                       <button type="submit" tabindex="3" id="btn-login" class="btn btn-success">เข้าสู่ระบบ</button>
                                       <button type="reset" id="btn-reset" class="btn btn-danger">ยกเลิก</button>
<!--                                       <a id="btn-fblogin" href="#" class="btn btn-primary">Login with Facebook</a> -->
                                    </div>
                                </div>
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
$(document).ready(function() {
	$('#login-username').select();
});
</script>
</body>
</html>