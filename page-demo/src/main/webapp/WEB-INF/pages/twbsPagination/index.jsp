<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/pages/commons/taglibs.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>twbsPagination.js分页</title>
<%@include file="/WEB-INF/pages/commons/inc.jsp"%>
<!-- 引入twbsPagination.css -->
<link href="${ctx}/resources/css/jquery/twbsPagination.css" rel="stylesheet" />
<!-- 引入jquery.twbsPagination.js -->
<script src="${ctx}/resources/js/jquery/jquery.twbsPagination.js" type="text/javascript"></script>
<!-- 引入index.js 此为自定义的jquery.twbsPagination.js辅助类库 -->
<script src="${ctx}/resources/js/twbs-pagination/index.js" type="text/javascript"></script>
</head>
<body>
	<div class="container">
		<div class="page-header">
			<h2>twbsPagination.js分页示例</h2>
			<a href="${ctx}/index.jsp">返回分页汇总</a>
		</div>
		<form id="listForm" role="form" action="${ctx}/twbsPagination/list" method="post">
			<div class="form-group">
				<label for="userName">User Name</label> 
				<input id="userName" name="userName" type="text" class="form-control" style="width: 400px;" value="${userForm.userName}" placeholder="Enter user name" />
			</div>
			<button type="submit" class="btn btn-default">Submit</button>
			<button type="reset" class="btn btn-default">Reset</button>
			<table class="table table-striped">
				<thead>
					<th>id</th>
					<th>user name</th>
					<th>phone</th>
					<th>create time</th>
				</thead>
				<tbody>
					<c:forEach var="user" items="${pager.list}">
						<tr>
							<td>${user.id}</td>
							<td>${user.userName}</td>
							<td>${user.phone}</td>
							<td><fmt:formatDate value="${user.createTime}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<%@include file="/WEB-INF/pages/twbsPagination/pager.jsp"%>
		</form>
	</div>
</body>
</html>
