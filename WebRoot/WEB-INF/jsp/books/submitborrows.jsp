<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!doctype html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<html>
<head>
<link type="text/css" rel="stylesheet"
	href="<%=path%>/css/books/reset.css" />
<link type="text/css" rel="stylesheet"
	href="<%=path%>/css/books/1024_768.css" />
<link type="text/css" rel="stylesheet"
	media="screen and (min-width:861px) and (max-width:960px)"
	href="<%=path%>/css/books/pad_heng.css" />
<meta charset="utf-8">
<title>借书详情</title>

<jsp:include page="../main/corepage.jsp"></jsp:include>
<div id="wrapper">
	<jsp:include page="../main/newindex.jsp"></jsp:include>
	<div id="page-wrapper">
		<h3>确认借书</h3>
		<div id="page-inner">
			<div class="col-md-12">
				<div class="col-md-4">
				 <form action="<%=path%>/borrows/add.do" method="post">
				 <input type="text" hidden="hidden"   style="display: none"name="type" value="${type}"></inpu>
						<c:if test="${type==0}">
						<input type="text" hidden="hidden"   style="display: none"name="bkId" value="${books.id}"></inpu>
						</c:if>
						<c:if test="${type==1}">
						<input type="text" hidden="hidden"  style="display: none" name="plId" value="${periodicals.id}"></inpu>
						</c:if>
						<c:if test="${type==2}">
						<input type="text" style="display: none" name="prId" value="${papers.id}" class="form-control"></inpu>
						</c:if>
						<c:if test="${type==0}">
						<label>刊物名称：</label><input value="${books.bkName}" readonly="readonly" class="form-control"></input>
						</c:if>
						<c:if test="${type==1}">
						<label>刊物名称：</label><input value="${periodicals.plName}" readonly="readonly" class="form-control"></input>
						</c:if>
						<c:if test="${type==2}">
						<label>刊物名称：</label><input value="${papers.prName}" readonly="readonly" class="form-control"></input>
						</c:if>
						<label>还书日期：</label><input class="form-control" name="bwEndtime" placeholder="开始时间：" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'}) " required="required"></input>
						<label>是否续借：</label> <select class="form-control" name="bwIscontinue"
						onchange="changeView(this.options[this.options.selectedIndex].value)">
						<option value="0">否</option>
						<option value="1">是</option>
					</select>
					<div id="isviewDiv">
					</div>
					<input type="submit" class="btn btn-primary" value="提交"></input>
					</form>
				 </div>
			</div>
			<jsp:include page="../main/footer.jsp"></jsp:include>
		</div>
	</div>
</div>
<script type="text/javascript">
//提交评论
		function changeView(isview){
			var html1='<label>续借开始日期：</label><input class="form-control" name="bwContinue" placeholder="开始时间：" onfocus="WdatePicker({dateFmt:\'yyyy-MM-dd HH:mm:ss\'})" required="required"></input>';
			var html2='<label>续借还书日期：</label><input class="form-control" name="bwContreturntime" placeholder="开始时间：" onfocus="WdatePicker({dateFmt:\'yyyy-MM-dd HH:mm:ss\'})" required="required"></input>';	
			 if(isview==1){
			  $("#isviewDiv").html(html1+html2);
			 }else{
			 $("#isviewDiv").html("");
			 }
			 
		}


</script>