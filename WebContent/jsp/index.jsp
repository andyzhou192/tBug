<%@ page contentType="text/html; charset=UTF-8" language="java"
	import="java.util.*" pageEncoding="UTF-8"%>
	
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<base href="<%=basePath%>">
    
    <title>tBug API</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta http-equiv="Content-Type" content="text/html;charset=utf-8">
	
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/main.css" charset="UTF-8"></link>
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/top_menu.css" charset="UTF-8"></link>
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/left_navigation.css" charset="UTF-8"></link>
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/content_widget.css" charset="UTF-8"></link>

	<script type="text/javascript">
		$(document).ready(function(){
			$('.pson').click( function(){
				if($(this).hasClass('psoff')) {   
					$(this).removeClass("psoff");
					$(this).parent().parent().find('.poltxt').hide();
				} else {
					if(!$(this).hasClass('psoff')) {		
						$(this).addClass("psoff");
						$(this).parent().parent().find('.poltxt').show();
					}				
				}
			});
			
			$(".contentIndex").mouseover( function(){
			  $(this).addClass("bg");
			}).mouseout(function(){$(this).removeClass("bg")});
		});
	</script>
</head>
<body bgcolor="#e5e5e5" style="width: 100%; height: 100%; overflow: auto;" >
	<DIV id="top-header-menu" align="center" style="background-image:url(/tBug/img/head.jpg); height: 100px; width:100%; margin-left: 20px; margin-top: 0px; margin-right: 20px; position: relative;">
		<jsp:include page="branch/top_menu.jsp"></jsp:include>
	</DIV>
	
	<div style="position: relative;">
	<%
		String edit = (String)request.getAttribute("edit");
		if(edit != null){
			if("true".equals(edit)){
	%>
	<DIV id="content" align="center" style="background-color: #e9e9e9; margin-left: 200px; width: 80%; margin-right:1.5%; margin-top: 20px; position: relative;">
		<DIV id="upload" align="left" style="display: inline; margin-left: 15px;">
			<jsp:include page="branch/upload.jsp"></jsp:include>
		</DIV>
	</DIV>
	<%
			}
		} else if(null != request.getAttribute("isdownload") && Integer.parseInt(request.getAttribute("isdownload").toString()) == 1){
	%>
	
	<DIV id="content" align="center" style="background-color: #e9e9e9; margin-left: 200px; width: 80%; margin-right:1.5%; margin-top: 20px; position: relative;">
		<DIV id="download" align="left" style="display: inline; margin-left: 15px;">
			<jsp:include page="branch/download_widget.jsp"></jsp:include>
		</DIV>
	</DIV>
	
	<%}else{ %>
	<DIV id="navigation" align="left" style="position: absolute; width: 150px; margin-left: 1.5%; z-index: 2; top: 20px;">
		<jsp:include page="branch/left_navigation.jsp"></jsp:include>
	</DIV>

	<DIV id="content" align="right" style="background-color: #e9e9e9; margin-left: 200px; width: 80%; margin-right:1.5%; margin-top: 20px; position: absolute;">
		<DIV id="contentText" align="left" style="display: inline; margin-left: 15px; width: 90%;">
			<jsp:include page="branch/content_widget.jsp"></jsp:include>
		</DIV>
	</DIV>
	<%} %>
	</div>

	<DIV id="footer" style="font-size: 12px; padding: 5px; height: 100px; width: 100%; margin-left: 20px; margin-right: 20px; bottom: -450px; position: relative; text-align: center;border-top: 2px dashed #ccc;">
		<p>淘宝tBug  @2013 Taobao.com版权所有</p>
	</DIV>
	
	<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery-1.2.6.min.js"></script> 
	<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery-ui-personalized-1.6rc2.min.js"></script> 
</body>
</html>