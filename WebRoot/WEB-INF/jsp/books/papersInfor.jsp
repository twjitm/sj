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
<link type="text/css" rel="stylesheet" href="<%=path%>/css/books/reset.css" />
<link type="text/css" rel="stylesheet" href="<%=path%>/css/books/1024_768.css" />
<link type="text/css" rel="stylesheet" media="screen and (min-width:861px) and (max-width:960px)" href="<%=path%>/css/books/pad_heng.css" />
<meta charset="utf-8">
<title>论文详细</title>

<jsp:include page="../main/corepage.jsp"></jsp:include>
<div id="wrapper">
	<jsp:include page="../main/newindex.jsp"></jsp:include>
	<div id="page-wrapper">
		<h3>论文类详细信息</h3>
		<div id="page-inner">
			 <div class="content">
				  	  <h1 class="h1_book_title">论文类</h1>
				   <ul>
				    <li>
	                	<dl>
	                    	<%-- <dd><a href="#"><img src="<%=path%>/img/book_02.jpg" alt="book"></a></dd> --%>
	                        <dt>
	                        	<p class=""><a href="#" target="_blank">[学位论文]${papers.prName}</a></p>
	                             <a class="book_buy" href="${papers.fbwurl}" target="_blank">外借图书</a>
	                             <a class="book_buy" onclick="readBook(2,${papers.id})" href="javascript:(0)" target="_parent">在线阅读</a> </br></br>
	                             <l class="book_inline">摘要：${papers.prSummary}</l></br>
	                             <l class="book_inline">主题词：${papers.prTheme}</l></br>
	                              <l class="book_inline">作者：${papers.prAuthor}</l></br>
	                             <l class="book_inline">分类：${papers.prClassify}</l></br>
	                             <l class="book_inline">授予单位：${papers.prCompany}</l></br>
	                              <l class="book_inline">导师姓名：${papers.prTutor}</l></br>
	                             <l class="book_inline">学位年度：${papers.prYear}(${papers.prDegree})</l></br>
	                             <l class="book_inline">语言：${papers.prLanguage}</l></br>
	                             <l class="book_inline">页码：${papers.prPagenum}</l></br>
	                            <a class="book_buy" href="<%=path%>/borrows/addUI?id=${papers.id}&type=2" target="_parent">借阅此论文</a>
	                             <a class="book_buy"   onclick="addCollections(${papers.id})">收藏</a>
	                        </dt>
	                    </dl>
	                </li>
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
										id="commContext" required="required"></input> <a class="btn btn-default"
										onclick="subCommont(${papers.id})">我要评论</a>
								</dt>
							</dl>

						</dl>
					</li>
	                
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
				   data:{"id":id,"type":2,"context":$("#commContext").val()},
				   success:function(data){
				   window.location.href="<%=path%>/books/bookInfor?id="+id+"&type=2"
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
				   type:'POST',
				   data:{"entityId":id,"type":0},
				   success:function(data){
				   if(data=="success"){
				     layer.msg("收藏成功");
				   }if(data=="exist"){
				    layer.msg("以收藏！请勿重复添加");
				     }
				   },
				   error:function(ero){
				   },
				   });
		}


</script>