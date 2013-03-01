package net.taobao.tbug.servlet;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import net.taobao.tbug.util.DownloadFile;
import net.taobao.tbug.util.UploadUtil;
import net.taobao.tbug.util.readexcel.Read2007Excel;
import net.taobao.tbug.util.readexcel.impl.Read2007ExcelImpl;

/**
 * Servlet implementation class InitServlet
 */
public class InitServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InitServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/x-msdownload;charset=utf-8");
		
		request.setAttribute("edit", request.getParameter("edit"));
		
		Read2007Excel read2007Excel = new Read2007ExcelImpl();
		File file = new File((new File(UploadUtil.getDataPath())) + "/data.xlsx");
		XSSFWorkbook xwb = new XSSFWorkbook(new FileInputStream(file));
		
		//获取页头一级菜单
		List<String> navigationList = read2007Excel.getSheetNames(xwb);
		String page = request.getParameter("page"); 
		int sheetIndex = 0;
		int coluIndex = 0;
		if(null != page || "".equals(page)){
			if(page.contains("-")){
				sheetIndex = Integer.parseInt(page.split("-")[0]);
				coluIndex = Integer.parseInt(page.split("-")[1]);
			}
		}
		XSSFSheet sheet = null;
		int pageIndex = 0;
		if(sheetIndex < 1){
			sheet = xwb.getSheetAt(0);
		} else {
			pageIndex = (sheetIndex - 1) % xwb.getNumberOfSheets();
			sheet = xwb.getSheetAt(pageIndex);
		}
		
		if(sheet.getSheetName().contains("下载中心")){
			request.setAttribute("isdownload", 1);
		}
		
		// 获取页头二级菜单
		List<List<Object>> secondNavLists = new ArrayList<List<Object>>();
		if(navigationList != null && navigationList.size() > 0){
			for(int i = 0; i < navigationList.size(); i++){
				secondNavLists.add(read2007Excel.getRowContent(xwb.getSheetAt(i), 0));
			}
		} else {
			System.out.println("===>navigationList为空！");
		}
		
		String name = (String) secondNavLists.get(pageIndex).get(coluIndex);//read2007Excel.getCellContent(sheet, 0, coluIndex * 2);
		List<Object> contentTitle = read2007Excel.getColumnContent(sheet, coluIndex);
		List<Object> contentText = read2007Excel.getColumnContent(sheet, coluIndex + 1);
		
		request.setAttribute("navigationList", navigationList);
		request.setAttribute("secondNavLists", secondNavLists);
		request.setAttribute("pageName", name);
		request.setAttribute("contentTitle", contentTitle);
		request.setAttribute("contentText", contentText);
		
		/**
		 * 获取文件下载列表
		 */
		String fileName = request.getParameter("file");
		
		if(fileName != null){
			if("data".equals(fileName)){
				response.setHeader("Content-Disposition","attachment; filename=data.xlsx");
				OutputStream dataOutputStream = response.getOutputStream();
				DownloadFile.download("data.xlsx", dataOutputStream, "data");
			}else{
				String fn = new String(fileName.getBytes("ISO-8859-1"),"utf-8");
				response.setHeader("Content-Disposition","attachment; filename=" + fn + "");
				OutputStream outputStream = response.getOutputStream();
				DownloadFile.download(fn, outputStream, "");
			}
		}else{
		    request.setAttribute("downloadFileList", DownloadFile.getFileList());
		}

		// 跳回原頁面
		RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/index.jsp");
		dispatcher.forward(request, response);
	}

}
