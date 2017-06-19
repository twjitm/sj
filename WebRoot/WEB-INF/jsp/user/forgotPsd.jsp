<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% String path = request.getContextPath(); String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<head>
	<title>忘记密码</title>
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
			<h1 class="margin-bottom-15">忘记密码</h1>
			<form class="form-horizontal templatemo-forgot-password-form templatemo-container" role="form" action="<%=path%>/user/forget.do" method="post">	
				<div class="form-group">
		          <div class="col-md-12">
		          	请输入你的学号
		          </div>
		        </div>		
		        <div class="form-group">
		          <div class="col-md-12">
		            <input type="text" class="form-control"  placeholder="账号" name="access" required="required"> 	            
		          </div>              
		        </div>
		        	<div class="form-group">
		          <div class="col-md-12">
		          	请输入你的电话
		          </div>
		        </div>		
		        <div class="form-group">
		          <div class="col-md-12">
		            <input type="text" class="form-control"  placeholder="电话" name="iphone" required="required">	            
		          </div>              
		        </div>
		          <div class="form-group">
		         <div class="col-md-12">
		          	新密码
		          </div>
		        </div>		
		        <div class="form-group">
		          <div class="col-md-12">
		            <input type="text" class="form-control"  placeholder="新密码" name="newpsd" required="required">	            
		          </div>              
		        </div>
		          <div class="form-group">
		         <div class="col-md-12">
		          	确认密码
		          </div>
		        </div>		
		        <div class="form-group">
		          <div class="col-md-12">
		            <input type="text" class="form-control"  placeholder="确认密码" required="required">	            
		          </div>              
		        </div>
		        <div class="form-group">
		          <div class="col-md-12">
		            <input type="submit" value="提交" class="btn btn-danger">
                    <br><br>
                   
		          </div>
		        </div>
		      </form>
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
              }else{
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