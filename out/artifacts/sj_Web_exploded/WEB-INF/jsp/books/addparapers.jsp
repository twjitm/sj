<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% String path = request.getContextPath(); String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
	<jsp:include page="../main/corepage.jsp"></jsp:include>
	<div id="wrapper">
<jsp:include page="../main/newindex.jsp"></jsp:include>
<div id="page-wrapper">
	<h3>论文录入</h3>
	<div id="page-inner">

		<div class="row">
			<div class="col-md-12">
			<form action="<%=path%>/books/addPapers.do" method="post" id="bookFrom" enctype="multipart/form-data">
			<div class="col-md-12">
			      <div class="col-md-6">
							<label>论文名称：</label> <input class="form-control" name="prName" placeholder="论文名称" required="required"></input>
							 <label>学位名称：</label> <input class="form-control" name="prDegree" placeholder="学位名称：" required="required"></input>
						     <label>论文年度：</label> <input  class="form-control" name="prYear" placeholder="论文年度" required="required"></input>
						     <label>作者：</label> <input class="form-control" name="prAuthor" placeholder="作者" required="required"></input>
						     <label>主题：</label> <input type="text" class="form-control" name="prTheme" placeholder="主题" required="required"></input> 
						    <label>分类：</label> <input type="text" class="form-control" name="prClassify" placeholder="分类" required="required"></input> 
						      <label>导师：</label> <input type="text" class="form-control" name="prTutor" placeholder="导师" required="required"></input> 
						     <label>pdf电子书：</label> <input type="file" name="file" class="form-control" required="required"></input> 
			       </div>
					      <div class="col-md-6">
					      	<label>学位授予单位：</label><input  class="form-control" name="prCompany" placeholder="学位授予单位"></input>
					      	  <label>页码：</label><input type="number" class="form-control" name="prPagenum" placeholder="页码"></input>
					      	   <label>论文语言：</label><input class="form-control" name="prLanguage" placeholder="论文语言"></input>
							<label>是否存在：</label><select  class="form-control" name="havepapers" >
					      	                        <option value="0">存在</option>
					      	                        <option value="1">不存在</option>
					      	                              </select>
							<label>出版时间：</label> <input class="form-control" name="plTime" placeholder="出版时间：" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'}) " required="required"></input>
							  <label>外借URL：</label> <input class="form-control" name="fbwurl" placeholder="http://"></input>
							  <label>简介：</label> <textarea class="form-control" rows="3" name="prSummary" placeholder="论文的简要说明"></textarea>
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
