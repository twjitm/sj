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
<title>图书详细</title>

<jsp:include page="../main/corepage.jsp"></jsp:include>
<div id="wrapper">
	<jsp:include page="../main/newindex.jsp"></jsp:include>
	<div id="page-wrapper">
		<h3>期刊详细信息</h3>
		<div id="page-inner">
			 <div class="content">
				  <h1 class="h1_book_title">期刊类</h1>
				   <ul>
				    <li>
	                	<dl>
	                    	<%-- <dd><a href="#"><img src="<%=path%>/img/book_02.jpg" alt="book"></a></dd> --%>
	                        <dt>
	                        	<p class="book_title"><a href="#" target="_blank">[期刊文章]${periodicals.plName}</a></p>
	                        </br>
	                             <a class="book_buy" href="${periodicals.fbwurl}" target="_blank">外借图书</a>
	                          <a class="book_buy" onclick="readBook(1,${periodicals.id})" href="javascript:(0)" target="_parent">在线阅读</a> </br></br>
	                             <l class="book_inline">出处：${periodicals.plSource}</l></br>
	                             <l class="book_inline">作者：${periodicals.plAuthor}</l></br>
	                             <l class="book_inline">年卷(期)：${periodicals.plTime}(${periodicals.plVersion})</l></br>
	                             <l class="book_inline">主题词：${periodicals.plTheme}</l></br>
	                             <l class="book_inline">摘要：${periodicals.plSummary}</l></br>
	                            <a class="book_buy" href="<%=path%>/borrows/addUI?id=${periodicals.id}&type=1" target="_parent">借阅此期刊</a>
	                            <a class="book_buy"   onclick="addCollections(${periodicals.id})">收藏</a>
	                        </dt>
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