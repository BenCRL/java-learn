<%@ page language="java" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/pages/commons/taglibs.jsp"%>
<c:if test="${fn:length(pager.list) > 0}">
	<div class="tableactions">
		<label>每页显示:</label>
		<select name="pageSize" id="pageSize">
			<option value="10" <c:if test="${pager.pageSize == 10}">selected="selected"</c:if>>10</option>
			<option value="20" <c:if test="${pager.pageSize == 20}">selected="selected"</c:if>>20</option>
			<option value="30" <c:if test="${pager.pageSize == 30}">selected="selected"</c:if>>30</option>
			<option value="50" <c:if test="${pager.pageSize == 50}">selected="selected"</c:if>>50</option>
			<option value="100" <c:if test="${pager.pageSize == 100}">selected="selected"</c:if>>100</option>
			<option value="500" <c:if test="${pager.pageSize == 500}">selected="selected"</c:if>>500</option>
		</select>
	</div>
</c:if>
<c:choose>
	<c:when test="${fn:length(pager.list) > 0}">
		<div class="pagerBar">
			<span>
				当前：${1 + pager.pageSize * (pager.pageNumber - 1)}&nbsp;~
				<c:choose>
					<c:when test="${pager.pageNumber * pager.pageSize lt pager.totalCount}">
						${pager.pageNumber * pager.pageSize}
					</c:when>
					<c:otherwise>${pager.totalCount}</c:otherwise>
				</c:choose>
				|&nbsp;总数：${pager.totalCount}
			</span>
			<span id="pager"></span>
			<div id="pager_gotopage" style="margin: 0 40px 0 0; float: right; font-size: 12px;">
				输入页码：
				<input type="text" id="toPagerNum" name="toPagerNum" value="${toPagerNum}" style="height: 18px; width: 35px; border: 1px solid #ccc;" />
				<input type="button" id="goToPageButton" name="goToPage" style="height: 29px; width: 30px; margin-top: 1px; border-radius: 5px;" value="GO" class="buttons" onclick="goToThePage('${pager.pageCount}');" />
			</div>
			<input type="hidden" name="pageNumber" id="pageNumber" value="${pager.pageNumber}" />
			<input type="hidden" name="orderBy" id="orderBy" value="${pager.orderBy}" />
			<input type="hidden" name="orderType" id="order" value="${pager.orderType}" />
		</div>
	</c:when>
	<c:otherwise>
		<!-- 
		<div class="noRecord">没有记录</div>
	 -->
	</c:otherwise>
</c:choose>
<script type="text/javascript">
var pager = {
		$pagination : $('#pager'),//分页控件
		$listForm : $('#listForm'), // 列表表单
		$searchButton : $('#searchButton'), // 查询按钮
		$pageNumber : $('#pageNumber'), // 当前页码
		$pageSize : $('#pageSize'), // 每页显示数
		$sort : $('#listForm .sort'), // 排序
		$orderBy : $('#orderBy'), // 排序方式
		$order : $('#order'), // 排序字段
		$toPagerNum : $('#toPagerNum'),//跳转至指定页
		$goToPageButton : $('#goToPageButton'),//跳转至指定页按钮
		init : function(totalCount,pageSize,totalPages,currentPage) {
			// 初始化table
			this.initTable(totalCount,pageSize,currentPage);
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
		initTable : function(totalCount,pageSize,currentPage) {//table初始化
			var _this = this;
		    //初始化simplePagination分页控件
		    this.$pagination.pagination({
		        items: totalCount,//用来计算页数的项目总数
		        itemsOnPage: pageSize,//每个页面显示的项目数
		        currentPage : currentPage,
		        cssStyle: 'light-theme',//CSS主题，一共三种，light-theme，dark-theme和compact-theme
		        prevText:'上一页',
		        nextText:'下一页',
		        onPageClick : function(pagerNumber,event) {
		        	_this.$pageNumber.val(pagerNumber);
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

	$(function() {
		// 初始化分页控件
		pager.init('${pager.totalCount}','${pager.pageSize}','${pager.pageCount}','${pager.pageNumber}');
	});
</script>