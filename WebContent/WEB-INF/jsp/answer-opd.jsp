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
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/Font-Awesome/css/font-awesome.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/bootstrap-select.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap-timepicker.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/build.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/prettify.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/sticky-footer-navbar.css">
<style type="text/css">
.col-sm-6{border:1px dashed #ddd}
.text-underline {
	border: 0px dotted #000000;
/* 	border: 0px solid #000000; */
	border-bottom-width: 1px;
	background-color: transparent;
	outline:none;
}
</style>
<title>Neonatal Data</title>
</head>
<body>
<jsp:include page="navbar.jsp"></jsp:include>
<!-- <div class="container-fluid"> -->
<div class="container">
<div class="row">
	<div class="panel panel-danger">
	    <div class="panel-heading">
	        <h3 class="panel-title">503 Service Unavailable</h3>
	    </div>
	    <div class="panel-body">
	 	 The server is temporarily unable to handle the request.
	    </div>
	</div>
	<div class="col-sm-12 col-md-12" style="border:1px dashed #ddd">
	    <div class="row">
	        <div class="col-xs-2">
				<div class="form-group">
			   		<label for="mrn" class="control-label">HN.</label>
			       	<input type="text" class="form-control" id="mrn" placeholder="HN">
				</div>
	        </div>
	        <div class="col-xs-4">
				<div class="form-group">
			   		<label for="name" class="control-label">ชื่อ</label>
			       	<input type="text" class="form-control" id="name" placeholder="ชื่อ">
				</div>      
	        </div>
	        <div class="col-xs-4">
				<div class="form-group">
			   		<label for="visitDate" class="control-label">วันที่ตรวจ</label>
			       	<input type="text" class="form-control" id="visitDate" placeholder="วันที่ตรวจ">
				</div>      
	        </div>	  
	        <div class="col-xs-2">
				<div class="form-group">
			   		<label for="visitAge" class="control-label">อายุ</label>
			       	<input type="text" class="form-control" id="visitAge" placeholder="อายุ">
				</div>      
	        </div>	       
	        <div class="col-xs-12">
				<div class="form-group">
			   		<label class="control-label">Corrected age (mo.)</label>
			   		<div class="btn-group" data-toggle="buttons">
						<label class="btn btn-default"><input type="radio" name="correctedAge" value="1" />1</label> 
	                	<label class="btn btn-default"><input type="radio" name="correctedAge" value="2" />2</label> 
						<label class="btn btn-default"><input type="radio" name="correctedAge" value="3" />3</label> 
	                	<label class="btn btn-default"><input type="radio" name="correctedAge" value="4" />4</label> 
	                	<label class="btn btn-default"><input type="radio" name="correctedAge" value="5" />5</label> 
	                	<label class="btn btn-default"><input type="radio" name="correctedAge" value="6" />6</label>
						<label class="btn btn-default"><input type="radio" name="correctedAge" value="7" />7</label> 
	                	<label class="btn btn-default"><input type="radio" name="correctedAge" value="8" />8</label> 
						<label class="btn btn-default"><input type="radio" name="correctedAge" value="9" />9</label> 
	                	<label class="btn btn-default"><input type="radio" name="correctedAge" value="10" />10</label> 
	                	<label class="btn btn-default"><input type="radio" name="correctedAge" value="11" />11</label> 
	                	<label class="btn btn-default"><input type="radio" name="correctedAge" value="12" />12</label>
						<label class="btn btn-default"><input type="radio" name="correctedAge" value="18" />18</label> 
	                	<label class="btn btn-default"><input type="radio" name="correctedAge" value="24" />24</label> 
						<label class="btn btn-default"><input type="radio" name="correctedAge" value="30" />30</label> 
	                	<label class="btn btn-default"><input type="radio" name="correctedAge" value="36" />36</label> 	                		                	 
                	</div>
<!-- 			   		<div> -->
<!-- 			   		<ul class="pagination" style="margin: 0px !important;"> -->
<!-- 				        <li><a href="#">1</a></li> -->
<!-- 				        <li><a href="#">2</a></li> -->
<!-- 				        <li><a href="#">3</a></li> -->
<!-- 				        <li><a href="#">4</a></li> -->
<!-- 				        <li><a href="#">5</a></li> -->
<!-- 				        <li><a href="#">6</a></li> -->
<!-- 				        <li><a href="#">7</a></li> -->
<!-- 				        <li><a href="#">8</a></li> -->
<!-- 				        <li><a href="#">9</a></li> -->
<!-- 				        <li><a href="#">10</a></li> -->
<!-- 				        <li><a href="#">11</a></li> -->
<!-- 				        <li><a href="#">12</a></li> -->
<!-- 				        <li><a href="#">18</a></li> -->
<!-- 				        <li><a href="#">24</a></li> -->
<!-- 				        <li><a href="#">30</a></li> -->
<!-- 				        <li><a href="#">36</a></li> -->
<!-- 			    	</ul>	 -->
<!-- 			   		</div>	       	 -->
				</div>
	        </div>
	    </div>
	</div>   
	<c:forEach items="${questions}" var="question">
		<c:if test="${question.status == 'active'}">
			<c:choose>
				<c:when test="${question.questionType == 'textBox'}">
					<div class="col-sm-6 col-md-4">		
						<c:forEach items="${question.choices}" var="choice">
							<div class="form-group">
			            		<label for="${question.id }_${choice.id}" class="control-label">${question.questionTitle }</label>
			                	<input type="text" class="form-control" id="${question.id }_${choice.id}" placeholder="ข้อความ">
		        			</div>
						</c:forEach>				
					</div>
				</c:when>
				<c:when test="${question.questionType == 'textAreaBox'}">
					<div class="col-sm-6 col-md-4">
					<c:forEach items="${question.choices}" var="choice">	
						<div class="form-group">
		            		<label for="${question.id }_${choice.id}" class="control-label">${question.questionTitle }</label>
		                	<textarea class="form-control" id="${question.id }_${choice.id}" placeholder="ข้อความ" rows="5"></textarea>
	        			</div>
					</c:forEach>
					</div>
				</c:when>
				<c:when test="${question.questionType == 'radioBox'}">
					<div class="col-sm-6 col-md-4">
					<b>${question.questionTitle }</b> 
					<p>		
					<c:forEach items="${question.choices}" var="choice">		
					<div id="radio_${question.id }_${choice.id}" class="radio radio-inline radio-primary">                           
	                    <input type="radio" name="radio_${question.id }" id="${question.id }_${choice.id}">
	                    <label for="${question.id }_${choice.id}">
	                       (${choice.choiceNumber })&nbsp;${choice.choiceTitle }
	                    </label> 
	                    <c:if test="${choice.choiceText}">
						 <input type="text" class="text-underline">
						</c:if>
                     </div>                           
					</c:forEach>	
					</p>		
					</div>
				</c:when>
				<c:when test="${question.questionType == 'checkBox'}">
					<div class="col-sm-6 col-md-4">
					<b>${question.questionTitle }</b>
					<p>
					<c:forEach items="${question.choices}" var="choice">
						<div class="checkbox checkbox-inline checkbox-info">
						    <input type="checkbox" id="${question.id }_${choice.id}">
						    <label for="${question.id }_${choice.id}">
						        (${choice.choiceNumber })&nbsp;${choice.choiceTitle }
						    </label>
						    <c:if test="${choice.choiceText}">
						    	<input type="text" class="text-underline">
						    </c:if>
					    </div>
					    <br>
					</c:forEach>
					</p>
					</div>			
				</c:when>
				<c:otherwise>
					<div class="col-sm-6 col-md-4">				
						<div class="form-group">
						<label for="select_${question.id }_${choice.id}" class="control-label">${question.questionTitle }&nbsp;</label>
						<select class="selectpicker form-control" id="select_${question.id }_${choice.id}">
							<c:forEach items="${question.choices}" var="choice">
							 	<option value="${choice.id }">(${choice.choiceNumber })&nbsp;${choice.choiceTitle }</option>
							</c:forEach>
					  	</select>
					  	</div>		
					</div>
				</c:otherwise>
			</c:choose>
		</c:if>
	</c:forEach>
</div>
</div>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/respond.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/prettify.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/bootstrap-select.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/bootstrap/js/bootstrap-timepicker.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	$('#mrn').select();
	$('.selectpicker').selectpicker();
    $('#TOB').timepicker({
        template: false,
        showInputs: false,
        minuteStep: 5,
        showMeridian: false
    }); 
    
    $('#mrn').keypress(function(e) {
    	var mrn = $(this).val();
        if(e.which == 13) {
        	getPatientDetailByMrn(mrn);
        }
    });
});

function getPatientDetailByMrn(mrn) {
	$.ajax({
	    url: '${pageContext.request.contextPath}/patient/'+ mrn,
	    type: "GET",
	    dataType:"json",
	    contentType: "application/json",
	    cache: false,
	    success: function(patient) {
	    	$('.panel-body').text('Last Update ' + new Date());
	    	if (patient) {
	    		$('#mrn').val(mrn);
	    		$('#name').val(patient.initialName + patient.firstName + ' ' + patient.lastName);
	    		$('#DOB').val(patient.dob);
	    	}
	    	else {
	    		$('#name').val('');
	    		$('#DOB').val('');
	    	}
	    },
	    error: function(jqXHR, textStatus, errorThrown) {
	    	$('.panel-body').text(this.url + '\njqXHR status : ' + jqXHR.status + '\ntextStatus : ' + textStatus + '\nThrown : ' + errorThrown);
	    }
	});	
}
</script>
</body>
</html>