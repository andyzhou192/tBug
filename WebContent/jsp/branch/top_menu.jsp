<%@ page contentType="text/html; charset=UTF-8" language="java" import="java.util.*" pageEncoding="UTF-8"%>
<DIV id="contentMenu">
	<ul id="top-menu">	
	<%
		List<String> navigationList = (List<String>)request.getAttribute("navigationList");
		List<List<String>> secondNavLists = (List<List<String>>)request.getAttribute("secondNavLists");
		if(navigationList!=null){
			for(int i = 0; i < navigationList.size(); i++){
				String nav = navigationList.get(i);
				if(secondNavLists.get(i) != null){
					out.print("<li><a href='javascript:void(0)'>"+nav+"</a><ul class='top-sec-menu'>");
					for(int j = 0; j < secondNavLists.get(i).size(); j++){
						out.print("<li><a href='/tBug/index.do?page="+(i+1)+"-"+j+"'>"+secondNavLists.get(i).get(j)+"</a></li>");
					}
					out.print("</ul></li>");
				}
//				int index = i + 1;
//				out.print("<li class='navigationItem'><a href='/tBug/index.do?page="+index+"'>"+nav+"</a></li>");
			}
		}
	%>
<!-- 
		<li>
			<A href="javascript:void(0)">tBug APP</A>
			<UL class="top-sec-menu" id="app-intro-menu">
				<LI><A href="javascript:void(0)" onfocus="this.blur();" onclick="turnto('1');">简介</A></LI>
				<LI><A href="javascript:void(0)" onfocus="this.blur();" onclick="turnto('1');">功能预览</A></LI>
				<LI><A href="javascript:void(0)" onfocus="this.blur();" onclick="turnto('1');">使用指南</A></LI>
				<LI><A href="javascript:void(0)" onfocus="this.blur();" onclick="turnto('1');">下载入口</A></LI>
				<LI><A href="javascript:void(0)" onfocus="this.blur();" onclick="turnto('1');">开发团队</A></LI>
			</UL>
		</li>
		<li>
			<A href="javascript:void(0)">tBug API&SDK</A>
			<UL class="top-sec-menu" id="api-sdk-menu">
				<LI><a onfocus="this.blur();" onclick="turnto('1');">iOS</a></LI>
				<LI><a onfocus="this.blur();" onclick="turnto('1');">Android</a></LI>
			</UL>
		</li>
		<li>
			<A href="javascript:void(0)">下载中心</A>
			<UL class="top-sec-menu" id="download-menu">
				<LI><A href="javascript:void(0)" onfocus="this.blur();" onclick="turnto('1');">APP下载</A></LI>
				<LI><A href="javascript:void(0)" onfocus="this.blur();" onclick="turnto('1');">SDK下载</A></LI>
				<LI><A href="javascript:void(0)" onfocus="this.blur();" onclick="turnto('1');">SDK Demo下载</A></LI>
			</UL>
		</li>
		<li>
			<A href="javascript:void(0)">tBug数据</A>
			<UL class="top-sec-menu" id="data-menu">
				<LI><A href="javascript:void(0)" onfocus="this.blur();" onclick="turnto('1');">用户数据</A></LI>
				<LI><A href="javascript:void(0)" onfocus="this.blur();" onclick="turnto('1');">Bug管理数据</A></LI>
			</UL>
		</li>
		<li>
			<A href="javascript:void(0)">反馈</A>
			<UL class="top-sec-menu" id="feedback-menu">
				<LI><A href="javascript:void(0)" onfocus="this.blur();" onclick="turnto('1');">问题反馈</A></LI>
				<LI><A href="javascript:void(0)" onfocus="this.blur();" onclick="turnto('1');">建议反馈</A></LI>
			</UL>
		</li> -->
	</ul>
</DIV>