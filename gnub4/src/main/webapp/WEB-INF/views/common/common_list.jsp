<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" 
%><%@include file="/WEB-INF/views/include/common.jspf"
%><html>
<head>
<%@include file="/WEB-INF/views/include/head.jspf"%>
<script type="text/javascript">
$(document).ready(function() {
	//1. 이벤트 적용
	initEvents();
	//2. 로딩시 실행 스크립트 처리
	initScripts();
});

function initEvents() {
	$('#btnAdd').bind('click', function() {
		doAdd();
	});
	$('#btnDelete').bind('click', function() {
		doDelete();
	});
	$('#btnCreate').bind('click', function() {
		doCreate();
	});
	$('#chkAll').bind('click', function() {
		doChkAll();
	});
}

function initScripts() {
	
}

function doAdd() {
	$(location).attr('href', '<c:url value="/samples/sampleForm.do"/>');
}

function doDelete() {
	var checkedCount = $("input[name=chkId]").filter(':checked').length;
	if (checkedCount < 1) {
		alert("Select item.");
		return;
	}
	var data = $("#form1").serialize();
	console.log(data);
	
	$.ajax({
		type: "POST"
		, url: "<c:url value='/samples/sampleRemove.do'/>"
		, data: $("#form1").serialize()
		, success: function(data) {
			//console.log(data);
			var obj = jQuery.parseJSON(data);
			console.log(obj);
			alert(obj.result + "건이 삭제됨");
			$(location).attr('href', '<c:url value="/samples/sampleList.do"/>');
			return;
		}
	});
}

function doChkAll() {
	var chkAll = $("#chkAll").is(":checked");
	console.log("[chkAll="+chkAll+"]");
	
	if (chkAll == true)
		$("input[name=chkId]").attr("checked", true);
	else
		$("input[name=chkId]").attr("checked", false);
}

</script>
</head>
<body>
<div id="wrap">
	<!-- header -->
	<%@include file="/WEB-INF/views/include/header.jspf"%>
	<!--// header -->
	
	<!-- main -->
	<div id="main">
		<form id="form1" name="form1" method="post" action="<c:url value='/samples/sampleForm.do' />" style="margin:0px;">
		<table style="width:600px;">
		<thead align="center">
		<tr>
			<td style="width:50px;"><input type="checkbox" id="chkAll" name="chkAll" value="Y" /></td>
			<td style="width:150px;">ID</td>
			<td style="width:200px;">email</td>
			<td style="width:200px;">이름</td>
		</tr>
		</thead>
		<c:forEach var="item" items="${list}">
		<tr>
			<td style="text-align:center;"><input type="checkbox" id="chkId_${item.id}" name="chkId" value="${item.id}" /></td>
			<td>${item.id}</td>
			<td>${item.email}</td>
			<td>${item.name}</td>
		</tr>
		</c:forEach>
		</table>
		
		<div id="buttons" style="width:100%; text-align:center;">
			<button type="button" id="btnAdd">Add</button>
			<button type="button" id="btnDelete">Delete</button>
		</div>
		</form>
	</div>
	<!--// main -->
</div>

<!-- footer -->
<%@include file="/WEB-INF/views/include/footer.jspf"%>
<!--// footer -->

<%--
<%@include file="/WEB-INF/views/include/header.jspf"%>
<form id="form1" name="form1" method="post" style="margin:0px;">
<div id="contents">

	<table style="width:600px;">
	<thead align="center">
	<tr>
		<td style="width:50px;">&nbsp;</td>
		<td style="width:150px;">ID</td>
		<td style="width:200px;">email</td>
		<td style="width:200px;">이름</td>
	</tr>
	</thead>
	<c:forEach var="item" items="${list}"> 
	<tr>
		<td><input type="checkbox" id="chkId" name="chkId" value="${item.id}" /></td>
		<td>${item.id}</td>
		<td>${item.email}</td>
		<td>${item.name}</td>
	</tr>
	</c:forEach>
	</table>

	<div id="buttons" style="width:100%; text-align:center;">
		<button type="button" id="btnAdd">Add</button>
		<button type="button" id="btnDelete">Delete</button>
		<button type="button" id="btnCreate">Create Test Table</button>
	</div>
</div>
</form>

<%@include file="/WEB-INF/views/include/footer.jspf"%>
--%>
</body>
</html>
