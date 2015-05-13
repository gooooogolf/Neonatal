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
	   <h1>GROUP</h1>
	</div>
	<form class="form-inline" action="javascript:void(0)">
	    <div class="form-group">
	        <label class="sr-only" for="sequence">sequence</label>
	        <input type="text" class="form-control" id="sequence" placeholder="ลำดับที่" style="width: 70px;">
	    </div>
	    <div class="form-group">
	        <label class="sr-only" for="groupName">groupName</label>
	        <input type="text" class="form-control" id="groupName" placeholder="ชื่อกรุ๊ป" style="width: 200px;">
	    </div>
	    <div class="form-group">
	        <label class="sr-only" for="groupTitle">Title</label>
	        <input type="text" class="form-control" id="groupTitle" placeholder="Title" style="width: 400px;">
	    </div>
	    <button type="submit" class="btn btn-primary">เพิ่ม</button>
	    <button type="reset" class="btn btn-danger">รีเซ็ท</button>
	</form>
	<div class="table-responsive">
	<table class="table table-hover">
		<thead>
		<tr>
			<th>ลำดับ</th>
			<th>ชื่อกรุ๊ป</th>
			<th>Title</th>
			<th></th>
		</tr>
		</thead>
		<c:forEach items="${groups}" var="group">
		<c:if test="${group.status == 'active'}">
			<tr>
				<td>${group.sequence }</td>
				<td>${group.groupName }</td>
				<td>${group.groupTitle }</td>
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
<script type="text/javascript">
$(document).ready(function() {
	
	//ajax
	$.ajax({
	    url: '${pageContext.request.contextPath}/group/save',
	    data: JSON.stringify(question),
	    type: "POST",
	    dataType:"json",
	    contentType: "application/json",
	    cache: false,
	    success: function(retQuestion) {
//		    	window.location = '${pageContext.request.contextPath}/questions/' + retQuestion.id;
	    	window.location = '${pageContext.request.contextPath}/questions';
	    },
	    error: function(jqXHR, textStatus, errorThrown) {
	    	alert(this.url + '\njqXHR status : ' + jqXHR.status + '\ntextStatus : ' + textStatus + '\nThrown : ' + errorThrown);
	    }
	});	
	
});
</script>
</body>
</html>