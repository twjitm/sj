<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% String path = request.getContextPath(); String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<head>
	<title>用户登录</title>
	<meta name="keywords" content="" />
	<meta name="description" content="" />
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<jsp:include page="../main/corepage.jsp"></jsp:include>
<link href="<%=path%>/css/login/css/font-awesome.min.css" rel="stylesheet" type="text/css">
	<link href="<%=path%>/css/login/css/bootstrap.min.css" rel="stylesheet" type="text/css">
	<link href="<%=path%>/css/login/css/bootstrap-theme.min.css" rel="stylesheet" type="text/css">
	<link href="<%=path%>/css/login/css/templatemo_style.css" rel="stylesheet" type="text/css">	
</head>
<body class="templatemo-bg-gray">
	<h1 class="margin-bottom-15">注册账号</h1>
	<div class="container">
		<div class="col-md-12">			
			<form class="form-horizontal templatemo-create-account templatemo-container" role="form" action="<%=path%>/user/register.do" method="post">
				<div class="form-inner">
					<div class="form-group">
			          <div class="col-md-6">		          	
			            <label for="first_name" class="control-label">用户名</label>
			            <input type="text" name="urName" class="form-control"  id="first_name" placeholder="" required="required">		            		            		            
			          </div>  
			          <div class="col-md-6">		          	
			            <label for="last_name" class="control-label">学号</label>
			            <input type="text" class="form-control" id="last_name" name="urBarcode" placeholder=""  required="required">		            		            		            
			          </div>  
			        </div>
			        <div class="form-group">
			          <div class="col-md-6">		          	
				            <label for="username" class="control-label">邮箱</label>
				            <input type="email" class="form-control" id="email" placeholder=""  required="required">		            		            		            
			          </div>  
			          <div class="col-md-6">
				               <label for="password" class="control-label">性别</label>
				               <select  class="form-control" id="password_confirm" name="urSex">
				               <option value="男">男</option>
				               <option value="女">女</option>
				               </select>
				          </div>
			                      
			        </div>			
			        <div class="form-group">
				          <div class="col-md-6">		          	
					            <label for="username" class="control-label">密码</label>
					            <input type="password" class="form-control" name="urPsd" id="username" placeholder=""  required="required">		            		            		            
				          </div>
				          <div class="col-md-6">
			            <label for="password" class="control-label">确定密码</label>
			            <input type="password" class="form-control"  id="password" placeholder=""  required="required">
			          </div>
			        </div>
			        <div class="form-group">
			          
				          <div class="col-md-6">
				               <label for="password" class="control-label">电话</label>
				               <input type="number" name="srIphone" class="form-control" id="password_confirm" placeholder=""  required="required">
				          </div>
				          <div class="col-md-6">
				               <label for="password" class="control-label">学生类型</label>
				               <select  class="form-control" id="password_confirm" name="stuType">
				               <option value="0">专科生</option>
				               <option value="1">本科生</option>
				               <option value="2">研究生</option>
				               <option value="3">博士生</option>
				               <option value="4">留学生</option>
				               </select>
				          </div>
			        </div>
			        <div class="form-group">
				         <div class="col-md-12">
				            <label><input type="checkbox"  required="required">我同意 <a href="javascript:;" data-toggle="modal" data-target="#templatemo_modal"  required="required">本图书馆规定</a><a href="#"></a></label>
				         </div>
			        </div>
				        <div class="form-group">
							 <div class="col-md-12">
							   <input type="submit" value="创建账号" class="btn btn-info">
							</div>
				        </div>	
				</div>				    	
		      </form>		      
		</div>
	</div>
	<!-- Modal -->
	<div class="modal fade" id="templatemo_modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
	        <h4 class="modal-title" id="myModalLabel">Terms of Service</h4>
	      </div>
	      <div class="modal-body">
	      	<p>This form is provided by <a rel="nofollow" href="http://www.cssmoban.com/page/1">Free HTML5 Templates</a> that can be used for your websites. Cras mattis consectetur purus sit amet fermentum. Cras justo odio, dapibus ac facilisis in, egestas eget quam. Morbi leo risus, porta ac consectetur ac, vestibulum at eros.</p>
	        <p>Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Vivamus sagittis lacus vel augue laoreet rutrum faucibus dolor auctor. Aenean lacinia bibendum nulla sed consectetur. Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Donec sed odio dui. Donec ullamcorper nulla non metus auctor fringilla. Cras mattis consectetur purus sit amet fermentum. Cras justo odio, dapibus ac facilisis in, egestas eget quam.</p>
	        <p>Morbi leo risus, porta ac consectetur ac, vestibulum at eros. Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Vivamus sagittis lacus vel augue laoreet rutrum faucibus dolor auctor.</p>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	      </div>
	    </div>
	  </div>
	</div>
</body>

</html>