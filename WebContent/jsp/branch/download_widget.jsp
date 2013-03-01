<%@ page contentType="text/html; charset=UTF-8" language="java"
	import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	List<String> fileList = (List<String>)request.getAttribute("contentTitle");
	List<String> fileDescList = (List<String>)request.getAttribute("contentText");
	Map<String, String> downloadFileList = (Map<String, String>)request.getAttribute("downloadFileList");
	String pageName = (String)request.getAttribute("pageName");
%>

<div id="download-list">
	<table border="1" style="width: 80%;">
			<tr bgcolor="#33DD99">
				<th>文件</th>
				<th>描述</th>
				<th>下载</th>
			</tr>
			<%
				for(int i = 0; i < fileList.size(); i++){
					String fileName = fileList.get(i);
					String fileDesc = fileDescList.get(i);
					if(null != fileName && fileName.length() > 0){
						if(null != downloadFileList && downloadFileList.containsKey(fileName)){
							if(fileDesc == null)
								fileDesc = "暂无描述！";
			%>
			<tr>
				<td><%=fileName %></td>
				<td><%=fileDesc %></td>
				<td align="center"><a style="font-size:15px; border: 3px outset #EFEFEF; background-color: silver;" href="index.do?file=<%=downloadFileList.get(fileName) %>">下载</a></td>
			</tr>
			<%}}} %>
	</table>

<!-- 
	<fieldset style="background-color: silver; width: 95%; margin-left: 15px; margin-top: 20px;">
		<legend style="background-color: yellow;">APP下载列表</legend>
		<ul>
			<% /**
						List<String> sdkList = (List<String>)request.getAttribute("sdkList");	
						if(sdkList!=null){
							for(String str:sdkList){	
								out.print("<li><a href='index.do?file="+str+"'>"+str+"</a></li>");
							}
						}
					**/%>
		</ul>
	</fieldset> -->
	
	<!-- enctype属性为表单定义了MIME编码方式，上传文件的表单enctype属性必须如此设置 -->
	<% /**
		String edit = (String)request.getAttribute("edit");
		if(edit != null){
			if(edit == "true"){
				out.print("<form method='post' action='" + path + "/UploadFile?tab=sdk' enctype='multipart/form-data' style=' margin-left: 15px; display: none;'><input type='file' name='myfile1' value='浏览文件...' /><input type='submit' value='上传' /></form>");
			} else {
				out.print("<form method='post' action='" + path + "/UploadFile?tab=sdk' enctype='multipart/form-data' style=' margin-left: 15px; display: inline;'><input type='file' name='myfile1' value='浏览文件...' /><input type='submit' value='上传' /></form>");
			}
		}**/
	%>
</div>
