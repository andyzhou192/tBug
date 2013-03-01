<%@ page contentType="text/html; charset=UTF-8" language="java"
	import="java.util.*" pageEncoding="UTF-8"%>
<%
	List<String> contentTitleList = (List<String>)request.getAttribute("contentTitle");
	List<String> contentTextList = (List<String>)request.getAttribute("contentText");
	String pageName = (String)request.getAttribute("pageName");
%>

<div id="contentWidgets">
	<ul id="contentWidget" class="contentWidget">
		<%
					if(contentTitleList!=null){
						for(int i = 0; i < contentTitleList.size(); i++){	
							String title = contentTitleList.get(i);
							String content = contentTextList.get(i);
							if(title == null || "".equals(title)){
								continue;
							} else{
								//out.print("<li id='content" + i + "' name='content" + i + "' class='widget color-blue'><form name='widgetForm1' method='post' action='' enctype='multipart/form-data'><div id='title' class='widget-head'><h3>"+ title +"</h3></div><div id='content' class='widget-content'><p>" + content + "</p></div></form></li><br/>");
								out.print("<li id='content-widget"+i+"'><h3>"+ (i+1) + "、" + title +"</h3><div id='content' class='widget-content'><p>" + content + "</p></div></li><br/>");
							}
						}
					}
  					
					%>

	</ul>
</div>