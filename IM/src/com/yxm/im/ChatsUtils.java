package com.yxm.im;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;

/**
 * 聊天工具类
 * @author yxm
 * 
 */
public class ChatsUtils {
	/**
	 * 根据输入的内容返回聊天机器人的信息
	 * @param message
	 * @return
	 */
	public static String getMessage(String message){
		StringBuffer bf = new StringBuffer();
		try {
			//设置请求编码格式utf-8
			String question = URLEncoder.encode(message,"utf-8");
			//请求url对接图灵机器人
			String requestURL = "http://www.tuling123.com/openapi/api?key=b161b7bffe5843e6bc458b123be30ecc&info="+question;
			URL url = new URL(requestURL);
			//获取链接对象
			URLConnection conn = url.openConnection();
			//直接开始链接
			conn.connect();
			
			//获取请求结果
			InputStreamReader reader = new InputStreamReader(conn.getInputStream(),"utf-8");
		
			//建立缓冲写入流
			BufferedReader br = new BufferedReader(reader);
			String temp;
			while ((temp=br.readLine())!=null) {
				bf.append(temp);
			}
			
			br.close();
			reader.close();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return bf.toString();
	}
	public static void main(String[] args) {
		String message = getMessage("你好");
		System.out.println(message);
	}
}
