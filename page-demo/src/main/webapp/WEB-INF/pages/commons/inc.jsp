<!-- include包含清单 -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
	ctx = '${ctx}';
	basePath = '${basePath}';
</script>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<!-- 引入bootstrap css -->
<link href="${ctx}/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
<!-- 引入jquery.pager.css -->
<link href="${ctx}/resources/css/jqueryPager.css" rel="stylesheet" />

<!-- 引入jQuery -->
<script src="${ctx}/resources/js/jquery-2.2.3.min.js" type="text/javascript"></script>
<!-- 引入Bootstrap -->
<script src="${ctx}/resources/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<!-- 引入jquery.pager.js -->
<script src="${ctx}/resources/js/jquery.pager.js" type="text/javascript"></script>
<!-- 引入list.js 此为自定义的jquery.pager.js辅助类库 -->
<script src="${ctx}/resources/js/list.js" type="text/javascript"></script>