<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% String path = request.getContextPath(); String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<jsp:include page="../main/corepage.jsp"></jsp:include>
<div id="wrapper">
	<jsp:include page="../main/newindex.jsp"></jsp:include>
	<div id="page-wrapper">
		<h3>图书录入</h3>
		<div id="page-inner">

			<div class="row">
			<form action="<%=path%>/books/addBooks.do" method="post" id="bookFrom" enctype="multipart/form-data">
				   <div class="col-md-12">
						<div class="col-md-6">
							<label>书名：</label> <input class="form-control" name="bkName" placeholder="书名" required="required"></input>
							 <label>作者：</label> <input class="form-control" name="bkAuthor" placeholder="作者：" required="required"></input>
						     <label>出版社：</label> <input class="form-control" name="bkPress" placeholder="出版社" required="required"></input>
						     <label>国际标准书号：</label> <input class="form-control" name="bkIsbn" placeholder="国际标准书号" required="required"></input>
						    <label>页数：</label> <input type="number" class="form-control" name="bkPagenum" placeholder="页数：" required="required"></input> 
						     <label>主题：</label> <input type="text" class="form-control" name="bkTheme" placeholder="主题" required="required"></input> 
						     <label>pdf电子书：</label> <input type="file" name="file" class="form-control" required="required"></input> 
						</div>
					      <div class="col-md-6">
					     
							<label>出版时间：</label> <input class="form-control" name="bkPresstime" placeholder="出版时间：" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'}) " required="required"></input>
					          <label>版本号：</label><input type="number" class="form-control" name="bkVersion" placeholder="版本号"></input>
					           <label>主从题名：</label><input type="text" class="form-control" name="bkCollection" placeholder="主从题名"></input>
					      	  <label>图书类型：</label><select  class="form-control" name="bkType" >
					      	                        <option value="0">文学</option>
					      	                        <option value="1">理学</option>
					      	                          <option value="2">工学</option>
					      	                         </select>
					      	           <label>是否存在：</label><select  class="form-control" name="haveBooks" >
					      	                        <option value="0">存在</option>
					      	                        <option value="1">不存在</option>
					      	                              </select>
							  <label>外借URL：</label> <input class="form-control" name="fbwurl" placeholder="url"></input>
							  <label>简介：</label> <textarea class="form-control" rows="3" name="briefIntrodu" placeholder="图书的简要说明"></textarea>
					      </div>
				</div>
				     <div class="col-md-12">
				     </br>
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
