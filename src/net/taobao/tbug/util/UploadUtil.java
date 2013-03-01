package net.taobao.tbug.util;

import java.io.File;
import java.io.IOException;
import java.net.URL;

/**
 * 用于文件上传的实用类
 * @author: zhouyelin
 * @date: 2013-2-1 上午 10:20:47
 */
public final class UploadUtil{
	private static URL base = UploadUtil.class.getResource("");
	
	public static String getBasePath(){
		String basePath = null;
		try {
			basePath = (new File(base.getFile(),"../../../../../..").getCanonicalPath());
		} catch (IOException e) {
			e.printStackTrace();
		}
		return basePath;
	}
	
	/**
	 * 获得上传根路径
	 */
	public static String getUploadBasePath() {
		return (getBasePath() + "/upload");
	}	

	/**
	 * 取得data上传路径
	 * @return
	 */
	public static String getDataPath() {
		return (getBasePath() + "/data/");
	}
	
	/**
	 * 获得APP上传路径
	 */
	public static String getUploadAppPath() {
		return (getUploadBasePath() + "/app/");
	}

	/**
	 * 获得SDK上传路径
	 */
	public static String getUploadSDKPath() {
		return (getUploadBasePath() + "/sdk/");
	}

	/**
	 * 获得图片上传路径
	 */
	public static String getUploadPicPath() {
		return (getUploadBasePath() + "/picture/");
	}

}