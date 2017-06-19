<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  <meta charset="utf-8">
  <title>图书详细</title>
<jsp:include page="../main/corepage.jsp"></jsp:include>
<div id="wrapper">
	<jsp:include page="../main/newindex.jsp"></jsp:include>
	<div id="page-wrapper">
		<h3>个人详细信息</h3>
		<div id="page-inner">
		<div class="row">
				<div class="col-md-12">
				<form  method="post" id="formId" >
				<div class="col-md-4">
				        <div class="op">
				           <div style="display: none">
				          <input type="text" name="id" class="form-control" value="${user.id}" ></input>
							</div>
							<label>账号类型：</label>
							 <span>${user.urType}</span>
							  <input type="text" name="urType" class="form-control" value="${user.urType}" style="display: none" readOnly="readonly"></input>
						      </div>
						</div>
				     <div class="col-md-4">
				        <div class="op">
							<label>姓名：</label>
							 <span>${user.urName}</span>
							  <input type="text" name="urName" class="form-control" value="${user.urName}" style="display: none" ></input>
						      </div>
						</div>
						<div class="col-md-4">
						<div class="op">
							<label>账号：</label>
							 <span >${user.urAccess}</span>
							  <input type="text" name="urAccess" class="form-control" value="${user.urAccess}" style="display: none" readOnly="readonly"></input>
						</div>
						</div>
						<div class="col-md-4">
						<div class="op">
							<label>图书馆账号：</label>
							 <span >${user.urBarcode}</span>
							  <input type="text" name="urBarcode" class="form-control" value="${user.urBarcode}" style="display: none" readOnly="readonly"></input>
						</div>
						</div>
						<div class="col-md-4">
						<div class="op">
							<label>性别：</label>
							 <span >${user.urSex}</span>
							  <input type="text" name="urSex" class="form-control" value="${user.urSex}" style="display: none" ></input>
						</div>
						</div>
						<div class="col-md-4">
						<div class="op">
							<label>联系方式：</label>
							 <span >${user.srIphone}</span>
							  <input type="text" name="srIphone" class="form-control" value="${user.srIphone}" style="display: none" ></input>
						</div>
						</div>
						
						<div class="col-md-4">
						<c:if test="${user.urType==1}">
						<div class="op">
							<label>类型：</label>
							 <c:if test="${user.stuType==0}"><span >专科生</span></c:if>
							 <c:if test="${user.stuType==1}"><span >本科生</span></c:if>
							 <c:if test="${user.stuType==2}"><span >研究生</span></c:if>
							 <c:if test="${user.stuType==3}"><span >博士生</span></c:if>
							 <c:if test="${user.stuType==4}"><span >留学生</span></c:if>
							  <select id="disabledSelect" name ="stuType" class="form-control" style="display: none" >
                                                    <option value="0">专科生</option>
                                                    <option value="1">本科生</option>
                                                    <option value="2">研究生</option>
                                                    <option value="3">博士生</option>
                                                    <option value="4">留学生</option>
                             </select>
						</div>
						</c:if>
						</br>
						<a id="saveUser" href="#" onclick="updateUserInfor()" class="btn btn-success ">修改个人信息</a>
						</div>
					</form>
				</div>
				</div>
		<jsp:include page="../main/footer.jsp"></jsp:include>
		</div>
		</div>
		</div>
		<script type="text/javascript">
		function updateUserInfor(){
		  if($("#saveUser").html()=="修改个人信息"){
		    $("span").hide();
		    $("input").show();
		    $("#disabledSelect").show();
		     $("#saveUser").html("保存修改");
		     
		  }else{
		  
		  $.ajax({
			  url:'<%=path%>/user/update.do',
			  type:'POST',
			  async:false,
		      data:$("#formId").serialize(),
		      success: function(data) {
                    window.location.href='<%=path%>/user/userinfor.do';
                }
		  });
		  
		    $("formId").submit();
		    $("span").show();
		    $("input").hide();
		    $("#disabledSelect").hide();
		    $("#saveUser").html("修改个人信息");
		  }
		 
		}
		
		</script>
  
</html>
