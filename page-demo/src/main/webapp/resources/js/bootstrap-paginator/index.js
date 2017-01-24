
var pager = {
	init : function(totalPages,currentPage) {
		var $listForm = $('#listForm'); // 列表表单
		var $searchButton = $('#searchButton'); // 查询按钮
		var $pageNumber = $('#pageNumber'); // 当前页码
		var $pageSize = $('#pageSize'); // 每页显示数
		var $sort = $('#listForm .sort'); // 排序
		var $orderBy = $('#orderBy'); // 排序方式
		var $order = $('#order'); // 排序字段
	    //初始化bootstrapPaginator分页控件
		$('#pagination').bootstrapPaginator({
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
				$pageNumber.val(page);
				$listForm.submit();
			}
		});
		

	    // 绑定查询按钮点击事件
		$searchButton.click(function() {
	    	// 设置默认值
	        $pageNumber.val('1');
	        $listForm.submit();
		});

	    // 每页显示数
	    $pageSize.change(function() {
	    	// 设置默认值
	        $pageNumber.val("1");
	        $listForm.submit();
	    });
	    
	    // 排序
	    $sort.click(function() {
	    	// 当前排序字段
	        var $currentOrderBy = $(this).attr('data-name');
	        // 判断当前排序方式
	        if ($orderBy.val() == $currentOrderBy) {
	            if ($order.val() == '') {
	                $order.val('asc');
	            } else if ($order.val() == 'desc') {
	                $order.val('asc');
	            } else if ($order.val() == 'asc') {
	                $order.val('desc');
	            }
	        } else {
	            $orderBy.val($currentOrderBy);
	            $order.val('asc');
	        }
	        $pageNumber.val('1');
	        $listForm.submit();
	    });

	    function sortStyle() {
	        var orderByValue = $orderBy.val();
	        var orderValue = $order.val();
	        if (orderByValue != '' && orderValue != '') {
	            //$(".sort[name='" + orderByValue + "']").after('<span class="' + orderValue + 'Sort">&nbsp;</span>');
	        }
	    }
	    
	    // 排序图标效果
	    sortStyle();
	}
};

//跳转至指定页面
function goToThePage(pageCount) {
	var toPagerNum = parseInt($('#toPagerNum').val());
	var pageTotal = pageCount;
	pageTotal = Number(pageTotal);
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

	document.all['pageNumber'].value = toPagerNum;
	document.forms[0].submit();
}
