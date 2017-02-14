(function($, window, document, undefined) {
    // Pager CLASS DEFINITION END
    var Pager = function(totalPages, currentPage) {
        this.$pagination = $('#pagination'); // 分页控件
        this.$listForm = $('#listForm'); // 列表表单
        this.$searchButton = $('#searchButton'); // 查询按钮
        this.$pageNumber = $('#pageNumber'); // 当前页码
        this.$pageSize = $('#pageSize'); // 每页显示数
        this.$sort = $('#listForm .sort'); // 排序
        this.$orderBy = $('#orderBy'); // 排序方式
        this.$order = $('#order'); // 排序字段
        this.$toPagerNum = $('#toPagerNum'); // 跳转至指定页
        this.$goToPageButton = $('#goToPageButton'); // 跳转至指定页按钮
        this.init(totalPages, currentPage);
    };
    Pager.prototype = {
        constructor: Pager,
        init: function(totalPages, currentPage) {
            // 初始化table
            this.initTable(totalPages, currentPage);
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
        initTable: function(totalPages, currentPage) { // table初始化
            var that = this;
            // 初始化bootstrapPaginator分页控件
            this.$pagination.bootstrapPaginator({
                bootstrapMajorVersion: 3,
                totalPages: totalPages,
                currentPage: currentPage,
                itemTexts: function(type, page, current) {
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
                onPageClicked: function(event, originalEvent, type, page) {
                    that.$pageNumber.val(page);
                    that.$listForm.submit();
                }
            });
        },
        initSearchQuery: function() { // 查询功能初始化
            var that = this;
            // 绑定查询按钮点击事件
            this.$searchButton.click(function() {
                // 设置默认值
                that.$pageNumber.val('1');
                that.$listForm.submit();
            });
        },
        initPageChange: function() { // 切换页面显示条数功能初始化
            var that = this;
            this.$pageSize.change(function() {
                // 设置默认值
                that.$pageNumber.val('1');
                that.$listForm.submit();
            });
        },
        initSort: function() { // 字段排序功能初始化
            var that = this;
            this.$sort.click(function() {
                // 当前排序字段
                var currentOrderBy = $(this).attr('data-name');
                // 判断当前排序方式
                if (that.$orderBy.val() == currentOrderBy) {
                    if (that.$order.val() === '') {
                        that.$order.val('asc');
                    } else if (that.$order.val() == 'desc') {
                        that.$order.val('asc');
                    } else if (that.$order.val() == 'asc') {
                        that.$order.val('desc');
                    }
                } else {
                    that.$orderBy.val(currentOrderBy);
                    that.$order.val('asc');
                }
                that.$pageNumber.val('1');
                that.$listForm.submit();
            });
        },
        initSortStyle: function() { // 排序图标效果初始化
            var that = this;
            var orderByValue = that.$orderBy.val();
            var orderValue = that.$order.val();
            if (orderByValue !== '' && orderValue !== '') {
                // $(".sort[name='" + orderByValue + "']").after('<span class="' +
                // orderValue + 'Sort">&nbsp;</span>');
            }
        },
        initGoToThePage: function(pageCount) { // 跳转至指定页面
            var that = this;
            this.$goToPageButton.click(function() {
                var toPagerNum = parseInt(that.$toPagerNum.val());
                var pageTotal = Number(pageCount);
                if (toPagerNum === '') {
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
                that.$pageNumber.val(toPagerNum);
                that.$listForm.submit();
            });
        }
    };
    // Pager CLASS DEFINITION END
    window.pager = {
        init: function(totalPages, currentPage) {
            return new Pager(totalPages, currentPage);
        }
    };
})(jQuery, window, document);
