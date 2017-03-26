<%@ page language="java" import="java.util.*,com.yxm.im.*" pageEncoding="utf-8"%>
<%
  String path = request.getContextPath();
  String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
  request.setCharacterEncoding("UTF-8");
  String info = request.getParameter("info");
 String answer =  ChatsUtils.getMessage(info);
  out.print(answer);
%>