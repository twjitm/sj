<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% String path = request.getContextPath(); String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<jsp:include page="../main/corepage.jsp"></jsp:include>
<div id="wrapper">
	<jsp:include page="../main/newindex.jsp"></jsp:include>
	<div id="page-wrapper">
		<h3>图书修改</h3>
		<div id="page-inner">

			<div class="row">
			<form action="<%=path%>/books/upBooks.do" method="post" id="bookFrom" >
				   <div class="col-md-12">
						<div class="col-md-6">
						<input class="form-control" name="id" hidden="hidden" style="display: none" required="required" value="${books.id}"></input>
							<label>书名：</label> <input class="form-control" name="bkName" placeholder="书名" required="required" value="${books.bkName}"></input>
							 <label>作者：</label> <input class="form-control" name="bkAuthor" placeholder="作者：" required="required" value="${books.bkAuthor}"></input>
						     <label>出版社：</label> <input class="form-control" name="bkPress" placeholder="出版社" required="required" value="${books.bkPress}"></input>
						     <label>国际标准书号：</label> <input class="form-control" name="bkIsbn" placeholder="国际标准书号" required="required" value="${books.bkIsbn}"></input>
						    <label>页数：</label> <input type="number" class="form-control" name="bkPagenum" placeholder="页数：" required="required" value="${books.bkPagenum}"></input> 
						     <label>主题：</label> <input type="text" class="form-control" name="bkTheme" placeholder="主题" required="required" value="${books.bkTheme}"></input> 
						   </div>
					      <div class="col-md-6">
					     
							<label>出版时间：</label> <input class="form-control" name="bkPresstime" value="${books.bkPresstime}" placeholder="出版时间：" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'}) " required="required"></input>
					          <label>版本号：</label><input type="number" class="form-control" name="bkVersion" value="${books.bkVersion}" placeholder="版本号"></input>
					           <label>主从题名：</label><input type="text" class="form-control" name="bkCollection" value="${books.bkCollection}" placeholder="主从题名"></input>
					      	  <label>图书类型：</label><select  class="form-control" name="bkType" >
					      	                        <option value="0">文学</option>
					      	                        <option value="1">理学</option>
					      	                          <option value="2">工学</option>
					      	                         </select>
							  <label>外借URL：</label> <input class="form-control" name="fbwurl" placeholder="url" value="${books.fbwurl}"></input>
					      </div>
				</div>
				     <p>
					     <div class="col-md-12">
					       <div class="col-md-6">
							<input type="submit" class="btn btn-primary btn-lg" value="提交" ></input>
						</div>
						</div>
				    </form>
				
			</div>
			<jsp:include page="../main/footer.jsp"></jsp:include>
		</div>
	</div>
</div>
<script type="text/javascript">
function submitFrom(){
layer.msg("添加图书成功")
$("#bookFrom").submit();
}
</script>
