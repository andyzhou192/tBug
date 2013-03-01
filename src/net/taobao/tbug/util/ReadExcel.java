package net.taobao.tbug.util;

import java.io.File;
import java.io.IOException;
import java.util.List;

import net.taobao.tbug.util.readexcel.Read2003Excel;
import net.taobao.tbug.util.readexcel.Read2007Excel;
import net.taobao.tbug.util.readexcel.impl.Read2007ExcelImpl;

public class ReadExcel {

	Read2003Excel read2003Excel = new Read2003Excel();
	Read2007Excel read2007Excel = new Read2007ExcelImpl();

	/**
	 * 对外提供读取excel 的方法
	 * */
	public List<List<List<Object>>> readExcel(File file) throws IOException {
		String fileName = file.getName();
		String extension = fileName.lastIndexOf(".") == -1 ? "" : fileName
				.substring(fileName.lastIndexOf(".") + 1);
		if ("xls".equals(extension)) {
			return read2003Excel.read2003Excel(file);
		} else if ("xlsx".equals(extension)) {
			return read2007Excel.readExcelAllContent(file);
		} else {
			throw new IOException("不支持的文件类型");
		}
	}

//	public static void main(String args[]) {
//		File file = new File("D:/workspace/tBug/WebContent/data/data.xlsx");
//		List<List<List<Object>>> content = null;
//		try {
//			content = readExcel(file);
//		} catch (IOException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//	}
}
