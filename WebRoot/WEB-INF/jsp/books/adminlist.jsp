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

<link type="text/css" rel="stylesheet" href="<%=path%>/css/books/reset.css" />
<link type="text/css" rel="stylesheet" href="<%=path%>/css/books/1024_768.css" />
<link type="text/css" rel="stylesheet" href="<%=path%>/css/pager/pagination.css" />
<link type="text/css" rel="stylesheet" media="screen and (min-width:861px) and (max-width:960px)" href="<%=path%>/css/books/pad_heng.css" />
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<jsp:include page="../main/corepage.jsp"></jsp:include>
<div id="wrapper">
<jsp:include page="../main/newindex.jsp"></jsp:include>
<div id="page-wrapper">

  <h3 class="">图书列表</h3>
		<div id="page-inner">
			<div class="row">
				<div class="col-md-12">
				<div class="panel panel-default">
					<div class="table-responsive">
					<table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                    <thead>
                                        <tr>
                                            <th>名称</th>
                                            <th>作者</th>
                                            <th>出版社</th>
                                            <th>编号</th>
                                            <th>国际编号</th>
                                            <th>类型</th>
                                            <th>操作</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                     <c:forEach items="${books}" var="book">
                                        <tr class="odd gradeX">
                                            <td>${book.bkName}</td>
                                            <td>${book.bkAuthor}</td>
                                            <td>${book.bkPress}</td>
                                            <td class="center">${book.id}</td>
                                            <td class="center">${book.bkIsbn}</td>
                                             <td class="center">图书</td>
                                              <td class="center">
                                                  <a href="<%=path%>/books/delete.do?id=${book.id}&type=1"><i class="fa fa-pencil"></i>删除</a>
                                                  <a href="<%=path%>/books/updateUI.do?id=${book.id}&type=0"><i class="fa fa-forward"></i>修改</a>
                                              </td>
                                        </tr>
                                        </c:forEach>
                                        
                                        <c:forEach items="${papers}" var="paper">
                                        <tr class="odd gradeX">
                                            <td>${paper.prName}</td>
                                            <td>${paper.prAuthor}</td>
                                            <td>${paper.prDegree}</td>
                                            <td class="center">${paper.prPagenum}</td>
                                            <td class="center">${paper.prDegree}</td>
                                             <td class="center">论文</td>
                                              <td class="center">
                                                <a href="<%=path%>/books/delete.do?id=${paper.id}&type=3"><i class="fa fa-pencil"></i>删除</a>
                                              <a href="<%=path%>/books/updateUI.do?id=${paper.id}&type=2"><i class="fa fa-forward"></i>修改</a>
                                              </td>
                                        </tr>
                                        </c:forEach>
                                        
                                         <c:forEach items="${periodicals}" var="periodical">
                                           <tr class="odd gradeX">
                                            <td>${periodical.plName}</td>
                                            <td>${periodical.plAuthor}</td>
                                            <td>${periodical.plSource}</td>
                                            <td class="center">${periodical.id}</td>
                                            <td class="center">${periodical.plIssn}</td>
                                             <td class="center">期刊</td>
                                              <td class="center">
                                                <a href="<%=path%>/books/delete.do?id=${periodical.id}&type=2"><i class="fa fa-pencil"></i>删除</a>
                                               <a href="<%=path%>/books/updateUI.do?id=${periodical.id}&type=1"><i class="fa fa-forward"></i>修改</a>
                                              </td>
                                        </tr>
                                        </c:forEach>
                                        
                                        </tbody>
                                        </table>
					
					</div>
					</div>
			    </div>
			</div>
	<jsp:include page="../main/footer.jsp"></jsp:include>
</div>
</div>
</div>
<script type="text/javascript" src="<%=path%>/js/pager/jquery.pagination.js"> </script>
<%-- <script type="text/javascript" src="<%=path%>/js/pager/jquery.min.js"> </script>
 --%>        <script>
 
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
