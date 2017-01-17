<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/pages/commons/taglibs.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>jquery.pager.js分页</title>
<%@include file="/WEB-INF/pages/commons/inc.jsp"%>
</head>
<body>
	<div class="container">
		<div class="page-header">
			<h2>jquery.pager.js分页示例</h2>
		</div>
		<form id="listForm" role="form" action="${ctx}/jqueryPager/list" method="post">
			<div class="form-group">
				<label for="userName">Email address</label> 
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
			<%@include file="/WEB-INF/pages/jqueryPager/pager.jsp"%>
		</form>
	</div>
</body>
</html>
