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
<style type="text/css">
.col-sm-6{border:1px dashed #ddd}
</style>
<title>Neonatal Data</title>
</head>
<body>
<jsp:include page="navbar.jsp"></jsp:include>
<!-- <div class="container-fluid"> -->
<div class="container">
<div class="row">
	<c:forEach items="${questions}" var="question">
		<c:if test="${question.status == 'active'}">
			<c:choose>
				<c:when test="${question.questionType == 'textBox'}">
					<div class="col-sm-6 col-md-4 bg-success">
					<h4>${question.questionTitle }</h4>
					<p><input class="form-control" name="${question.id }" id="${question.id }" placeholder="ข้อความ"/></p>
					</div>
				</c:when>
				<c:when test="${question.questionType == 'textAreaBox'}">
					<div class="col-sm-6 col-md-4">
					<h4>${question.questionTitle }</h4>
					<p><textarea class="form-control" name="${question.id }" id="${question.id }"  rows="5" placeholder="ข้อความ"></textarea></p>
					</div>
				</c:when>
				<c:when test="${question.questionType == 'radioBox'}">
					<div class="col-sm-6 col-md-4 bg-warning">
					<h4>${question.questionTitle }</h4> 
							<p>
								<c:forEach items="${question.choices}" var="choice">
									<label><input type="radio" id="${choice.id }" name="${question.id}">(${choice.choiceNumber })&nbsp;${choice.choiceTitle }</label><br>
								</c:forEach>
							</p>
					</div>
				</c:when>
				<c:when test="${question.questionType == 'checkBox'}">
					<div class="col-sm-6 col-md-4">
							<h4>${question.questionTitle }</h4>
							<p>
								<c:forEach items="${question.choices}" var="choice">
									<label><input type="checkbox" id="${choice.id }">(${choice.choiceNumber })&nbsp;${choice.choiceTitle }</label>
								</c:forEach>
							</p>
					</div>			
				</c:when>
				<c:otherwise>
<!-- 				selectBox -->
					<div class="col-sm-6 col-md-4 bg-info">
					<h4>${question.questionTitle }</h4>
								<p>
								<select class="selectpicker" id="${question.id }">
									<c:forEach items="${question.choices}" var="choice">
									 	<option value="${choice.id }">(${choice.choiceNumber })&nbsp;${choice.choiceTitle }</option>
									</c:forEach>
							  	</select>
							  	</p>
					</div>
				</c:otherwise>
			</c:choose>
		</c:if>
	</c:forEach>
</div>
</div>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/bootstrap/js/bootstrap-select.js"></script>
</body>
</html>