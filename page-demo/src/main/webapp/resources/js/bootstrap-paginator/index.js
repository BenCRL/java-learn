
var pager = {
	$pagination : $('#pagination'),//分页控件
	$listForm : $('#listForm'), // 列表表单
	$searchButton : $('#searchButton'), // 查询按钮
	$pageNumber : $('#pageNumber'), // 当前页码
	$pageSize : $('#pageSize'), // 每页显示数
	$sort : $('#listForm .sort'), // 排序
	$orderBy : $('#orderBy'), // 排序方式
	$order : $('#order'), // 排序字段
	$toPagerNum : $('#toPagerNum'),//跳转至指定页
	$goToPageButton : $('#goToPageButton'),//跳转至指定页按钮
	init : function(totalPages,currentPage) {
		// 初始化table
		this.initTable(totalPages,currentPage);
		// 初始化查询功能
		this.initSearchQuery();
		// 初始化切换页面显示条数功能
		this.initPageChange();
		// 初始化字段排序功能
		this.initSort();
		// 初始化排序图标效果
		this.initSortStyle();
		// 初始化跳转至指定页面功能
		this.initGoToThePage(totalPages);
	},
	initTable : function(totalPages,currentPage) {//table初始化
		var _this = this;
	    //初始化bootstrapPaginator分页控件
		this.$pagination.bootstrapPaginator({
			bootstrapMajorVersion : 3,
			totalPages : totalPages,
			currentPage :currentPage,
		    itemTexts: function (type, page, current) {
		        switch (type) {
		        case 'first':
		            return '首页';
		        case 'prev':
		            return '上一页';
		        case 'next':
		            return '下一页';
		        case 'last':
		            return '末页';
		        case 'page':
		            return page;
		        }
		    },
			onPageClicked : function(event, originalEvent, type, page) {
				_this.$pageNumber.val(page);
				_this.$listForm.submit();
			}
		});
	},
	initSearchQuery : function() {//查询功能初始化
		var _this = this;
	    // 绑定查询按钮点击事件
		this.$searchButton.click(function() {
	    	// 设置默认值
			_this.$pageNumber.val('1');
	        _this.$listForm.submit();
		});
	},
	initPageChange : function() {//切换页面显示条数功能初始化
		var _this = this;
	    this.$pageSize.change(function() {
	    	// 设置默认值
	    	_this.$pageNumber.val('1');
	        _this.$listForm.submit();
	    });
	},
	initSort : function() {//字段排序功能初始化
		var _this = this;
	    this.$sort.click(function() {
	    	// 当前排序字段
	        var currentOrderBy = $(this).attr('data-name');
	        // 判断当前排序方式
	        if (_this.$orderBy.val() == currentOrderBy) {
	            if (_this.$order.val() == '') {
	            	_this.$order.val('asc');
	            } else if (_this.$order.val() == 'desc') {
	            	_this.$order.val('asc');
	            } else if (_this.$order.val() == 'asc') {
	            	_this.$order.val('desc');
	            }
	        } else {
	        	_this.$orderBy.val(currentOrderBy);
	        	_this.$order.val('asc');
	        }
	        _this.$pageNumber.val('1');
	        _this.$listForm.submit();
	    });
	},
	initSortStyle : function() {// 排序图标效果初始化
		var _this = this;
        var orderByValue = _this.$orderBy.val();
        var orderValue = _this.$order.val();
        if (orderByValue != '' && orderValue != '') {
            //$(".sort[name='" + orderByValue + "']").after('<span class="' + orderValue + 'Sort">&nbsp;</span>');
        }
	},
	initGoToThePage : function(pageCount) {//跳转至指定页面
		var _this = this;
		this.$goToPageButton.click(function() {
			var toPagerNum = parseInt(_this.$toPagerNum.val());
			var pageTotal = Number(pageCount);
			if (toPagerNum == '') {
				alert('请输入指定页码.');
				return;
			}
			if (toPagerNum > pageTotal || toPagerNum < 1) {
				alert('输入的页码无效.');
				return;
			}
			if (isNaN(toPagerNum)) {
				alert('输入页码必须为数字.');
				return;
			}
			_this.$pageNumber.val(toPagerNum);
			_this.$listForm.submit();
		});
	}
};
