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
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/sb-admin-2.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/bootstrap-select.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/Font-Awesome/css/font-awesome.css">
<title>Neonatal Data</title>
</head>
<body>
<div id="wrapper">
<div class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
	   <div class="navbar-header">
   		<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
   		    <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
      	</button>
	   <a class="navbar-brand" href="${pageContext.request.contextPath}">Neonatal Data</a>
	   </div>
		<div id="navbar" class="collapse navbar-collapse">
		<ul class="nav navbar-nav">
			<li><a href="${pageContext.request.contextPath}/questions">จัดการข้อมูล </a></li>
			<li class="dropdown">
	            <a href="#" data-toggle="dropdown" class="dropdown-toggle">บันทึกข้อมูล <b class="caret"></b></a>
	            <ul class="dropdown-menu">
	                <li><a href="${pageContext.request.contextPath}/answer/ipd">IPD</a></li>
	                <li><a href="${pageContext.request.contextPath}/answer/opd">OPD</a></li>
	            </ul>
		    </li>
		    <li><a href="${pageContext.request.contextPath}/report">รายงาน</a></li>
		</ul>
		<ul class="nav navbar-top-links navbar-right">
	        <li class="dropdown">
	            <a href="#" data-toggle="dropdown" class="dropdown-toggle">${not empty pageContext.request.userPrincipal ? pageContext.request.userPrincipal.name : 'ผู้ใช้งานทั่วไป'} <b class="caret"></b></a>
	            <ul class="dropdown-menu">
	                <li><a href="${pageContext.request.contextPath}/j_spring_security_logout">ออกจากระบบ</a></li>
	            </ul>
	        </li>
		</ul>
		<div class="navbar-default sidebar" role="navigation">
			<div class="sidebar-nav navbar-collapse">
			    <ul class="nav" id="side-menu">
			    	<li><a href="${pageContext.request.contextPath}/questions" class="active">รายการคำถาม</a></li>
					<li><a href="${pageContext.request.contextPath}/questions/new">สร้างแบบสอบถาม <span class="sr-only">(current)</span></a></li>					
				</ul>
			</div>
		</div>
		</div>
</div>
<div id="page-wrapper">
	<div class="row">
		<div class="col-lg-12"><h3 class="page-header">รายการคำถาม</h3></div>
	</div>
	<div class="row">
   		<div class="col-lg-12">
   			<div class="table-responsive">
			<table class="table table-hover">
				<thead>
				<tr>
					<th>รูปแบบ</th>
					<th>ลำดับ</th>
					<th>หัวข้อคำถาม</th>
					<th>ข้อความช่วยเหลือ</th>
					<th>ประเภทคำถาม</th>
					<th></th>
				</tr>
				</thead>
				<c:forEach items="${questions}" var="question">
				<c:if test="${question.status == 'active'}">
					<tr>
						<td>${question.workgroup }</td>
						<td>${question.questionNumber }</td>
						<td>${question.questionTitle }</td>
						<td>${question.helpText }</td>
						<td>${questionTypeMap[question.questionType] }</td>
						<td>
							<button type="button" class="btn btn-info" onclick="javascript:window.location.href='${pageContext.request.contextPath}/questions/${question.id }'">View</button>
						</td>
					</tr>
				</c:if>
				</c:forEach>
			</table>
			</div>
   		</div>
 	</div>
</div>
</div>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-1.8.3.js"></script>
<!--[if lt IE 9]>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/html5shiv.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/respond.js"></script>
<![endif]-->
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/bootstrap-select.js"></script>
<script type="text/javascript">
if ($.browser.msie  && parseInt($.browser.version, 10) <= 7) {
	window.location.href = '${pageContext.request.contextPath}/j_spring_security_logout';
} 
</script>
</body>
</html>