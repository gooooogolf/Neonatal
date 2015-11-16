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
			   	 	<li><a href="${pageContext.request.contextPath}/questions">รายการคำถาม</a></li>
					<li><a href="${pageContext.request.contextPath}/questions/new" class="active">สร้างแบบสอบถาม <span class="sr-only">(current)</span></a></li>
				</ul>
			</div>
		</div>
		</div>
</div>
<div id="page-wrapper">
	<div class="row">
		<div class="col-lg-12">
			<h3 class="page-header">สร้างแบบสอบถาม</h3>
		</div>
	</div>
  	<div class="row">
   	<div class="col-lg-12">
		<div class="panel panel-default">
	    <div class="panel-heading">กรอกข้อมูลเพื่อสร้างแบบสอบถาม</div>
		<div class="panel-body">
			<div class="row">
		        <div class="col-lg-12">
				<!--     	<div id="errMsg"></div>  -->
					<form class="form-horizontal" action="javascript:void(0)">	
					<div class="form-group">
						<label class="control-label col-md-2" for="workgroup">รูปแบบ</label> 
						<div class="col-md-10">
							<select class="selectpicker" id="workgroup">
							    <option selected="selected" value="IPD">IPD</option>
							    <option value="OPD">OPD</option>
						  	</select>
						</div>
					</div>	
					<div class="form-group">
						<label class="control-label col-md-2" for="questionNumber">ลำดับ</label> 
						<div class="col-md-2">
							<input class="form-control" name="questionNumber" id="questionNumber"/>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-2" for="questionTitle">หัวข้อคำถาม</label> 
						<div class="col-md-10">
							<input class="form-control" name="questionTitle" id="questionTitle"/>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-2" for="helpText">ข้อความช่วยเหลือ</label> 
						<div class="col-md-10">
							<input class="form-control" name="helpText" id="helpText"/>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-2" for="questionType">ประเภทคำถาม</label> 
						<div class="col-md-10">
							<select id="questionType" class="selectpicker">
							    <option selected="selected" value="textBox">ข้อความ</option>
							    <option value="textAreaBox">ข้อความย่อหน้า (ยาว)</option>
							    <option value="radioBox">หลายตัวเลือก (เลือกตอบได้ 1 คำตอบ)</option>
							    <option value="checkBox">หลายตัวเลือก (เลือกตอบได้หลายคำตอบ)</option>
							    <option value="selectBox">หลายรายการ</option>
						  	</select>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-2" for="choice"></label> 
						<div id="choice" class="col-md-10"></div>
					</div>
					<div class="form-group">        
				         <div class="col-md-offset-2 col-md-10">
				         	<button type="button" class="btn btn-primary" id="submit">บันทึก</button>
				         	<button type="reset" class="btn btn-danger">ยกเลิก</button>
				         </div>
					</div>
					</form>
				</div>
	        </div>	    		                
		</div>
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

var __rowTemplate;

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

__rowTemplate = '<tr id="choice_{rowId}">';
__rowTemplate += '<td><input class="form-control" type="text" id="choiceNumber_{rowId}"/></td>';
__rowTemplate += '<td><input class="form-control" type="text" id="choiceTitle_{rowId}"/></td>';
__rowTemplate += '<td><div class="text-center"><label><input type="checkbox" id="isChoiceText_{rowId}"></label></div></td>';
__rowTemplate += '<td><input class="form-control" type="text" id="choiceVar_{rowId}"/></td>';
__rowTemplate += '<td><button type="button" class="btn btn-danger" id="btnChoice_{rowId}" onClick="deleteRow(\'{rowId}\')">ลบ</button></td>';
__rowTemplate += '</tr>'

var __txtBoxTemplate = ''
__txtBoxTemplate += '<div class="form-group"><div class="col-md-10">';
__txtBoxTemplate += '<input class="form-control" type="hidden" id="choiceTitle_{rowId}"/><input class="form-control" name="isChoiceText_{rowId}" id="isChoiceText_{rowId}" placeholder="ข้อความ"/>';
__txtBoxTemplate += '</div>';
__txtBoxTemplate += '<div class="col-md-2">';
__txtBoxTemplate += '<input class="form-control" name="choiceVar_{rowId}" id="choiceVar_{rowId}" placeholder="ตัวแปร"/>';
__txtBoxTemplate += '</div></div>';

var __txtAreaTemplate = ''
	__txtAreaTemplate += '<div class="form-group"><div class="col-md-10">';
	__txtAreaTemplate += '<input class="form-control" type="hidden" id="choiceTitle_{rowId}"/><textarea class="form-control" name="isChoiceText_{rowId}" id="isChoiceText_{rowId}" rows="5" placeholder="ข้อความ"></textarea>';
	__txtAreaTemplate += '</div>';
	__txtAreaTemplate += '<div class="col-md-2">';
	__txtAreaTemplate += '<input class="form-control" name="choiceVar_{rowId}" id="choiceVar_{rowId}" placeholder="ตัวแปร"/>';
	__txtAreaTemplate += '</div></div>';

var __rowCount = 0;

$(document).ready(function() {
	$('.selectpicker').selectpicker();
	countQuestionNumber($('#workgroup').val())
	$('#workgroup').change(function(){
		countQuestionNumber($(this).val());
	});
	
	questionType[$('#questionType').val()]();
	$('#questionType').change(function(){
		__rowCount = 0;
		questionType[$(this).val()]();
	});
	
	$('#addChoice').live('click', function() {
		__rowCount = __rowCount + 1;
		var rowId = new RegExp('{rowId}', 'g');
		var rowTemplate = __rowTemplate
		rowTemplate = rowTemplate.replace(rowId, __rowCount);
		$('#choices').append(rowTemplate);
		$('#choiceNumber_' + __rowCount).select();
	});
	
	$('#submit').click(function() {
		var errMsg = null;
		var question = {};
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
				choice.choiceNumber = $('#choiceNumber_' + i).val();
				choice.choiceTitle = $('#choiceTitle_' + i).val();
				choice.isChoiceText = (question.questionType == 'textBox' || question.questionType == 'textAreaBox') ? true : $('#isChoiceText_' + i)[0].checked;
				choice.choiceVar = $('#choiceVar_' + i).val();
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
			//ajax
			$.ajax({
			    url: '${pageContext.request.contextPath}/questions/save',
			    data: JSON.stringify(question),
			    type: "POST",
			    dataType:"json",
			    contentType: "application/json",
			    cache: false,
			    success: function(retQuestion) {
// 			    	window.location = '${pageContext.request.contextPath}/questions/' + retQuestion.id;
			    	window.location = '${pageContext.request.contextPath}/questions';
			    },
	    	    error: function(jqXHR, textStatus, errorThrown) {
	    	    	alert(this.url + '\njqXHR status : ' + jqXHR.status + '\ntextStatus : ' + textStatus + '\nThrown : ' + errorThrown);
	    	    }
			});	
		}	
	});
	
});

function countQuestionNumber(workgroup){
	$.ajax({
	    url: '${pageContext.request.contextPath}/questions/count/' + workgroup,
	    type: "GET",
	    contentType: "text",
	    cache: false,
	    success: function(questionNumber) {
			$('#questionNumber').val(questionNumber);
	    },
	    error: function(jqXHR, textStatus, errorThrown) {
	    	alert(this.url + '\njqXHR status : ' + jqXHR.status + '\ntextStatus : ' + textStatus + '\nThrown : ' + errorThrown);
	    }
	});
}

function errMsgLabel(errMsg, el) {
    var errMsgTemplate = '<div class="alert alert-danger alert-error">';
    errMsgTemplate += '<a href="#" class="close" data-dismiss="alert">&times;</a>';
    errMsgTemplate += '<strong>Error! </strong>' + errMsg;
    errMsgTemplate += '</div>';
    $('#errMsg').html(errMsgTemplate);
}
function deleteRow(rowId) {
	$('#choice_' + rowId).remove();
}

var questionType  = {
		textBox: function() {
			__rowCount = 1;
			var rowId = new RegExp('{rowId}', 'g');
			var txtBoxTemplate = __txtBoxTemplate
			txtBoxTemplate = txtBoxTemplate.replace(rowId, __rowCount);
			$('#choice').html(txtBoxTemplate);
		},	
		textAreaBox: function() {
			__rowCount = 1;
			var rowId = new RegExp('{rowId}', 'g');
			var txtAreaTemplate = __txtAreaTemplate
			txtAreaTemplate = txtAreaTemplate.replace(rowId, __rowCount);
			$('#choice').html(txtAreaTemplate);
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