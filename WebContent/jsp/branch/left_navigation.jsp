<%@ page contentType="text/html; charset=UTF-8" language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%String path = request.getContextPath(); %>
<%
	List<String> contentTitleList = (List<String>)request.getAttribute("contentTitle");
	List<String> contentTextList = (List<String>)request.getAttribute("contentText");
	String pageName = (String)request.getAttribute("pageName");
%>
<!-- <div align="left" style="font-size: 20px; font-style: inherit; background-color: #e77f22;"><b>导航>></b></div>
<ul id="navigationList">-->
	<%
//		List<String> navigationList = (List<String>)request.getAttribute("navigationList");
//		if(navigationList!=null){
//			for(int i = 0; i < navigationList.size(); i++){
//				String nav = navigationList.get(i);
//				int index = i + 1;
//				out.print("<li class='navigationItem'><a href='/tBug/index.do?page="+index+"'>"+nav+"</a></li>");
//			}
//		}
	%>
		
<!-- </ul>-->
		
<%
//	String edit = (String)request.getAttribute("edit");
//	if(edit != null){
//		if(edit != "true"){
//			out.print("<a href='index.do?file=data'>下载Excel</a><form method='post' action='" + path + "/UploadFile?tab=data' enctype='multipart/form-data' style=' margin-left: 5px; display: inline;'><input type='file' name='dataFile' style=' width: 170px;' value='浏览文件...' /><br/><input type='submit' style=' margin-left: 115px;' value='上传' /></form>");
//		} 
//	} 
//  (String)request.getAttribute("javax.servlet.forward.request_uri")  //输出结果：/tBug/index.do
//  request.getQueryString()  //获取url参数
%>
<fieldset id="contentIndex" class="contentIndex" style="background-color: #f6f6f6; width: 150px; margin-left: 3px;">
	<legend><%=pageName %></legend>
	<ul class="poltxt">
		<%
					if(contentTitleList!=null){
						for(String str:contentTitleList){	
							if(str != null || "".equals(str)){
								int index = contentTitleList.indexOf(str);
								String uri = "index.do";
								//判断当前url是否有参数
								 if(request.getQueryString()!=null && !"".equals(request.getQueryString())){
								      uri += ("?" + request.getQueryString());
								 }
								out.print("<li><a href='"+uri+"#content-widget" + index + "'>"+ (index+1) + "、" + str+"</a></li>");
							} else{
								continue;
							}
						}
					}
					%>

	</ul>
</fieldset>