<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/pages/commons/taglibs.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>分页汇总</title>
<%@include file="/WEB-INF/pages/commons/inc.jsp"%>
</head>
<body>
	<div>
		<h1>分页汇总</h1>
		<div class="col-md-6">
			<table class="table table-bordered">
				<tr>
					<td>
						<a href="${ctx}/jqueryPager/index">jquery.pager.js分页</a>
					</td>
					<td>
						<a href="${ctx}/simplePagination/index">simplePagination.js分页</a>
					</td>
					<td>
						<a href="${ctx}/bootstrap-paginator/index">bootstrap-paginator</a>
					</td>					
					<td>
						<a href="#">bootstrap table</a>
					</td>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>
