<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% String path = request.getContextPath(); String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
	<jsp:include page="../main/corepage.jsp"></jsp:include>
	<div id="wrapper">
<jsp:include page="../main/newindex.jsp"></jsp:include>
<div id="page-wrapper">
	<h3>期刊修改</h3>
	<div id="page-inner">

		<div class="row">
		<form action="<%=path%>/books/upPeriodicals.do" method="post" id="bookFrom">
			<div class="col-md-12">
			      <div class="col-md-6">
			      <input class="form-control" hidden="hidden" style="display: none" name="id" value="${periodicals.id}" placeholder="期刊名" required="required"></input>
							<label>期刊名：</label> <input class="form-control" name="plName" value="${periodicals.plName}" placeholder="期刊名" required="required"></input>
							 <label>出处：</label> <input class="form-control" name="plSource"  value="${periodicals.plSource}"  placeholder="出处：" required="required"></input>
						     <label>作者：</label> <input class="form-control" name="plAuthor"   value="${periodicals.plAuthor}" placeholder="作者" required="required"></input>
						     <label>国际标准书号：</label> <input class="form-control" name="plIssn" value="${periodicals.plIssn}"  placeholder="国际标准书号" required="required"></input>
						     <label>主题：</label> <input type="text" class="form-control" name="plTheme"  value="${periodicals.plTheme}" placeholder="主题" required="required"></input> 
			       </div>
					      <div class="col-md-6">
							<label>出版时间：</label> <input class="form-control" name="plTime"  value="${periodicals.plTime}" placeholder="出版时间：" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'}) " required="required"></input>
					          <label>版本号：</label><input type="number" class="form-control" name="plVersion"  value="${periodicals.plVersion}" placeholder="版本号"></input>
					      	  <label>期刊类型：</label><select  class="form-control" name="plType" >
					      	                          <option value="0">省级</option>
					      	                          <option value="1">国家级</option>
					      	                          <option value="2">核心级</option>
					      	                         </select>
							  <label>外借URL：</label> <input class="form-control" name="fbwurl"  value="${periodicals.fbwurl}" placeholder="url"></input>
							  <label>简介：</label> <textarea class="form-control" rows="3" name="plSummary" placeholder="图书的简要说明"> "${periodicals.plSummary}" </textarea>
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
