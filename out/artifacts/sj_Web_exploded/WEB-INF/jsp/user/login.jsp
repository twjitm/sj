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
	<div class="container">
		<div class="col-md-12">
			<h1 class="margin-bottom-15">馆际互借平台-学生子系统</h1>
			<form id="fromId" class="form-horizontal templatemo-container templatemo-login-form-1 margin-bottom-30" role="form" action="<%=path%>/user/login.do" method="post">				
		        <div class="form-group">
		          <div class="col-xs-12">		            
		            <div class="control-wrapper">
		            	<label for="username" class="control-label fa-label"><i class="fa fa-user fa-medium"></i></label>
		            	<input type="text" class="form-control" id="username" placeholder="Username" name="urAccess">
		            </div>		            	            
		          </div>              
		        </div>
		        <div class="form-group">
		          <div class="col-md-12">
		          	<div class="control-wrapper">
		            	<label for="password" class="control-label fa-label"><i class="fa fa-lock fa-medium"></i></label>
		            	<input type="password" class="form-control" id="password" placeholder="Password" name="urPsd">
		            </div>
		          </div>
		        </div>
		        <div class="form-group">
		          <div class="col-md-12">
	             	<div class="checkbox control-wrapper">
	                	<label>
	                  		<input type="checkbox">记住密码
                		</label>
	              	</div>
		          </div>
		        </div>
		        <div class="form-group">
		          <div class="col-md-12">
		          	<div class="control-wrapper">
		          		<input type="button" value="登录" class="btn btn-info" onclick="submitFrom()">
		          		<a href="<%=path%>/user/forgetUI.do" class="text-right pull-right">忘记密码？</a>
		          	</div>
		          </div>
		        </div>
		        <hr>
		       <!--  <div class="form-group">
		        	<div class="col-md-12">
		        		<label>其他方式登录: </label>
		        		<div class="inline-block">
		        			<a href="#"><i class="fa fa-facebook-square login-with"></i></a>
			        		<a href="#"><i class="fa fa-twitter-square login-with"></i></a>
			        		<a href="#"><i class="fa fa-google-plus-square login-with"></i></a>
			        		<a href="#"><i class="fa fa-tumblr-square login-with"></i></a>
			        		<a href="#"><i class="fa fa-github-square login-with"></i></a>
		        		</div>		        		
		        	</div>
		        </div> -->
		      </form>
		      <div class="text-center">
		      	<a href="<%=path%>/user/registerUI.do" class="templatemo-create-new">注册<i class="fa fa-arrow-circle-o-right"></i></a>	
		      </div>
		</div>
	</div>
<script type="text/javascript">
          function submitFrom(){
          var data=$("#fromId").serialize();
           $.ajax({
            url:'<%=path%>/user/login.do',
            data:data,
            type:'POST',
            success:function(data){
             console.log(data);
            console.log(data.message);
             if(data.urType==1){//普通用户
             window.location.href="<%=path%>/borrows/list.do";
             }else if(data.urType==2){//管理员
               window.location.href="<%=path%>/books/adminlist.do";
              }else if(data.urType==3){
              layer.msg("新生和毕业生禁止使用");
              }
              else {
              layer.msg("用户名或密码错误");
              }
            },
            error:function(ero){
             layer.msg("系统异常，请联系超级管理员");
            }
           });
          }
</script>
</body>

</html>