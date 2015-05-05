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
<jsp:include page="navbar.jsp"></jsp:include>
<div class="container">
	<div class="page-header">
	   <h1>รายการคำถาม</h1>
	</div>
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
				<td>${question.questionType }</td>
				<td>
					<button type="button" class="btn btn-info" onclick="javascript:window.location.href='${pageContext.request.contextPath}/questions/${question.id }'">View</button>
				</td>
			</tr>
		</c:if>
		</c:forEach>
	</table>
	</div>
</div>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/bootstrap/js/bootstrap-select.js"></script>
</body>
</html>