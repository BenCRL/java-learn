$(function() {
	$('#table').bootstrapTable({
		url : ctx + '/bootstrapTable/list',
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
		} ]
	});
});