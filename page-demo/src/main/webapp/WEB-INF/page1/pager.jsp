<%@ page language="java" pageEncoding="UTF-8"%>
<%@include file="tag.jsp"%>

<div class="page">
		<c:if test="${page.pageCount>0 }">
			共 <span>${page.totalCount }</span> 條 | 
			共 <span>${page.pageCount }</span> 頁 | 
			第 <span>${page.pageNum }</span> 頁
		</c:if>
		<ul>
			<c:if test="${page.pageCount>1}">
				<c:if test="${page.pageNum==1}">
					<li class="first"><a href="javascript:;">首頁</a></li>
					<li><a href="javascript:;">上一頁</a></li>
					<li><a href="javascript:doSubmit('${page.pageNum+1}');" >下一頁</a></li>
					<li class="last"><a href="javascript:doSubmit('${page.pageCount}');" >末頁</a></li>
				</c:if>
				<c:if test="${page.pageNum>1 and page.pageNum<page.pageCount}">
					<li class="first"><a href="javascript:doSubmit('1');" >首頁</a></li>
					<li><a href="javascript:doSubmit('${page.pageNum-1 }');" >上一頁</a></li>
					<li><a href="javascript:doSubmit('${page.pageNum+1 }');" >下一頁</a></li>
					<li class="last"><a href="javascript:doSubmit('${page.pageCount }');" >末頁</a></li>
				</c:if>
				<c:if test="${page.pageNum==page.pageCount}">
					<li class="first"><a href="javascript:doSubmit('1');" >首頁</a></li>
					<li><a href="javascript:doSubmit('${page.pageNum-1 }');" >上一頁</a></li>
					<li><a href="javascript:;">下一頁</a></li>
					<li class="last"><a href="javascript:;">末頁</a></li>
				</c:if>	
			</c:if>
		</ul>
		<input type="hidden" name="pageNum" id="pageNum" value="1" />
</div>

<script type="text/javascript">
function doSubmit(sPageNum) {
	$('#${param.formId} input[name="pageNum"]').val(sPageNum);
	$('#${param.formId}').submit();
}
</script>

