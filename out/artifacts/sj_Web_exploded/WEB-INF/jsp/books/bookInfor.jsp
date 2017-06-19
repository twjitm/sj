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
<jsp:include page="../main/corepage.jsp"></jsp:include>
<link type="text/css" rel="stylesheet" 
	href="<%=path%>/css/books/book.css">
<meta charset="utf-8">
<title>图书详细</title>
</head>

<body>
<div id="wrapper">
	<jsp:include page="../main/newindex.jsp"></jsp:include>
	<div id="page-wrapper">
		<h3>图书详细信息</h3>
		<div id="page-inner">
			<div class="content">
				<h1 class="h1_book_title">图书类</h1>
				<ul>
					<li>
						<dl>
							<dd>
								<a href="#"><img src="<%=path%>/img/book_02.jpg" alt="book"></a>
							</dd>
							<dt>
								<p><a class="book_title"><a href="#" target="_blank">[图书]${books.bkName}</a></p>
								<c:if test="${books.haveBooks==0}">
								<%-- <p class="mulu">
								 	<ul>
								 		<li class="book_title">目录</li>
								 		<li><a href="">第一章：${books.bkAuthor}</a></li>
								 		<li><a href="">第二章：${books.bkPress}</a></li>
								 		<li><a href="">第三章：${books.bkIsbn}</a></li>
								 		<li><a href="">第四章：${books.bkTheme}</a></li>
								 	</ul>
								</p> --%>
								</c:if>
								
								<p>
								<c:if test="${books.haveBooks==0}">
								<a class="book_buy"  onclick="readBook('0',${books.id})" href="javascript:(0)" target="_parent">&nbsp&nbsp&nbsp[在线阅读]阅读</a>
								</c:if>
								<c:if test="${books.haveBooks==1}">
								<a class="book_buy" href="${books.fbwurl}" target="_blank">外借图书</a>
								</c:if>
								</p></br>
								<c:if test="${books.haveBooks==0}">
								<p class="book_inline">[丛编题名]：${books.bkAuthor}</p>
								<p class="book_inline">[作&nbsp&nbsp&nbsp&nbsp者]：${books.bkAuthor}</p>
								<p class="book_inline">[出版社&nbsp&nbsp]：${books.bkPress}</p>
								<p class="book_inline">[出版社时间]：${books.bkPresstime}</p>
								<p class="book_inline">[ISBN&nbsp&nbsp&nbsp&nbsp]：${books.bkIsbn}</p>
								<p class="book_inline">[主题词&nbsp&nbsp]：${books.bkTheme}</p>
								<p class="book_inline">[页&nbsp&nbsp码]：${books.bkPagenum}</p>
								<p class="book_inline">[版&nbsp&nbsp本]：${books.bkVersion}</p> 
							    <p>	<a class="book_buy"
									href="<%=path%>/borrows/addUI?id=${books.id}&type=0"
									target="_parent">申请借阅</a> <a class="book_buy" href="javascript:()"
									onclick="addCollections(${books.id})" target="_parent">收藏</a></p>
								</c:if>
							</dt>
						</dl>
					</li>
					<!--评论列表 -->
						<c:if test="${books.haveBooks==0}">
					<li>
						<dl>
							<dt>
								<a class="book_title"><a href="#" target="_blank">评论列表</a></a></br>
								<c:forEach items="${commons}" var="common">
									<a class="">${common.userAccount}</a>
									<l class="book_inline">${common.comContext}</l>
									</br>
								</c:forEach>
							</dt>
							<dl>
								<dt>
									<input type="text" placeholder="请输入评论类容" hidden="hidden"
										id="commContext" required="required"></input> <a
										class="btn btn-default" onclick="subCommont(${books.id})">我要评论</a>
								</dt>
							</dl>

						</dl>
					</li>
					</c:if>
				</ul>
				
			</div>
			<jsp:include page="../main/footer.jsp"></jsp:include>
		</div>
	</div>
</div>
<script type="text/javascript">
//提交评论
		var ctop=0;
		function subCommont(id){
			console.log(ctop)
			  if(ctop==0){
				    $("#commContext").attr("hidden",false);
				    ctop=1;
			  }else{
				  var comm= $("#commContext").val();
				  if(comm==""||comm==null){
				  layer.msg("评论内容不能为空");
				  return;
			  }
				  console.log(comm)
				  //提价评论内容
				   $.ajax({
				   url:'<%=path%>/commons/add.do',
				   type:'POST',
				   data:{"id":id,"type":0,"context":$("#commContext").val()},
				   success:function(data){
				   window.location.href="<%=path%>/books/bookInfor?id="+id+"&type=0"
				   },
				   error:function(ero){
				   },
				   });
				   $("#commContext").attr("hidden",true);
				    ctop=0;
				  }
		}
		function addCollections(id){//addcollection.do?entityId=${books.id}&type=0
		    $.ajax({
				   url:'<%=path%>/books/addcollection.do',
			type : 'POST',
			data : {
				"entityId" : id,
				"type" : 0
			},
			success : function(data) {
				if (data == "success") {
					layer.msg("收藏成功");
				}
				if (data == "exist") {
					layer.msg("以收藏！请勿重复添加");
				}
			},
			error : function(ero) {
			},
		});
	}
	
</script>
 </body>
</html>