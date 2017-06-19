<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<link type="text/css" rel="stylesheet"
	href="<%=path%>/css/books/reset.css" />
<link type="text/css" rel="stylesheet"
	href="<%=path%>/css/books/1024_768.css" />
<link type="text/css" rel="stylesheet"
	href="<%=path%>/css/pager/pagination.css" />
<link type="text/css" rel="stylesheet"
	media="screen and (min-width:861px) and (max-width:960px)"
	href="<%=path%>/css/books/pad_heng.css" />

<html>
<jsp:include page="../main/corepage.jsp"></jsp:include>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>借阅记录</title>
</head>
<body>
	<div id="wrapper">
		<jsp:include page="../main/newindex.jsp"></jsp:include>
		<div id="page-wrapper">
			<h3 class="">借阅记录</h3>
			
			<div id="page-inner">
			<div class="row">
			<div class=" col-md-2">
					<label>模式：</label> <select class="form-control"
						onchange="changeView(this.options[this.options.selectedIndex].value)">
						<option value="1">视图</option>
						<option value="0">表格</option>
					</select>
				</div>
				</div>
				<div class="row">
				
					<div id="tableContext" style="display: none">
						<div class="panel panel-default">
					    <div class="table-responsive">
						<table class="table table-striped table-bordered table-hover"
							id="dataTables-example">
							<thead>
								<tr>
								<td>图书名</td>
								<c:if  test="${ loginUser.urType==2}">
								     <td >借阅人</td></c:if>
									<td>借阅日期</td>
									<td>结束日期</td>
									<td>是否归还</td>
									<td>借阅刊物</td>
									<td>是否续借</td>
									<td>续借日期</td>
									<td>续借归还日期</td>
									<td>操作</td>
								</tr>
							</thead>
							<tbody id="booksList">
							
								<c:forEach items="${borrows}" var="borrow">
									<tr class="odd gradeX">
									<td>${borrow.bookName}</td>
									<c:if test="${ loginUser.urType==2}">
									<c:if test="${not empty borrow.urName}">
									<td>${borrow.urName}</td>
									</c:if>
									<c:if test="${empty borrow.urName}">
									<td>默认用户</td>
									</c:if>
									</c:if>
										<td>${borrow.bwBwtime}</td>
										<td>${borrow.bwEndtime}</td>
										  <c:if test="${ borrow.bwIsreturn==0}">
										        <td>
												<c:if test="${loginUser.urType==2}">
												 <a href="<%=path%>/borrows/returns.do?id=${borrow.id}">归还图书</a>
												</c:if>
												<c:if test="${loginUser.urType==1}">
												 未归还
												</c:if>
											</td>
										 </c:if>
										<c:if test="${ borrow.bwIsreturn==1}"><td>已归还</td></c:if>
										<c:if test="${not empty borrow.bkId}"><td><a href="<%=path%>/books/bookInfor.do?id=${borrow.bkId}&type=0">图书信息</a></td></c:if>
										<c:if test="${not empty borrow.prId}"><td><a href="<%=path%>/books/bookInfor.do?id=${borrow.prId}&type=2">论文信息</a></td></c:if>
										<c:if test="${not empty borrow.plId}"><td><a href="<%=path%>/books/bookInfor.do?id=${borrow.plId}&type=1">期刊信息</a></td></c:if>
										<!-- 管理员 -->
										<c:if test="${ borrow.bwIscontinue==0}">
											<td>
												否
											</td>
										</c:if>
										<!-- 普通用户 -->
										<c:if test="${ borrow.bwIscontinue==1}"><td>是</td></c:if>
										
										<td>${borrow.bwContinue}</td>
										<td>${book.bkTheme}</td>
										<td><a href="<%=path%>/borrows/delete.do?id=${borrow.id}">删除</a></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						</div>
						</div>
					</div>
					<!-- 详细类容 开始 -->
					<div id="detailed">
					<c:if test="${not empty books}">
						<div class="content">
							<h1 class="h1_book_title">图书类</h1>
							<ul>
								<c:forEach items="${books}" var="book">
									<li>
										<dl>
											<dd>
												<a href="#"><img src="<%=path%>/img/book_02.jpg"
													alt="book"></a>
											</dd>
											<dt class="haha">
												<a class="book_title"><a href="#" target="_blank">[图书]${book.bkName}</a></a></br>
												<l class="book_inline">作者：${book.bkAuthor}</l>
												</br>
												<l class="book_inline">出版社：${book.bkPress}</l>
												</br>
												<l class="book_inline">ISBN：${book.bkIsbn}</l>
												</br>
												<l class="book_inline">主题词：${book.bkTheme}</l>
												</br> <a class="book_buy"
													href="<%=path%>/books/bookInfor?id=${book.id}&type=0"
													target="_parent">查看详情</a>
											</dt>
										</dl>
									</li>
								</c:forEach>
							</ul>
						</div>
                    </c:if>
                    <c:if test="${not empty periodicals}">
		         	<div class="content">
							  <h1 class="h1_book_title">期刊类</h1>
							   <ul>
							    <c:forEach items="${periodicals}" var="periodicals">
							    <li>
				                	<dl>
				                        <dt>
				                        	<p class="book_title"><a href="#" target="_blank">[期刊文章]${periodicals.plName}</a></p>
				                             <l class="book_inline">出处：${periodicals.plSource}</l></br>
				                             <l class="book_inline">作者：${periodicals.plAuthor}</l></br>
				                             <l class="book_inline">年卷(期)：${periodicals.plTime}(${periodicals.plVersion})</l></br>
				                             <l class="book_inline">主题词：${periodicals.plTheme}</l></br>
				                             <l class="book_inline">摘要：${periodicals.plSummary}</l></br>
				                            <a class="book_buy" href="<%=path%>/books/bookInfor.do?id=${periodicals.id}&type=1" target="_parent">查看详情</a>
				                        </dt>
				                    </dl>
				                </li>
				                </c:forEach>
							   </ul>
							  </div>
							  </c:if>
							  <c:if test="${not empty papers}">
								<div class="content">
								  <h1 class="h1_book_title">论文类</h1>
								   <ul>
								    <c:forEach items="${papers}" var="papers">
								    <li>
					                	<dl>
					                    	<%-- <dd><a href="#"><img src="<%=path%>/img/book_02.jpg" alt="book"></a></dd> --%>
					                        <dt>
					                        	<p class="book_title"><a href="#" target="_blank">[学位论文]${papers.prName}</a></p>
					                             <l class="book_inline">作者：${papers.prAuthor}</l></br>
					                             <l class="book_inline">年卷(期)：${papers.prYear}(${papers.prDegree})</l></br>
					                             <l class="book_inline">主题词：${papers.prTheme}</l></br>
					                             <l class="book_inline">摘要：${papers.prSummary}</l></br>
					                            <a class="book_buy" href="<%=path%>/books/bookInfor.do?id=${papers.id}&type=2" target="_parent">查看详情</a>
					                        </dt>
					                    </dl>
					                </li>
					                </c:forEach>
								   </ul>
								 </div>
					</c:if>	
					</div>
					<!--弹框-->
				</div>
				<jsp:include page="../main/footer.jsp"></jsp:include>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
  function changeView(type){
		if(type==0){
		$("#tableContext").show();
		$("#detailed").hide();
		}else{
		$("#tableContext").hide();
		$("#detailed").show();
     }
 }
  $(document).ready(function () {
           $('#dataTables-example').dataTable({
        "sPaginationType": "full_numbers",
        "oLanguage": {
            "sProcessing": "<img src='/images/datatable_loading.gif'>  努力加载数据中.",
            "sLengthMenu": "每页显示 _MENU_ 条记录",
            "sZeroRecords": "抱歉， 没有找到",
            "sInfo": "从 _START_ 到 _END_ /共 _TOTAL_ 条数据",
            "sInfoEmpty": "没有数据",
            "sInfoFiltered": "(从 _MAX_ 条数据中检索)",
            "sZeroRecords": "没有检索到数据",
            "sSearch": "模糊查询:  ",
            "oPaginate": {
                "sFirst": "首页",
                "sPrevious": "前一页",
                "sNext": "后一页",
                "sLast": "尾页"
            
           }}});
            });
 
 

</script>
</html>