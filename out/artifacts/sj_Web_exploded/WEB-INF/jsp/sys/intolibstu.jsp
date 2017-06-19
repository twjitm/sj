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
<title>入馆教育</title>

<jsp:include page="../main/corepage.jsp"></jsp:include>
<div id="wrapper">
	<jsp:include page="../main/newindex.jsp"></jsp:include>
	<div id="page-wrapper">
		<h3>入馆教育</h3>
		<div id="page-inner">
			 <div class="content">
				  	  <h1 class="h1_book_title">入管教育</h1>
                     <p>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp新生入馆教育是新进校大学生入学教育的重要组成部分，其目的是引导大学生了解图书馆的馆藏资源和各项服务、热爱图书馆，并掌握一定的文献检索知识，从而合理地、有效地利用图书馆。开展入馆教育将对新生今后的学习以及综合素质的提高起着非常重要的作用。
    我馆目前的新生入馆教育的方式为网上答题形式。我们特意为广大本科新生和研究生新生设计了2份调查问卷，一份是新生信息素质调查问卷，目的是了解同学们的信息意识、信息能力；</br>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp另一份是图书馆基本知识问答，内容包括河北大学图书馆的规章制度，馆藏资源和我馆的各项服务，目的是让同学们更好的了解我馆的资源和服务，更好的利用图书馆，让图书馆真正成为学生的第二课堂。
    具体入馆教育通知及新生答题网址每年9月份入学后会通过新闻通知发布，请各学院及各位同学关注图书馆主页和河北大学主页通知。</p>
				   
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