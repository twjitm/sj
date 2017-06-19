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
		<h1>修改密码</h1>
		<div id="page-inner">
		<div class="row">
				<div class="col-md-12">
				<div class="col-md-4">
				        <div class="op">
							<label>原来密码</label>
							  <input type="text" id="oldPsd" name="oldPsd" class="form-control"   ></input>
						      </div>
						</div>
				     <div class="col-md-4">
				        <div class="op">
							<label>新密码</label>
							  <input type="text" id="newPsd" name="newPsd" class="form-control"  ></input>
						      </div>
						</div>
						<div class="col-md-4">
						<div class="op">
							<label>确认密码</label>
							  <input type="text"  id="renewPsd" name="renewPsd" class="form-control"  ></input>
						</div>
						</div>
					    
						<div class="col-md-4">
						  <p>
							<div class="op">
							 <input id="saveUser" onclick="updatePsd()" class="btn btn-success " value="修改密码"></input>
							</div>
							</p>
						</div>
						</div>
				</div>
				<jsp:include page="../main/footer.jsp"></jsp:include>
				</div>
		</div>
		</div>
		<script type="text/javascript">
		function updatePsd(){
		var oldPsd=$("#oldPsd").val();
		var newPsd=$("#newPsd").val();
		var renewPsd=$("#renewPsd").val();
		console.log(newPsd)
		console.log(renewPsd)
		  if((newPsd==renewPsd)&&newPsd!=null){
		   $.ajax({
		   url:'<%=path%>/user/updatepsd.do',
		   type:'POST',
		   data:{"oldPsd":oldPsd,"newPsd":newPsd},
		   success:function(data){
		   if(data=="success"){
		   layer.msg("修改成功");
		   $("#oldPsd").val("");
		   $("#newPsd").val("");
		   $("#renewPsd").val("");
		   }else if(data=="error"){layer.msg("原密码错误");}
		   else if(data=="short"){layer.msg("密码过于简单");}
		   }
		   });
		  }else{
		    layer.msg("新密码确认不一致");
		  }
		}
		
		</script>
  
</html>
