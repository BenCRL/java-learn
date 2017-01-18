$(function() {
    var $listForm = $('#listForm'); // 列表表单
    var $searchButton = $('#searchButton'); // 查询按钮
    var $pageNumber = $('#pageNumber'); // 当前页码
    var $pageSize = $('#pageSize'); // 每页显示数
    var $sort = $('#listForm .sort'); // 排序
    var $orderBy = $('#orderBy'); // 排序方式
    var $order = $('#order'); // 排序字段

    // 查找
    $searchButton.click(function() {
        $pageNumber.val('1');
        $listForm.submit();
    });

    // 每页显示数
    $pageSize.change(function() {
        $pageNumber.val("1");
        $listForm.submit();
    });

    // 排序
    $sort.click(function() {
        var $currentOrderBy = $(this).attr('data-name');
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

    // 排序图标效果
    sortStyle();

    function sortStyle() {
        var orderByValue = $orderBy.val();
        var orderValue = $order.val();
        if (orderByValue != '' && orderValue != '') {
            //$(".sort[name='" + orderByValue + "']").after('<span class="' + orderValue + 'Sort">&nbsp;</span>');
        }
    }

    // 页码跳转
    $.gotoPage = function(pagerNumber,event) {
        $pageNumber.val(pagerNumber);
        $listForm.submit();
    };

});



