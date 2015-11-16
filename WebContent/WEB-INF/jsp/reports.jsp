<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="author" content="Sirimongkol Panwa, RAMA">
<link rel="icon" type="image/png" sizes="96x96" href="${pageContext.request.contextPath}/resources/images/favicon-96x96.png">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/Font-Awesome/css/font-awesome.css">
<%-- <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap-select.css"> --%>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/bootstrap-select.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/bootstrap/css/datepicker3.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/build.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/prettify.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/sticky-footer-navbar.css">
<title>Reports</title>
</head>
<body>
<jsp:include page="navbar.jsp"></jsp:include>
<div class="container">
<div class="panel panel-success">
    <div class="panel-heading">
        <h3 class="panel-title">กรองข้อมูล</h3>
    </div>
    <div class="panel-body">	
	<div class="col-xs-4">
	    <div class="control-group">
	        <label for="startDate" class="control-label">วันที่เริ่มต้น</label>
	        <div class="controls">
	            <div class="input-group">
	                <input id="startDate" type="text" class="date-picker form-control" value="${startDate }"/>
	                <label for="startDate" class="input-group-addon btn"><span class="glyphicon glyphicon-calendar"></span></label>
	            </div>
	        </div>
		</div>
	</div>
	<div class="col-xs-4">
		<div class="control-group">
	        <label for="endDate" class="control-label">วันที่สิ้นสุด</label>
	        <div class="controls">
	            <div class="input-group">
	                <input id="endDate" type="text" class="date-picker form-control" value="${endDate }"/>
	                <label for="endDate" class="input-group-addon btn"><span class="glyphicon glyphicon-calendar"></span>
	
	                </label>
	            </div>
	        </div>
		</div>
	</div>
	<div class="col-xs-4">
			<div class="control-group">
	        <label for="endDate" class="control-label">&nbsp;</label>
	        <div class="controls">
	            <div class="input-group">
	                <button type="button" class="btn btn-success" id="get">ดึงข้อมูล</button>
	            </div>
	        </div>
		</div>
		
	</div>
    </div>
</div>

<div class="row">
   	<div class="col-lg-12">
		<div class="panel panel-default">
	    <div class="panel-heading">การวินิจฉัยหลัก</div>
		<div class="panel-body">
			<ul>
			  	<li><p>RDS&nbsp;&nbsp;<span class="label label-default" id="RES18">0</span></p></li>
			  	<li><p>TTNB&nbsp;&nbsp;<span class="label label-default" id="RES21">0</span></p></li>
			  	<li><p>PPHN&nbsp;&nbsp;<span class="label label-default" id="CVS11">0</span></p></li>
				<li><p>BPD&nbsp;&nbsp;<span class="label label-default" id="RES06">0</span></p></li>	
				<li><p>Pneumonia&nbsp;&nbsp;<span class="label label-default" id="ID08">0</span></p></li>		
				<li><p>Pulmonary air leak&nbsp;&nbsp;<span class="label label-default" id="Pal_RES13_RES15">0</span></p></li>  
				<li><p>Pneumothorax&nbsp;&nbsp;<span class="label label-default" id="RES13">0</span></p></li>
				<li><p>PIE&nbsp;&nbsp;<span class="label label-default" id="RES15">0</span></p></li>
				<li><p>Asphyxia&nbsp;&nbsp;<span class="label label-default" id="CNS01">0</span></p></li>
				<li><p>PDA (Significant, need Rx)&nbsp;&nbsp;<span class="label label-default" id="CVS11">0</span></p></li>
				<li><p>IVH</p>
					<ul>
						<li><p>gr. I-II&nbsp;&nbsp;</p>
						<li><p>gr. III-IV&nbsp;&nbsp;<span class="label label-default" id="CNS08">0</span></p>
					</ul>
				</li>
				<li><p>PVL&nbsp;&nbsp;<span class="label label-default" id="CNS10">0</span></p></li>
				<li><p>NEC (>= stage2)&nbsp;&nbsp;<span class="label label-default" id="GI16">0</span></p></li>
				<li><p>Sepsis (proven)&nbsp;&nbsp;<span class="label label-default" id="Sepsis_ID09_ID10">0</span></p></li>
				<li><p>ROP(need Rx)&nbsp;&nbsp;<span class="label label-default" id="RSC03">0</span></p></li>
				<li><p>HIE</p>
					<ul>
						<li><p>Mild&nbsp;&nbsp;<span class="label label-default" id="HIE01">0</span></p>
						<li><p>Moderate&nbsp;&nbsp;<span class="label label-default" id="HIE02">0</span></p>
						<li><p>Severe&nbsp;&nbsp;<span class="label label-default" id="HIE03">0</span></p>
					</ul>
				</li>
			</ul>
		</div>
		</div>
	</div>
   	<div class="col-lg-12">
		<div class="panel panel-default">
		    <div class="panel-heading">กรณี BW < 1500 กรัม (Total N = ....)</div>
			<div class="panel-body">
			<ul>
				<li><p>วินิจฉัยหลัก&nbsp;&nbsp;<span class="label label-default" id="BWs">0</span></p></li>
				<li><p>เสียชีวิต&nbsp;&nbsp;<span class="label label-default" id="Deads">0</span></p></li>
			</ul>
			</div>
		</div>
	</div>

</div>
					
 	
</div>

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-ui-1.9.2.custom.js"></script>
<!--[if lt IE 9]>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/html5shiv.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/respond.js"></script>
<![endif]-->
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/prettify.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/bootstrap-select.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/bootstrap/js/bootstrap-datepicker.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/dateUtil.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	
    $('.date-picker').datepicker({
	    format: "dd/mm/yyyy", 
	    todayBtn: "linked",
	    todayHighlight: true,
	    language: "th",
	    autoclose: true
	});
    
    $('#get').click(function() {
    	resetAllData();	
    	getAnswersBetweenDate($('#startDate').val(), $('#endDate').val());
    });
    
});

var answerVars = ['RES18', 'RES21', 'CVS11', 'RES06', 'ID08', 'RES13', 'RES15', 'CNS01', 'CVS11', 'CNS08', 'CNS10', 'GI16', 'RSC03', 'HIE01', 'HIE02', 'HIE03']
var Pal_RES13_RES15 = ['RES13', 'RES15'];
var Sepsis_ID09_ID10 = ['ID09', 'ID10']
var BWs = ['BWR01', 'BWR02', 'BWR03', 'BWR04', 'BWR05'];
var Deads = ['DCT05'];

function getAnswersBetweenDate(startDate, endDate) {
	$.ajax({
	    url: '${pageContext.request.contextPath}/answer/getAnswersBetweenDate',
	    data: "startDate=" + startDate + "&endDate=" + endDate,
	    type: "GET",
	    dataType:"json",
	    contentType: "application/json",
	    cache: false,
	    success: function(answers) {        
	    	if (answers) {		       
		        for(var i = 0; i < answers.length; i++) {
			        for(var j = 0; j < answerVars.length; j++) {
			        	if (answers[i].answerVar == answerVars[j]) {
			        		$('#' + answerVars[j]).text(parseInt($('#' + answerVars[j]).text(), 10) + 1);
			        	}
			        }
			        
			        for(var j = 0; j < Pal_RES13_RES15.length; j++) {
			        	if (answers[i].answerVar == Pal_RES13_RES15[j]) {
			        		$('#Pal_RES13_RES15').text(parseInt($('#Pal_RES13_RES15').text(), 10) + 1);
			        	}
			        }
			        
			        for(var j = 0; j < Sepsis_ID09_ID10.length; j++) {
			        	if (answers[i].answerVar == Sepsis_ID09_ID10[j]) {
			        		$('#Sepsis_ID09_ID10').text(parseInt($('#Sepsis_ID09_ID10').text(), 10) + 1);
			        	}
			        }
			        
			        for(var j = 0; j < BWs.length; j++) {
			        	if (answers[i].answerVar == BWs[j]) {
			        		$('#BWs').text(parseInt($('#BWs').text(), 10) + 1);
			        	}
			        }
			        
			        for(var j = 0; j < Deads.length; j++) {
			        	if (answers[i].answerVar == Deads[j]) {
			        		$('#Deads').text(parseInt($('#Deads').text(), 10) + 1);
			        	}
			        }
		        }
	    	}
			
	    },
	    error: function(jqXHR, textStatus, errorThrown) {
	    	$('.panel-body').text(this.url + '\njqXHR status : ' + jqXHR.status + '\ntextStatus : ' + textStatus + '\nThrown : ' + errorThrown);
	    }
	});	
}

function resetAllData() {

	for(var i = 0; i < answerVars.length; i++) {
    	$('#' + answerVars[i]).text(0);
    }
    
    $('#Pal_RES13_RES15').text(0);
    
    $('#Sepsis_ID09_ID10').text(0);

    $('#BWs').text(0);

    $('#Deads').text(0);
}
</script>
</body>
</html>