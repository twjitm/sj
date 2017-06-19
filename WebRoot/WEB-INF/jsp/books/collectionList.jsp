<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<jsp:include page="../main/corepage.jsp"></jsp:include>
<div class="wrapper">
	<jsp:include page="../main/newindex.jsp"></jsp:include>
	<div id="page-wrapper">
		<h3>收藏记录</h3>
		<div id="page-inner">
		
			<div class="row">

				<div class="col-md-12">
					<table class="table table-striped table-bordered table-hover"
						id="dataTables-example">
						<thead>
							<tr>
								<td>名称</td>
								<td>作者</td>
								<td>出版社</td>
								<td>出版时间</td>
								<td>借阅量</td>
								<!-- <td>简介</td> -->
								<td>操作</td>
							</tr>
						</thead>
						<tbody id="booksList">
							<c:forEach items="${books}" var="book">
								<tr class="odd gradeX">
									<td>${book.bkName}</td>
									<td>${book.bkAuthor}</td>
									<td>${book.bkPress}</td>
									<td>${book.bkPresstime}</td>
									<td>${book.bkBrowsenum}</td>
									<%-- <td>${book.bkTheme}</td> --%>
									<td><a
										href="<%=path%>/books/deletecollection.do?entityId=${book.id}&type=0">删除</a><a href="<%=path%>/books/bookInfor.do?id=${book.id}&type=0">查看</a></td>
								</tr>
							</c:forEach>
							<c:forEach items="${periodicals}" var="periodical">
								<tr class="odd gradeX">
									<td>${periodical.plName}</td>
									<td>${periodical.plAuthor}</td>
									<td>${periodical.plSource}</td>
									<td>${periodical.plTime}</td>
									<td>${periodical.plBrowsenum}</td>
									<%-- <td>${periodical.plSummary}</td> --%>
									<td><a
										href="<%=path%>/books/deletecollection.do?entityId=${periodical.id}&type=1">删除</a><a href="<%=path%>/books/bookInfor.do?id=${periodical.id}&type=1">查看</a></td>
								</tr>
							</c:forEach>
							<c:forEach items="${papers}" var="paper">
								<tr class="odd gradeX">
									<td>${paper.prName}</td>
									<td>${paper.prAuthor}</td>
									<td>${paper.prCompany}</td>
									<td>${paper.prYear}</td>
									<td>${paper.prBorrownum}</td>
									<%-- <td>${paper.prSummary}</td> --%>
									<td><a
										href="<%=path%>/books/deletecollection.do?entityId=${paper.id}&type=2">删除&nbsp;</a><a href="<%=path%>/books/bookInfor.do?id=${paper.id}&type=2">查看</a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
			<jsp:include page="../main/footer.jsp"></jsp:include>
		</div>
	</div>
</div>

