<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/pages/commons/taglibs.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>bootstrap table分页</title>
<%@include file="/WEB-INF/pages/commons/inc.jsp"%>
<!-- 引入bootstrap table.css -->
<link href="${ctx}/resources/bootstrapTable/bootstrap-table.css" rel="stylesheet" />
</head>
<body>
	<div class="container">
		<div class="page-header">
			<h2>bootstrap table分页示例</h2>
			<a href="${ctx}/index.jsp">返回分页汇总</a>
		</div>
		<form id="listForm" role="form" action="${ctx}/bootstrapTable/list" method="post">
			<div class="form-group">
				<label for="userName">User Name</label> 
				<input id="userName" name="userName" type="text" class="form-control" style="width: 400px;" value="${userForm.userName}" placeholder="Enter user name" />
			</div>
			<button id="searchBtn" type="button" class="btn btn-default">Submit</button>
			<button type="reset" class="btn btn-default">Reset</button>
			<table id="table">
			</table>
		</form>
	</div>
	<!-- 引入jQuery -->
	<script src="${ctx}/resources/js/jquery/jquery-2.2.3.min.js" type="text/javascript"></script>
	<!-- 引入Bootstrap -->
	<script src="${ctx}/resources/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>	
	<!-- 引入bootstrap table.js -->
	<script src="${ctx}/resources//bootstrapTable/bootstrap-table.js" type="text/javascript"></script>
	<!-- 引入bootstrap table.js中文语言包 -->
	<script src="${ctx}/resources//bootstrapTable/bootstrap-table-zh-CN.js" type="text/javascript"></script>
	<!-- 引入index.js 此为自定义的bootstrap table.js辅助类库 -->
	<script src="${ctx}/resources/js/bootstrapTable/index.js" type="text/javascript"></script>
	<script type="text/javascript">
	$(function() {
		//页面初始化
		pager.init();
	});
	</script>
</body>
</html>
