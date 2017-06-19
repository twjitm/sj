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

  <h3 class="">全部图书</h3>
		<div id="page-inner">
			<div class="row">
				<div class="col-md-12">
				<%-- <form action="<%=path%>/books/newall.do" method="post">
				<input type="text" style="display: none" name="cp" value="${page}"/>
					<div class="col-lg-6">
					 <div class="form-group input-group">
                       <label >过滤规则：</label>
                        <select class="form-control" name="type">
                            <option value="0">书名</option>
                            <option  value="1">作者</option>
                            <option  value="2">关键字</option>
                        </select>
                   </div>
                   </div>
                       <div class="col-lg-61">
                           <div class="form-group input-group" >
                               <input type="text" class="form-control" name="keycontect">
                               <span class="input-group-btn">
                                   <button class="btn btn-default" type="submit"><i class="fa fa-search">查询</i></button>
                               </span>
                         </div>
                    </div>
              </form> --%>  
			<div class="row">
				<div class="col-md-12">
					<div class="panel panel-default">
					<div class="table-responsive">
					<table class="table table-striped table-bordered table-hover" id="dataTables-example">
				<thead><tr><th>全部图书查询</th></tr></thead>
				<tbody>
					 <!--  <tr>
						<td>
						 <h1 class="h1_book_title">图书类</h1>		
						</td>
					  </tr> -->
				 <c:forEach items="${listbooks}" var="books">
				    <tr>
					  <td>
					   <div class="content"> 
						 <ul>
			            	<li>
			                	<dl>
			                    	<dd><a href="#"><img src="<%=path%>/img/book_02.jpg" alt="book"></a></dd>
			                        <dt class="haha">
			                        	  <a  class="book_title"><a href="#" target="_blank">[图书]${books.bkName}</a></a></br>
			                        	  <l class="book_inline">作者：${books.bkAuthor}</l></br>
			                              <l class="book_inline">出版社：${books.bkPress}</l></br>
			                              <l class="book_inline">ISBN：${books.bkIsbn}</l></br>
			                              <l class="book_inline">主题词：${books.bkTheme}</l></br>
			                             <a class="book_buy" href="<%=path%>/books/bookInfor.do?id=${books.id}&type=0"  target="_parent">查看详情</a>
			                         </dt>
			                     </dl>
			                 </li>
		                 </ul>
				     </div>	
				  </td>
			      </tr>
		        </c:forEach> 
				 <!-- 期刊类 -->
				 <!-- <tr>
					 <td>
					   <h1 class="h1_book_title">期刊类</h1>
					 </td>
				 </tr> -->
				  <c:forEach items="${listperiodicals}" var="periodicals">
				<tr>
				 <td>
				<div class="content">
				   <ul>
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
				       </ul>
				    </div>
				</td>
			</tr>
		</c:forEach>
				 <!-- 论文类 -->
					 <!-- <tr>
					 <td>
					   <h1 class="h1_book_title">论文类</h1>
					 </td>
				 </tr> -->
				 <c:forEach items="${listpapers}" var="papers">
						<tr>
						 <td>
						<div class="content">
						    <ul>
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
						   </ul>
						 </div>
						</td>
					</tr>
		        </c:forEach>
            </tbody>
         </table>
	  </div>
	</div>
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
 
 $(document).ready(function(){
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
 
        function pageselectCallback(page_index, jq){
                console.log(page_index);
                var concurrcp="${page}"
                if(page_index!=concurrcp){
                window.location = 'http://localhost:8080/sj/books/newall.do?cp='+page_index
                }
            }
 
             //图书详细信息
             function bookInfor(id,type,storageNum){
                if(storageNum==0){
             
                 }
                    <%--  $.ajax({
				            url:'<%=path%>/books/bookInfor.do?bookId='+id+'&type='+type,
						     type : "POST",
							data : '',
							success : function(data) {
							
								},
								}); --%>
			}
		
			
</script>

 <script>
</script>