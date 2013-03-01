package net.taobao.tbug.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.Map;

public class DownloadFile {

	/**
	 * 下载文件
	 * @param fileName
	 * @param outputStream
	 * @throws IOException
	 */
	public static void download(String fileName, OutputStream outputStream, String flag) throws IOException{
		String dataPathname = null;
		if("data".equals(flag)){
			dataPathname = UploadUtil.getDataPath() + File.separator + fileName;
		} else {
			dataPathname = UploadUtil.getUploadBasePath() + File.separator + fileName;
		}
		
		InputStream dataInputStream = new FileInputStream(dataPathname);
		byte[] buffer = new byte[1024];
		int i = -1;
		while ((i = dataInputStream.read(buffer)) != -1) {
			outputStream.write(buffer, 0, i);
		}
		outputStream.flush();
		outputStream.close();
		outputStream.close();
		outputStream = null;
	}
	
	/**
	 * 获取上传文件夹upload下的所有文件列表
	 * @return
	 */
	public static Map<String, String> getFileList(){
		Map<String, String> fileListInServer = new HashMap<String, String>(); 
		File dir = new File(UploadUtil.getUploadBasePath());
	    File[] children = dir.listFiles();
	    if (children != null) {
	        for (int i = 0; i < children.length; i++) {
	        	if(children[i].isDirectory()){
	        		String[] fileNames = children[i].list();
	        		for(int j = 0; j < fileNames.length; j++){
	        			fileListInServer.put(fileNames[j], children[i].getName() + "/" + fileNames[j]);
	        		}
	        	}
	        	fileListInServer.put(children[i].getName(), children[i].getName());	            
	        }
	    }
		return fileListInServer;
	}
}
