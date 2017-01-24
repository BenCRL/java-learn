var util = util || {};

$(function() {
	/*
	var totalPages = 1;
	var pageCount = parseInt('${pager.pageCount}');
	if (pageCount && pageCount != 0) {
		totalPages = pageCount;
		 $('.pagerBar').show();
	} else {// 如果没有总记录数或者总记录数为0,则证明没有数据,需要隐藏分页
		 $('.pagerBar').hide();
	}

	var currentPage = 1;
	var pageNumber = parseInt('${pager.pageNumber}');
	if (pageNumber && pageNumber != 0) {
		currentPage = pageNumber;
	}
	*/
});


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
