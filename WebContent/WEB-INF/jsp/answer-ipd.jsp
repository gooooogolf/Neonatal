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
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap-select.min.css">
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
/* .selectpicker {} */
</style>
<title>Neonatal Data</title>
</head>
<body>
<jsp:include page="navbar.jsp"></jsp:include>
<!-- <div class="container-fluid"> -->
<div class="container">
<!-- <form> -->
<div class="row">
	<div class="panel panel-success">
	    <div class="panel-heading">
	        <h3 class="panel-title">บันทึกข้อมูลอัตโนมัติ</h3>
	    </div>
	    <div class="panel-body">
	 	 The server successfully processed the request.
	    </div>
	</div>
	<div class="col-sm-6 col-md-4">
	    <div class="row">
	        <div class="col-xs-4">
				<div class="form-group">
			   		<label for="mrn" class="control-label">HN</label>
			       	<input type="text" class="form-control" id="mrn" placeholder="HN">
				</div>
	        </div>
	        <div class="col-xs-8">
				<div class="form-group">
			   		<label for="name" class="control-label">Name</label>
			       	<input type="text" class="form-control" id="name" placeholder="Name">
				</div>      
	        </div>
<!-- 	        <div class="col-xs-12"> -->
<!-- 				<div class="form-group"> -->
<!-- 			   		<label for="name" class="control-label">Name</label> -->
<!-- 			       	<input type="text" class="form-control" id="name" placeholder="Name"> -->
<!-- 				</div> -->
<!-- 	        </div> -->
	    </div>
	</div> 
	<div class="col-sm-6 col-md-4">
	    <div class="row">
	        <div class="col-xs-6">
	       		<div class="form-group">
			   		<label for="DOB" class="control-label">DOB</label>
			       	<input type="text" class="form-control" id="DOB" placeholder="DOB">
				</div>        
	        </div>
	     	<div class="col-xs-6">
				<div class="form-group">
			   		<label for="TOB" class="control-label">Time of birth</label>
			       	<input type="text" class="form-control" id="TOB" placeholder="Time of birth">
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
	                    <input type="radio" name="radio_${question.id }" id="${question.id }_${choice.id}" value="${choice.choiceTitle }">
	                    <label for="${question.id }_${choice.id}">
	                       (${choice.choiceNumber })&nbsp;${choice.choiceTitle }
	                    </label> 
	                    <c:if test="${choice.choiceText}">
						 	<input type="text" id="choiceText_${question.id }_${choice.id}" class="text-underline">
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
							<input type="checkbox" id="${question.id }_${choice.id}" value="${choice.choiceTitle }">					    
						    <label for="${question.id }_${choice.id}">
						        (${choice.choiceNumber })&nbsp;${choice.choiceTitle }
						    </label>
						    <c:if test="${choice.choiceText}">
								<input type="text" id="choiceText_${question.id }_${choice.id}" class="text-underline">
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
						<label for="select_${question.id }" class="control-label">${question.questionTitle }&nbsp;</label>
						<select class="selectpicker form-control" id="select_${question.id }">
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
<button type="button" class="btn btn-success" id="get">ดึงข้อมูล</button>&nbsp;&nbsp;<button type="submit" class="btn btn-primary" id="submit">บันทึก</button>
<!-- </form> -->
</div>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/dateUtil.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/prettify.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/bootstrap/js/bootstrap-select.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/bootstrap/js/bootstrap-timepicker.js"></script>
<script type="text/javascript">
var __staffId = 'Test';
$(document).ready(function() {
	
    $('#TOB').timepicker({
        template: false,
        showInputs: false,
        minuteStep: 5
    });    
    
    $('#submit').click(autoSave);
    $('#get').click(function() {
    	getAnswers($('#mrn').val(), 'IPD');    	
    });
    $('#mrn').keypress(function(e) {
    	var mrn = $(this).val();
        if(e.which == 13) {
        	getAnswers(mrn, 'IPD');
        }
    });
});

function autoSave() {
	var mrn = $('#mrn').val();
	var answers = [];
	var questions = JSON.parse('${JSONArray_questions}');
	if (mrn) {
		if (questions) {
			for (var i = 0; i < questions.length; i++) {
				var question = questions[i];
				if (question.status == 'active') {
					var choices = question.choices;
					if (question.questionType == 'textBox' || question.questionType == 'textAreaBox') {
						if (choices) {
							for (var j = 0; j < choices.length; j++) {
								var choice = choices[j] ;
								var answer = {}; 
								var isAnswer = $('#' + question.id + '_' + choice.id).val();
								if (isAnswer) {
									answer.staffId = __staffId;
									answer.workgroup = 'IPD';
									answer.mrn = mrn;
									answer.questionType = question.questionType;
									answer.questionId = question.id;
									answer.choiceId = choice.id;
									answer.answerText = $('#' + question.id + '_' + choice.id).val();
									answer.answerVar = choice.choiceVar;
									answers.push(answer);
// 									console.log(answer);
								}
							}
						}
					}
					else if (question.questionType == 'radioBox' || question.questionType == 'checkBox') {
						if (choices) {
							for (var j = 0; j < choices.length; j++) {
								var choice = choices[j] ;
								var answer = {}; 
								var isAnswer = $('#' + question.id + '_' + choice.id).is(':checked');
								if (isAnswer) {
									answer.staffId = __staffId;
									answer.workgroup = 'IPD';
									answer.mrn = mrn;
									answer.questionType = question.questionType;
									answer.questionId = question.id;
									answer.choiceId = choice.id;
									answer.answerText = (choice.choiceText) ? $('#choiceText_' + question.id + '_' + choice.id).val() : '';
									answer.answerVar = choice.choiceVar;
									answers.push(answer);
// 									console.log(answer);
								}
							}
						}
					}
					else {
						if (choices) {
							var answer = {}; 
							answer.staffId = __staffId;
							answer.workgroup = 'IPD';
							answer.mrn = mrn;
							answer.questionType = question.questionType;
							answer.questionId = question.id;
							answer.choiceId = $('#select_' + question.id).val();
							for (var j = 0; j < choices.length; j++) {
								var choice = choices[j] ;
								if (choice.id == answer.choiceId) {
									answer.answerVar = choice.choiceVar;
									answer.answerText = choice.choiceTitle;
								}
							}
							answers.push(answer);
						}
					}
				}
			}
		}
		$.ajax({
		    url: '${pageContext.request.contextPath}/answer/save',
		    data: JSON.stringify(answers),
		    type: "POST",
		    dataType:"json",
		    contentType: "application/json",
		    cache: false,
		    success: function(retQuestion) {
		    	$('.panel-body').text('Last Update ' + new Date());
		    },
    	    error: function(jqXHR, textStatus, errorThrown) {
    	    	$('.panel-body').text(this.url + '\njqXHR status : ' + jqXHR.status + '\ntextStatus : ' + textStatus + '\nThrown : ' + errorThrown);
    	    }
		});	
	}
}

function getAnswers(mrn, workgroup) {
	$.ajax({
	    url: '${pageContext.request.contextPath}/answer/getAnswers',
	    data: "mrn=" + mrn + "&workgroup=" + workgroup,
	    type: "GET",
	    dataType:"json",
	    contentType: "application/json",
	    cache: false,
	    success: function(answers) {
	    	$('.panel-body').text('Last Update ' + new Date());
	    	if (answers) {
	    		var answer = null;
	    		for (var i = 0; i < answers.length; i++) {
	    			answer = answers[i];
	    			if (answer.status == 'active') {
		    			if (answer.questionType == 'textBox' || answer.questionType == 'textAreaBox') {
		    				$('#' + answer.questionId + '_' + answer.choiceId).val(answer.answerText);
		    			}
		    			else if (answer.questionType == 'radioBox' || answer.questionType == 'checkBox') {
		    				$('#' + answer.questionId + '_' + answer.choiceId).attr('checked', true);
		    				if (answer.answerText) {
		    					$('#choiceText_' + answer.questionId + '_' + answer.choiceId).val(answer.answerText);
		    				}
		    			}
		    			else {
// 		    				$('#select_' + answer.questionId).val(answer.choiceId);
		    				$('#select_' + answer.questionId).selectpicker('val', answer.choiceId);
		    			}
	    			}
	    		}
	    	}
	    	else {
	    		$(':input').not(':button, :submit, :reset, :hidden, :checkbox, :radio').val('');
				$(':checkbox, :radio').prop('checked', false);
				$('.selectpicker').selectpicker('val', 0);
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