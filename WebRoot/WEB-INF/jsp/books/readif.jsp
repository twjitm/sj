<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% String path = request.getContextPath(); String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<jsp:include page="../main/corepage.jsp"></jsp:include>
<div ><!--http://download.csdn.net/source/preview/4999810/8698b37649e096c9d1981afb323391d1  -->
<c:if test="${type==0}">
<iframe width='100%' height='100%' scrolling='no' frameborder='0' src='<%=path%>${books.pdfurl}'></iframe>

</c:if>
	<c:if test="${type==1}">
<iframe width='100%' height='100%' scrolling='no' frameborder='0' src='<%=path%>${periodicals.pdfurl}'></iframe>

</c:if>
<c:if test="${type==2}">
<iframe width='100%' height='100%' scrolling='no' frameborder='0' src='<%=path%>${papers.pdfurl}'></iframe>

</c:if>
		
</div>

