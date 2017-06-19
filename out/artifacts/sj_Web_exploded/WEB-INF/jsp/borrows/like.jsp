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
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>借阅记录</title>
</head>
<body>
	<jsp:include page="../main/corepage.jsp"></jsp:include>
	<div id="wrapper">
		<jsp:include page="../main/newindex.jsp"></jsp:include>
		<div id="page-wrapper">
			<h3 class="">猜你喜欢</h3>
			<div id="page-inner">
				<div class="row">
					<!-- 详细类容 开始 -->
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
					<!-- 详细类容 开始-->
 <div class="content">
				  <h1 class="h1_book_title">期刊类</h1>
				   <ul>
				    <c:forEach items="${periodicals}" var="periodicals">
				    <li>
	                	<dl>
	                    	<%-- <dd><a href="#"><img src="<%=path%>/img/book_02.jpg" alt="book"></a></dd> --%>
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

</script>
</html>