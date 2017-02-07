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