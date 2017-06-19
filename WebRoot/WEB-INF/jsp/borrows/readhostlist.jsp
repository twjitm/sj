<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% String path = request.getContextPath(); String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<link rel="stylesheet" type="text/css" href="<%=path%>/css/main/main1.css">
<div id="page-wrapper">
	
		<div id="page-inner">
			<div class="row">
				<div class="col-md-12">
				<h3>阅读记录</h3>
	<table class="table table-striped table-bordered table-hover" id="dataTables-example">
		<thead >
			<tr>
				<td>书名</td>
				<td>作者</td>
				<td>出版社</td>
				<td>出版时间</td>
				<td>借阅量</td>
				<td>简介</td>
				<td>操作</td>
			</tr>
		</thead>
		<tbody id="booksList">
        <c:forEach items="${books}" var="book">
        <tr class="odd gradeX">
        <td>${book.bookName}</td>
        <td>${book.author}</td>
        <td>${book.press}</td>
         <td>${book.pressDate}</td>
          <td>${book.borrowNum}</td>
          <td>${book.briefIntrodu}</td>
           <td><a>删除</a><a>借阅</a><a>查看</a></td>
        </tr>
        </c:forEach>
		</tbody>
	</table>
</div>
</div>
</div>
</div>

 <script src="<%=path%>/js/newpagejs/jquery-1.10.2.js"></script>
    <!-- Bootstrap Js响应式脚本 -->
    <script src="<%=path%>/js/newpagejs/bootstrap.min.js"></script>
    <!-- Metis Menu Js -->
    <script src="<%=path%>/js/newpagejs/jquery.metisMenu.js"></script>
    <!-- Morris Chart Js -->
    <script src="<%=path%>/js/newpagejs/morris/raphael-2.1.0.min.js"></script>
    <script src="<%=path%>/js/newpagejs/morris/morris.js"></script>
	<script src="<%=path%>/js/newpagejs/easypiechart.js"></script>
	<script src="<%=path%>/js/newpagejs/easypiechart-data.js"></script> 
    <!-- Custom Js -->
   <%--  <script src="<%=path%>/js/newpagejs/custom.js"></script> --%>
   <script src="<%=path%>/js/newpagejs/custom-scripts.js"></script>
     <script src="<%=path%>/js/newpagejs/jquery.dataTables.js"></script>
    <script src="<%=path%>/js/newpagejs/dataTables.bootstrap.js"></script>
        <script>
            $(document).ready(function () {
                $('#dataTables-example').dataTable();
            });
    </script>
