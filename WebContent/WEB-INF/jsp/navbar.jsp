<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style type="text/css">
.navbar-custom {
     color: #FFFFFF; 
     background-color: #FFFFFF; 
/*     border-color: #c0392b; */
/*     background-color: #e74c3c; */
}
</style>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-1.8.3.js"></script>
<script type="text/javascript">
if ($.browser.msie  && parseInt($.browser.version, 10) <= 7) {
	window.location.href = '${pageContext.request.contextPath}/j_spring_security_logout';
} 
</script>
<div id="menu" class="navbar navbar-default navbar-fixed-top">
<!-- <div id="menu" class="navbar navbar-default navbar-fixed-top navbar-custom"> -->
<!-- 	<div class="container"> -->
	   <div class="navbar-header">
   		<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
      	</button>
	   <a class="navbar-brand" href="${pageContext.request.contextPath}">Neonatal Data</a>
	   </div>
	   	<div>
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
			<ul class="nav navbar-nav navbar-right">
		        <li class="dropdown">
		            <a href="#" data-toggle="dropdown" class="dropdown-toggle">${not empty pageContext.request.userPrincipal ? pageContext.request.userPrincipal.name : 'ผู้ใช้งานทั่วไป'} <b class="caret"></b></a>
		            <ul class="dropdown-menu">
		                <li><a href="${pageContext.request.contextPath}/j_spring_security_logout">ออกจากระบบ</a></li>
		            </ul>
		        </li>
			</ul>
			</div>
	   	</div>
<!-- 	</div> -->
</div>