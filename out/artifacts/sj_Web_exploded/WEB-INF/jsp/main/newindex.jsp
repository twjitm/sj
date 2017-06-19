<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% String path = request.getContextPath(); String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";%>
<% Integer usertype=0;
      if(request.getAttribute("loginType")!=null){
        usertype=Integer.parseInt(request.getAttribute("loginType").toString());
      }
 %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
  <style>
	    .online-message:hover .second-menu {
		display: block;
	}
	.online-message {
		position: relative;
	}
	.second-menu {
		display: none;
		position: absolute;
		left: 0;
		top: 100%;
		width: 100%;
		padding-left: 40px;
		background: #fff;
		border: 1px solid rgba(0, 0, 0, .15);
		border-top: none;
		box-shadow: 0 6px 12px rgba(0, 0, 0, .175);
	}
	.second-menu a {
		display: inline-block;
		color: #000;
		font-size: 12px;
		line-height: 35px;
	}
</style>
        <nav class="navbar navbar-default top-navbar" role="navigation">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="<%=path%>/user/userinfor.do"><i class="fa fa-user fa-fw"></i> <strong id="loginName"></strong></a>
            </div>
            <ul class="nav navbar-top-links navbar-right" id="dropdownDIV">
                    <!-- /.dropdown-alerts -->
               
                <!-- /.下拉菜单 -->
                       <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#" aria-expanded="false">
                        <i class="fa fa-user fa-fw"></i> <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-user">
                        <li><a href="<%=path%>/user/userinfor.do"><i class="fa fa-user fa-fw"></i>个人信息</a>
                        </li>
                        <li><a href="<%=path%>/user/updatepsdUI.do"><i class="fa fa-gear fa-fw"></i>修改密码</a>
                        </li>
                        <li class="divider"></li>
                        <li><a href="<%=path%>/user/loginOut.do"><i class="fa fa-sign-out fa-fw"></i> 退出登录</a>
                        </li>
                    </ul>
                </li>
                <!-- /.下拉菜单结束 -->
            </ul>
        </nav>
        <!--左侧菜单  -->
        <nav class="navbar-default navbar-side" role="navigation">
		<div id="sideNav"><i class="fa fa-caret-right"></i></div>
            <div class="sidebar-collapse">
			<!-- 左侧菜单-->
                <ul class="nav" id="main-menu">
                
                
                </ul>
                   
            </div>

        </nav>
		<!--每个页替换的类容-->

   <%--  <script src="<%=path%>/js/newpagejs/bootstrap.min.js"></script>
    <script src="<%=path%>/js/newpagejs/jquery.metisMenu.js"></script>
	<script src="<%=path%>/js/newpagejs/easypiechart.js"></script>
	<script src="<%=path%>/js/newpagejs/easypiechart-data.js"></script> 
    <script src="<%=path%>/js/newpagejs/custom-scripts.js"></script> --%>

   <script type="text/javascript">
            /**
                               权限全局监控，勿动！
            **/
          $(document).ready(function () {
	              var ruguan='<li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#" aria-expanded="false"><i class="fa fa-envelope fa-fw"></i> <i class="fa fa-caret-down"></i></a><ul class="dropdown-menu dropdown-messages"><li><a href="<%=path%>/borrows/regular.do"><div><strong>借书规则</strong><span class="pull-right text-muted"><em>管理员</em></span></div><div>关于图书馆借书规定，新手必看</div></a></li><li class="divider"></li> <li><a href="<%=path%>/sys/intolibstu.do"><div><strong>入馆教育</strong><span class="pull-right text-muted"><em>管理员</em></span></div><div>这是关于图书馆入馆教育的教学视频</div></a></li></ul></li>';
                  var xinshu ='<li class="dropdown"> <a class="dropdown-toggle" data-toggle="dropdown" href="#" aria-expanded="false"><i class="fa fa-bell fa-fw"></i> <i class="fa fa-caret-down"></i> </a><ul class="dropdown-menu dropdown-alerts"> <li><a  href="<%=path%>/books/collectionList.do"><div><i class="fa fa-user fa-fw"></i> 我的收藏 </div></a> </li><li class="divider"></li><li> <a href="<%=path%>/borrows/like.do"> <div> <i class="fa fa-twitter fa-fw"></i> 猜你喜欢</div></a> </li><li class="divider"></li> <li> <a href="<%=path%>/borrows/list.do"><div><i class="fa fa-envelope fa-fw"></i> 借阅历史</div></a></li><li class="divider"></li><li><a href="<%=path%>/books/newall.do"><div><i class="fa fa-tasks fa-fw"></i>新书推荐</div></a></li> <li class="divider"></li><li class="online-message"><a href="#"> <div> <i class="fa fa-upload fa-fw"></i> 在线留言</div> <div class="second-menu"><ul><li> <i class="fa fa-twitter fa-fw"></i><a href="#">微信：sj420119317</a></li><li> <i class="fa fa-twitter fa-fw"></i><a  target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=1029718215&site=qq&menu=yes"><img border="0" src="http://wpa.qq.com/pa?p=2:1029718215:51" alt="点击这里给我发消息" title="点击这里给我发消息"/></a></li><li> <i class="fa fa-twitter fa-fw"></i><a href="<%=path%>/sys/leavesmg.do">在线留言</a></li></ul></div></a></li></ul></li>';
                  
                  var user="${loginUser.urName}";
                  var userType="${loginUser.urType}";
          if(user.length>1){
             localStorage.setItem("name",user);
              localStorage.setItem("userType",userType);
           }
           console.log(localStorage.getItem("userType"))
            if(localStorage.getItem("userType")==1){
                 $("#dropdownDIV").html(ruguan+xinshu+$("#dropdownDIV").html());
               }
               
             $("#loginName").html(localStorage.getItem("name"));
              
              $.ajax({
              url:'<%=path%>/menu/menus.do',
              type:'POST',
              dataType:'json',
              success:function(data){
              localStorage.setItem("menulist",data);
                var html="";
                var concurrent= window.location.pathname;//当前url
                var moudeurl= concurrent.substring(6,concurrent.length);//那个项目模块
                var  moude=moudeurl.split("/")[0];
                 console.log(moude);
              for(var i=0;i<data.length;i++){
               var charhtml="";//子菜单
               var cahrarr=data[i].menus;
               
               var hander='<ul class="nav nav-second-level">';//子菜单头
               var footer='</ul>';//子菜单脚
               charhtml=hander;
                for(var l=0;l<cahrarr.length;l++){
                    charhtml=charhtml+'<li ><a href="<%=path%>'+cahrarr[l].menuUrl+'"><i class="'+cahrarr[l].menuImg+'"></i>'+cahrarr[l].menuName+'</a></li>';
                 }
                 charhtml=charhtml+footer;
                 //父级菜单
                  var url= '/xyes'+data[i].menuUrl;
                  console.log(url);
              // if(url.indexOf(moude)>0){//判断当前页面在那个功能模块里面
              //  html=html+'<li><a class="active-menu" href="<%=path%>'+data[i].menuUrl+'"><i class="'+data[i].menuImg+'"></i>'+data[i].menuName+'</a>'+charhtml+'</li>';
              //  }else{
                 if(cahrarr.length==0){
                  html=html+'<li ><a  href="<%=path%>'+data[i].menuUrl+'"><i class="'+data[i].menuImg+'"></i>'+data[i].menuName+'</a>'+charhtml+'</li>';
                 }else{
                  html=html+'<li class="active" ><a  href="#"><i class="'+data[i].menuImg+'"></i>'+data[i].menuName+'<span class="fa arrow"></span></a>'+charhtml+'</li>';
                 }
                
               // }
               }
             
              $("#main-menu").html(html);
              },
              error:function(ero){
              },
              });
         });
         
    </script>
   
