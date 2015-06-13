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
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap-select.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/sticky-footer-navbar.css">
<title>Neonatal Data</title>
</head>
<body>
<jsp:include page="navbar.jsp"></jsp:include>
<div class="container">
<!-- 	<div class="page-header"> -->
<!-- 	   <h1>จัดการข้อมูล</h1> -->
<!-- 	</div> -->
    <div id="errMsg"></div>
	<form class="form-horizontal" action="javascript:void(0)">	
	<div class="form-group">
		<label class="control-label col-sm-2" for="workgroup">รูปแบบ</label> 
		<div class="col-sm-10">
			<select class="selectpicker" id="workgroup">
			    <option value="IPD">IPD</option>
			    <option value="OPD">OPD</option>
		  	</select>
		</div>
	</div>	
	<div class="form-group">
		<label class="control-label col-sm-2" for="questionNumber">ลำดับ</label> 
		<div class="col-sm-1">
			<input class="form-control" name="questionNumber" id="questionNumber" value="${question.questionNumber }"/>
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="questionTitle">หัวข้อคำถาม</label> 
		<div class="col-sm-10">
			<input class="form-control" name="questionTitle" id="questionTitle" value="${question.questionTitle }"/>
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="helpText">ข้อความช่วยเหลือ</label> 
		<div class="col-sm-10">
			<input class="form-control" name="helpText" id="helpText" value="${question.helpText }"/>
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="questionType">ประเภทคำถาม</label> 
		<div class="col-sm-10">		
			<select id="questionType" class="selectpicker" disabled="disabled">
			    <option value="textBox">ข้อความ</option>
			    <option value="textAreaBox">ข้อความย่อหน้า (ยาว)</option>
			    <option value="radioBox">หลายตัวเลือก (เลือกตอบได้ 1 คำตอบ)</option>
			    <option value="checkBox">หลายตัวเลือก (เลือกตอบได้หลายคำตอบ)</option>
			    <option value="selectBox">หลายรายการ</option>
		  	</select>
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="choice"></label> 
		<div id="choice" class="col-sm-10">
		</div>
	</div>
	<div class="form-group">        
          <div class="col-sm-offset-2 col-sm-10">
          	<button type="submit" class="btn btn-primary" id="submit">บันทึก</button>
          	<button type="button" class="btn btn-danger" id="cancel">ยกเลิกแบบสอบถามข้อนี้</button>
          	<button type="button" class="btn btn-info" onclick="javascript:window.location.href='${pageContext.request.contextPath}/questions'">ย้อนกลับ</button>
          </div>
	</div>
	</form>
</div>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/respond.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/bootstrap/js/bootstrap-select.js"></script>
<script type="text/javascript">
var __panelTemplate = '';
__panelTemplate += '<div class="panel panel-default">';
__panelTemplate += '<div class="panel-heading" align="right">';
__panelTemplate += '<a id="addChoice" href="javascript:void(0);">';
__panelTemplate += '<span class="glyphicon glyphicon-plus" aria-hidden="true" href="#"></span> เพิ่ม</a>';
__panelTemplate += '</div>';
__panelTemplate += '<div id="panel-body" class="table-responsive">';
__panelTemplate += '<table class="table table-bordered table-striped">';
__panelTemplate += '<thead>';
__panelTemplate += '<tr>';
__panelTemplate += '<th style="width: 10%">ลำดับ</th>';
__panelTemplate += '<th>รายละเอียด</th>';
__panelTemplate += '<th style="width: 5%">TextBox</th>';
__panelTemplate += '<th style="width: 15%">ตัวแปร</th>';
__panelTemplate += '<th style="width: 5%"></th>';
__panelTemplate += '</tr>';
__panelTemplate += '</thead>';
__panelTemplate += '<tbody id="choices"></tbody>';
__panelTemplate += '</table>';
__panelTemplate += '</div>';
__panelTemplate += '</div>';

var __rowTemplate = '';
__rowTemplate += '<tr id="choice_{rowId}">';
__rowTemplate += '<input class="form-control" type="hidden" id="id_{rowId}"/><input class="form-control" type="hidden" id="status_{rowId}"/>';
__rowTemplate += '<td><input class="form-control" type="text" id="choiceNumber_{rowId}"/></td>';
__rowTemplate += '<td><input class="form-control" type="text" id="choiceTitle_{rowId}"/></td>';
__rowTemplate += '<td><div class="text-center"><label><input type="checkbox" id="isChoiceText_{rowId}"></label></div></td>';
__rowTemplate += '<td><input class="form-control" type="text" id="choiceVar_{rowId}"/></td>';
__rowTemplate += '<td><button type="button" class="btn btn-danger" id="btnChoice_{rowId}" onClick="deleteRow(\'{rowId}\')">ลบ</button></td>';
__rowTemplate += '</tr>'


var __txtBoxTemplate = ''
	__txtBoxTemplate += '<div class="form-group"><div class="col-sm-10">';
	__txtBoxTemplate += '<input class="form-control" type="hidden" id="choiceTitle_{rowId}"/><input class="form-control" type="hidden" id="id_{rowId}"/><input class="form-control" type="hidden" id="status_{rowId}"/>';
	__txtBoxTemplate += '<input class="form-control" name="isChoiceText_{rowId}" id="isChoiceText_{rowId}" placeholder="ข้อความ"/>';
	__txtBoxTemplate += '</div>';
	__txtBoxTemplate += '<div class="col-sm-2">';
	__txtBoxTemplate += '<input class="form-control" name="choiceVar_{rowId}" id="choiceVar_{rowId}" placeholder="ตัวแปร"/>';
	__txtBoxTemplate += '</div></div>';

var __txtAreaTemplate = ''
	__txtAreaTemplate += '<div class="form-group"><div class="col-sm-10">';
	__txtAreaTemplate += '<input class="form-control" type="hidden" id="choiceTitle_{rowId}"/><input class="form-control" type="hidden" id="id_{rowId}"/><input class="form-control" type="hidden" id="status_{rowId}"/>';
	__txtAreaTemplate += '<textarea class="form-control" name="isChoiceText_{rowId}" id="isChoiceText_{rowId}" rows="5" placeholder="ข้อความ"></textarea>';
	__txtAreaTemplate += '</div>';
	__txtAreaTemplate += '<div class="col-sm-2">';
	__txtAreaTemplate += '<input class="form-control" name="choiceVar_{rowId}" id="choiceVar_{rowId}" placeholder="ตัวแปร"/>';
	__txtAreaTemplate += '</div></div>';

var __rowCount = 0;

function afterReady() {
	var questionType = '${questionType}';
	var choices = $.parseJSON('${choices}');
	if (choices) {
		$.each(choices, function( index, choice ) {
			if (choice.status == 'active') {
				var rowId = new RegExp('{rowId}', 'g');
				if ((questionType == 'textBox') || (questionType == 'textAreaBox')) {					
					for (var key in choice) {
						$('#' + key + '_' + __rowCount).val(choice[key]);
// 						console.log(__rowCount + ' ' + key + ' = ' + choice[key]);
					}
				}
				else {
					__rowCount++;
					var rowTemplate = __rowTemplate;
					rowTemplate = rowTemplate.replace(rowId, __rowCount);
					$('#choices').append(rowTemplate);
					
					for (var key in choice) {
						$('#' + key + '_' + __rowCount).val(choice[key]);
					}
					if(choice.choiceText) $('#isChoiceText_' + __rowCount).attr('checked', 'checked');
				}
			}
		});
	}
}

function toUpperCaseWithFirstChar(str){
    return str.replace(/\w\S*/g, function(txt){return txt.charAt(0).toUpperCase() + txt.substr(1).toLowerCase();});
}

$(document).ready(function() {
	$('#workgroup').val('${question.workgroup}');
	$('#questionType').val('${question.questionType}');
	
	questionType[$('#questionType').val()]();
	$('#questionType').change(function(){
		__rowCount = 0;
		questionType[$(this).val()]();
	});
	
	$('#addChoice').live('click', function() {
		__rowCount = __rowCount + 1;
		var rowId = new RegExp('{rowId}', 'g');
		var rowTemplate = __rowTemplate;
		rowTemplate = rowTemplate.replace(rowId, __rowCount);
		$('#choices').append(rowTemplate);
		$('#id_' + __rowCount).val('0');
		$('#status_' + __rowCount).val('active');
		$('#choiceNumber_' + __rowCount).select();
	});
	
	$('#submit').click(function() {
		var errMsg = null;
		var question = {};
		question.id = '${question.id}';
		question.workgroup = $('#workgroup').val();
		question.questionNumber = $('#questionNumber').val();
		question.questionTitle = $('#questionTitle').val();
		question.helpText = $('#helpText').val();
		question.questionType = $('#questionType').val();
		question.choices = [];
		
		question.questionNumber = isNaN(question.questionNumber) ? 0 : question.questionNumber;
		question.questionTitle = question.questionTitle.length == 0 ? errMsg = 'กรุณาใส่หัวข้อคำถาม' : question.questionTitle; 
		if (!errMsg && __rowCount) {
			var ids = 0, choice = null;
			for (var i = 1; i <= __rowCount; i++) {
				choice = {};
				choice.id = $('#id_' + i).val();
				choice.choiceNumber = $('#choiceNumber_' + i).val();
				choice.choiceTitle = $('#choiceTitle_' + i).val();
				choice.isChoiceText = (question.questionType == 'textBox' || question.questionType == 'textAreaBox') ? true : $('#isChoiceText_' + i)[0].checked;
				choice.choiceVar = $('#choiceVar_' + i).val();
				choice.status = $('#status_' + i).val();
				if (!$.isEmptyObject(choice)) {
					question.choices[ids] = choice;
					ids++;
				}
				choice.choiceNumber = isNaN(choice.choiceNumber) ? 0 : choice.choiceNumber;
				choice.choiceVar = choice.choiceVar.length == 0 ? errMsg = 'กรุณาใส่ค่าตัวแปรเพื่อไว้คำนวนสถิติ' : choice.choiceVar; 
			}
		}
		
		if (errMsg) {
			errMsgLabel(errMsg);
		}
		else {
			$('.alert').remove();
// 			alert(JSON.stringify(question));
			$.ajax({
			    url: '${pageContext.request.contextPath}/questions/update',
			    data: JSON.stringify(question),
			    type: "POST",
			    dataType:"json",
			    contentType: "application/json",
			    cache: false,
			    success: function(retQuestion) {
			    	window.location = '${pageContext.request.contextPath}/questions';
			    },
	    	    error: function(jqXHR, textStatus, errorThrown) {
	    	    	alert(this.url + '\njqXHR status : ' + jqXHR.status + '\ntextStatus : ' + textStatus + '\nThrown : ' + errorThrown);
	    	    }
			});	
		}	
	});	
	
	$('#cancel').click(function() {
	    if (confirm("ยกเลิกแบบสอบถามข้อนี้")) {
			$.ajax({
			    url: '${pageContext.request.contextPath}/questions/${question.id}',
			    type: "DELETE",
			    dataType:"json",
			    contentType: "application/json",
			    cache: false,
			    success: function(retQuestion) {
			    	window.location = '${pageContext.request.contextPath}/questions';
			    },
	    	    error: function(jqXHR, textStatus, errorThrown) {
	    	    	alert(this.url + '\njqXHR status : ' + jqXHR.status + '\ntextStatus : ' + textStatus + '\nThrown : ' + errorThrown);
	    	    }
			});	
	    }
	});
	
	afterReady();
});

function errMsgLabel(errMsg, el) {
    var errMsgTemplate = '<div class="alert alert-danger alert-error">';
    errMsgTemplate += '<a href="#" class="close" data-dismiss="alert">&times;</a>';
    errMsgTemplate += '<strong>Error! </strong>' + errMsg;
    errMsgTemplate += '</div>';
    $('#errMsg').html(errMsgTemplate);
}

function deleteRow(rowId) {

	if ($('#id_' + rowId).val() == '0') {
		$('#choice_' + rowId).remove();
	}
	else {
		$('#choice_' + rowId).hide();
		$('#status_' + rowId).val('terminated');	
	}
	
}

var questionType  = {
		textBox: function() {
			__rowCount = 1;
			var rowId = new RegExp('{rowId}', 'g');
			var txtBoxTemplate = __txtBoxTemplate;
			txtBoxTemplate = txtBoxTemplate.replace(rowId, __rowCount);
			$('#choice').html(txtBoxTemplate);
		},	
		textAreaBox: function() {
			__rowCount = 1;
			var rowId = new RegExp('{rowId}', 'g');
			var txtBoxTemplate = __txtAreaTemplate;
			txtBoxTemplate = txtBoxTemplate.replace(rowId, __rowCount);
			$('#choice').html(txtBoxTemplate);
		},
		radioBox: function() {				
			$('#choice').html(__panelTemplate);
		},
		checkBox: function() {
			$('#choice').html(__panelTemplate);
		},
		selectBox: function() {
			$('#choice').html(__panelTemplate);
		}
	};


</script>
</body>
</html>