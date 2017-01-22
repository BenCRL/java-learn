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
			<script type="text/javascript">
				$(function() {
				    $('#pager').pagination({
				        items: '${pager.totalCount}',//用来计算页数的项目总数
				        itemsOnPage: '${pager.pageSize}',//每个页面显示的项目数
				        currentPage:'${pager.pageNumber}',
				        cssStyle: 'light-theme',//CSS主题，一共三种，light-theme，dark-theme和compact-theme
				        prevText:'上一页',
				        nextText:'下一页',
				        onPageClick : $.gotoPage
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
					document.forms[0].submit();
				}
			</script>
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
				<input type="button" name="goToPage" style="height: 29px; width: 30px; margin-top: 1px; border-radius: 5px;" value="GO" class="buttons" onclick="goToThePage();" />
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