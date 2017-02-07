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
	<script type="text/javascript">
	var pager = {
		$table : $('#table'),//boostrap table
		$listForm : $('#listForm'),// search from
		toolbar : {
			$searchBtn : $('#searchBtn'),//search button
		},
		isFisrtLoad : true,//标识是否首次打开页面,如果是,则不加载数据
		init : function() {
			// 初始化boostrap table
			this.tableInit();
			// 初始化查询功能
			this.searchQueryInit();
		},
		tableInit : function () {
			var _this = this;
			this.$table.bootstrapTable({
				url : ctx + '/bootstrapTable/list',//服务器数据的加载地址
				classes : 'table table-striped table-no-bordered',
				method : 'post',
				idField : 'id',//指定主键列
				contentType : 'application/x-www-form-urlencoded',//发送到服务器的数据编码类型,默认为'application/json',为了方便使用，使用表单格式提交
				queryParamsType : 'undefined',//设置为 'limit' 则会发送符合 RESTFul 格式的参数.limit,offset,如果是其他,则为pageSize,pageNumber
				queryParams : function(params) {//传递参数
					var queryParams = util.serializeObject(_this.$listForm);
					return $.extend(queryParams,params);
				},
				columns : [ {
					field : 'id',
					title : 'id'
				}, {
					field : 'userName',
					title : 'user name'
				}, {
					field : 'phone',
					title : 'phone'
				}, {
					field : 'createTime',
					title : 'create time'
				} ],
				cache : false,
				pagination : true,//设置为 true 会在表格底部显示分页条
				sidePagination : 'server',//设置在哪里进行分页，可选值为 'client' 或者 'server'。设置 'server'时，必须设置 服务器数据地址（url）或者重写ajax方法
				pageSize : 10,//如果设置了分页，页面数据条数
				pageList: [10, 25, 50, 100],//可供选择的每页的行数
				onLoadSuccess : function(data){
					// not a good way to do that
					/*
					if(_this.isFisrtLoad) {
						_this.$table.bootstrapTable('load',{total:0,rows:{}});
						_this.isFisrtLoad = false;
					}
					*/
				}
			});
		},
		searchQueryInit : function() {
			var _this = this;
			this.toolbar.$searchBtn.click(function () {
				_this.$table.bootstrapTable('selectPage',1);
				_this.$table.bootstrapTable('refresh');
			});
		}
	};
	
	$(function() {
		//页面初始化
		pager.init();
	});
	</script>
</body>
</html>
