<%@ page contentType="text/html; charset=UTF-8" language="java"
	import="java.util.*" pageEncoding="UTF-8"%>

	<DIV id="content" align="center" style="background-color: #e9e9e9; margin-left: 1.5%; width: 80%; margin-right:1.5%; margin-top: 20px; position: relative;">
		<fieldset id="contentIndex" class="contentIndex" style="background-color: #f6f6f6; width: 100%; padding: 5px; margin: 20px;">
			<legend>APP上传</legend>
			<form method='post' action='<%=request.getContextPath() %>/UploadFile?type=app' enctype='multipart/form-data'>
				<input type='file' name='appfile' value='浏览APP' />
				<input type='submit' value='上传' />
			</form>
		</fieldset>
		<fieldset id="contentIndex" class="contentIndex" style="background-color: #f6f6f6; width: 100%; padding: 5px; margin: 20px;">
			<legend>SDK上传</legend>
			<form method='post' action='<%=request.getContextPath() %>/UploadFile?type=sdk' enctype='multipart/form-data'>
				<input type='file' name='sdkfile' value='浏览SDK' />
				<input type='submit' value='上传' />
			</form>
		</fieldset>
		<fieldset id="contentIndex" class="contentIndex" style="background-color: #f6f6f6; width: 100%; padding: 5px; margin: 20px;">
			<legend>图片上传</legend>
			<form method='post' action='<%=request.getContextPath() %>/UploadFile?type=pic' enctype='multipart/form-data'>
				<input type='file' name='picfile' value='浏览图片' />
				<input type='submit' value='上传' />
			</form>
		</fieldset>
		<fieldset id="contentIndex" class="contentIndex" style="background-color: #f6f6f6; width: 100%; padding: 5px; margin: 20px;">
			<legend>data上传/下载</legend>
			<form method='post' action='<%=request.getContextPath() %>/UploadFile?type=data' enctype='multipart/form-data'>
				<input type='file' name='datafile' value='浏览data' />
				<input type='submit' value='上传' />
				<a style="font-size:15px; border: 3px outset #EFEFEF; background-color: silver;" href="index.do?file=data">下载</a>
			</form>
			
		</fieldset>
	</DIV>
