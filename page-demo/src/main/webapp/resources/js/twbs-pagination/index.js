var util = util || {};

$(function() {
	
    var $listForm = $('#listForm'); // 列表表单
    var $searchButton = $('#searchButton'); // 查询按钮
    var $pageNumber = $('#pageNumber'); // 当前页码
    var $pageSize = $('#pageSize'); // 每页显示数
    var $sort = $('#listForm .sort'); // 排序
    var $orderBy = $('#orderBy'); // 排序方式
    var $order = $('#order'); // 排序字段

	var totalPages = 1;
	var pageCount = parseInt('${pager.pageCount}');
	console.info
	if(pageCount && pageCount != 0) {
		totalPages = pageCount;
		$('.pagerBar').show();
	} else {// 如果没有总记录数或者总记录数为0,则证明没有数据,需要隐藏分页
		$('.pagerBar').hide();
	}

	
	var currentPage = 1;
	var pageNumber = parseInt('${pager.pageNumber}');
	if(pageNumber && pageNumber != 0) {
		currentPage = pageNumber;
	}
	
	var $pagination = $('#pagination').twbsPagination({
        totalPages : totalPages,
        startPage : currentPage,
        hideOnlyOnePage : true,
        first : '首页',
        prev : '上一页',
        next : '下一页',
        last :'末页',
        onPageClick : function(event,pagerNumber) {
        	//$pageNumber.val(pagerNumber);
        	$(this).twbsPagination('destroy');
        	$.post('${ctx}/twbsPagination/list',util.serializeObject($('#listForm')),function(data) {
        		console.info(data);
        	},'json');
        }
    });
	
    // 查找
    $searchButton.click(function() {
        //$('#pagination').trigger('page', '1');
    });
});

	function goToThePage() {
		var toPagerNum = parseInt($('#toPagerNum').val());
		var pageTotal = '${pager.pageCount}';
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
		//document.forms[0].submit();
	}

/**
 * 将form表单元素的值序列化成对象
 * 
 * @example util.serializeObject($('#formId'))
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
