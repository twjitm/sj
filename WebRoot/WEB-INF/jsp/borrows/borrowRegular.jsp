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
			<h3 class="">借阅规则</h3>
			<div id="page-inner">
				<div class="row">
					<!-- 详细类容 开始 -->
						<div class="content">
							<h1 class="h1_book_title">借阅规则</h1>
							<table class="table table-striped table-bordered table-hover"
							id="dataTables-example">
							<thead>
								<tr>
									<td>职别</td>
									<td>可借阅册数</td>
									<td>可借阅天数</td>
									<td>可续借次数</td>
									<td>可续借天数</td>
									<td>可否预约</td>
								</tr>
							</thead>
							<tbody id="booksList">
								<tr>
									<td>专科生</td>
									<td>5册</td>
									<td>30天</td>
									<td>1次</td>
									<td>30天</td>
									<td>否</td>
								</tr>
								<tr>
									<td>本科生</td>
									<td>5册</td>
									<td>30天</td>
									<td>1次</td>
									<td>30天</td>
									<td>否</td>
								</tr>
								<tr>
									<td>研究生</td>
									<td>5册</td>
									<td>30天</td>
									<td>1次</td>
									<td>30天</td>
									<td>否</td>
								</tr>
								<tr>
									<td>博士生</td>
									<td>5册</td>
									<td>30天</td>
									<td>1次</td>
									<td>30天</td>
									<td>否</td>
								</tr>
								<tr>
									<td>留学生</td>
									<td>5册</td>
									<td>30天</td>
									<td>1次</td>
									<td>30天</td>
									<td>否</td>
								</tr>
							</tbody>
						</table>
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