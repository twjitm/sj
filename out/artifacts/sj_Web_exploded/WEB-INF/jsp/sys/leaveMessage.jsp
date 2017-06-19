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
<title>读者留言</title>
</head>
<body>
	<jsp:include page="../main/corepage.jsp"></jsp:include>
	<div id="wrapper">
		<jsp:include page="../main/newindex.jsp"></jsp:include>
		<div id="page-wrapper">
			<h3 class="">读者留言</h3>
			<div id="page-inner">
				<div class="row">
					<!-- 详细类容 开始 -->
					<form action="<%=path%>/sys/add.do" method="Post">
					<div class="col-md-12">
					     <div class="col-md-4">
				              <div class="op">
								   <label>标题：</label>
								   <input type="text"  required="required"></input>
						      </div>
						 </div>
						 <div class="col-md-4">
				              <div class="op">
								   <label>手机号：</label>
								   <input type="text"  required="required" name="iphone"></input>
						      </div>
						 </div>
						 <div class="col-md-4">
				              <div class="op">
								   <label>邮箱：</label>
								   <input type="text"  required="required" name="mail"></input>
						      </div>
						 </div>
						 <div class="col-md-4">
				              <div class="op">
								   <label>内容：</label>
								   <textarea rows="5" cols="125" required="required" name="msgContext"></textarea> 
						      </div>
						 </div>
						    <p>
						   <div class="col-md-12">
					          <input type="submit" class="btn btn-info" value="提交留言"></input>
					       </div></p>
					 </div>
					</form>
						<div class="col-md-12">
						 <div class="content">
							  <h2 class="h1_book_title">留言列表</h2>
							   <ul>
							   <c:if test="${empty  leavemags}"><lable>暂无留言记录</lable></c:if>
							    <c:forEach items="${leavemags}" var="leavemag">
							    <li>
				                	<dl>
				                    	<%-- <dd><a href="#"><img src="<%=path%>/img/book_02.jpg" alt="book"></a></dd> --%>
				                        <dt>
				                        	<l class="book_inline">留言时间：${leavemag.msgDate}&nbsp&nbsp&nbsp&nbsp&nbsp<a href="#" target="_blank">[留言人]${leavemag.msgName}，电话${leavemag.iphone}
				                        	，邮箱：${leavemag.mail}</a></l>
				                             </br>
				                             <l class="book_inline">${leavemag.msgContext}</l></br>
				                        </dt>
				                    </dl>
				                </li>
				                </c:forEach>
							   </ul>
							 </div>
						
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