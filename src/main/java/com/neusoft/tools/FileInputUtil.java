package com.neusoft.tools;

import java.io.File;
import java.io.FileOutputStream;

public class FileInputUtil {
	private String path;
	public FileInputUtil(String path) {
		this.path = path;
	}
	public void writeToTXT(String str){
		FileOutputStream o = null;
		//String path=System.getProperty("catalina.home") + "/" + "webapps/upload/";
		//System.out.println(path);
//		String path = "";
		String filename="rating.txt";
		byte[] buff = new byte[]{};
		try{
		File file = new File(path+"/"+filename);
//		System.out.println(file.getAbsolutePath());
		if(!file.exists()){
		file.createNewFile();
		}
		buff=str.getBytes();
		o=new FileOutputStream(file,true);
		o.write(buff);
		o.flush();
		o.close();
		}catch(Exception e){
		e.printStackTrace();
		}
	}
	
	/*public static void main(String[] args) {
		FileInputUtil util = new FileInputUtil();
		util.writeToTXT("\r\n" + "2,10,5.0");
	}*/
}
