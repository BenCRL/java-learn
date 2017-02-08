var pager = {
		$table : $('#table'),//boostrap table
		$listForm : $('#listForm'),// search from
		toolbar : {
			$searchBtn : $('#searchBtn'),//search button
		},
		isFisrtLoad : true,//标识是否首次打开页面,如果是,则不加载数据
		init : function() {
			// 初始化boostrap table
			this.initTable();
			// 初始化查询功能
			this.initSearchQuery();
		},
		initTable : function () {
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
				cache : false,//是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性
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
		initSearchQuery : function() {
			var _this = this;
			this.toolbar.$searchBtn.click(function () {
				_this.$table.bootstrapTable('selectPage',1);
				_this.$table.bootstrapTable('refresh');
			});
		}
};

var util = util || {};

/**
 * 将form表单元素的值序列化成对象
 * 
 * @example util.serializeObject($('#formId'))
 * 
 * 
 * @requires jQuery
 * 
 * @returns object
 */
util.serializeObject = function(form) {
	var o = {};
	$.each(form.serializeArray(), function(index) {
		if (this['value'] != undefined && this['value'].length > 0) {// 如果表单项的值非空，才进行序列化操作
			if (o[this['name']]) {
				o[this['name']] = o[this['name']] + "," + this['value'];
			} else {
				o[this['name']] = this['value'];
			}
		}
	});
	return o;
};