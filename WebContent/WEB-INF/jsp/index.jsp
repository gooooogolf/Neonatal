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
<style type="text/css">
.navbar-custom {
     color: #FFFFFF; 
     background-color: #FFFFFF; 
/*     border-color: #c0392b; */
/*     background-color: #e74c3c; */
}
</style>
<title>Neonatal Data</title>
</head>
<body>
<div id="menu" class="navbar navbar-default navbar-fixed-top navbar-custom">
	<div class="container">
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
				<li><a href="${pageContext.request.contextPath}">จัดการข้อมูล</a></li>
				<li class="dropdown">
		            <a href="#" data-toggle="dropdown" class="dropdown-toggle">บันทึกข้อมูล <b class="caret"></b></a>
		            <ul class="dropdown-menu">
		                <li><a href="${pageContext.request.contextPath}">IPD</a></li>
		                <li><a href="${pageContext.request.contextPath}">OPD</a></li>
		            </ul>
			    </li>
			    <li><a href="${pageContext.request.contextPath}">รายงาน</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
		        <li class="dropdown">
		            <a href="#" data-toggle="dropdown" class="dropdown-toggle">ผู้ใช้งานทั่วไป<b class="caret"></b></a>
		            <ul class="dropdown-menu">
		                <li><a href="${pageContext.request.contextPath}/j_spring_security_logout">ออกจากระบบ</a></li>
		            </ul>
		        </li>
			</ul>
			</div>
	   	</div>
	</div>
</div>
<div class="container">
<!-- 	<div class="page-header"> -->
<!-- 	   <h1>จัดการข้อมูล</h1> -->
<!-- 	</div> -->
	<form class="form-horizontal">	
	<div class="form-group">
		<label class="control-label col-sm-2" for="workgroup">รูปแบบ</label> 
		<div class="col-sm-10">
			<select class="selectpicker" id="workgroup">
			    <option selected="selected" value="IPD">IPD</option>
			    <option value="OPD">OPD</option>
		  	</select>
		</div>
	</div>	
	<div class="form-group">
		<label class="control-label col-sm-2" for="questionNumber">ลำดับ</label> 
		<div class="col-sm-1">
			<input class="form-control" name="questionNumber" id="questionNumber"/>
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="questionTitle">หัวข้อคำถาม</label> 
		<div class="col-sm-10">
			<input class="form-control" name="questionTitle" id="questionTitle"/>
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="helpText">ข้อความช่วยเหลือ</label> 
		<div class="col-sm-10">
			<input class="form-control" name="helpText" id="helpText"/>
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="questionType">ประเภทคำถาม</label> 
		<div class="col-sm-10">
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
	<label class="control-label col-sm-2" for="choice"></label> 
	<div id="choice" class="col-sm-10">
	</div>
	</div>
	<div class="form-group">        
          <div class="col-sm-offset-2 col-sm-10">
          	<button type="submit" class="btn btn-primary">บันทึก</button>
          	<button type="reset" class="btn btn-danger">ยกเลิก</button>
          </div>
	</div>
	</form>
</div>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/bootstrap/js/bootstrap-select.js"></script>
<script type="text/javascript">
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

var __rowCount = 0;

$(document).ready(function() {

	questionType[$('#questionType').val()]();
	$('#questionType').change(function(){
		__rowCount = 0;
		questionType[$(this).val()]();
	});
	
	$('#addChoice').live('click', function() {
		__rowCount = __rowCount + 1;
		var rowId = new RegExp('{rowId}', 'g');
		var rowTemplate = __rowTemplate
		rowTemplate = __rowTemplate.replace(rowId, __rowCount);
		$('#choices').append(rowTemplate);
		$('#choiceNumber_' + __rowCount).select();
	});
	
});

function deleteRow(rowId) {
	$('#choice_' + rowId).remove();
}

var questionType  = {
		textBox: function() {
			var txtBox = '';
			txtBox += '<div class="form-group"><div class="col-sm-10">';
			txtBox += '<input class="form-control" name="isChoiceText" id="isChoiceText" placeholder="ข้อความ"/>';
			txtBox += '</div>';
			txtBox += '<div class="col-sm-2">';
			txtBox += '<input class="form-control" name="choiceVar" id="choiceVar" placeholder="ตัวแปร"/>';
			txtBox += '</div></div>';
			$('#choice').html(txtBox);
		},	
		textAreaBox: function() {
			var txtBox = '';
			txtBox += '<div class="form-group"><div class="col-sm-10">';
			txtBox += '<textarea class="form-control" name="isChoiceText" id="isChoiceText" rows="5" placeholder="ข้อความย่อหน้า (ยาว)"></textarea>';
			txtBox += '</div>';
			txtBox += '<div class="col-sm-2">';
			txtBox += '<input class="form-control" name="choiceVar" id="choiceVar" placeholder="ตัวแปร"/>';
			txtBox += '</div></div>';
			$('#choice').html(txtBox);
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