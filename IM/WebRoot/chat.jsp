<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!doctype html><!--申请文档为html-->
<html>
     <head>
       <!--声明当前页面编码集:中文编码GBK,国际编码(utf-8)-->
       <meta http-equiv="Content-Type" content="text/htmml;charset=utf-8">
       <!--声明当前网页三要素-->
       <title>Java开发人工智能实战系统(图灵机器人)</title>
       <meta name="keywords" content="关键词,关键词"><!--用户在搜索引擎中搜寻奥-->
       <meta name="description" content="图灵机器人"><!--搜索到的标描述-->

       <!--css/js-->
       <!--css:层叠样式表,类似于一件外衣一样-->
       <style type="text/css">
          /*为保证各浏览器边框显示一致,我们去掉内外边框,用"*"代表所有*/
         *{margin: 0;padding: 0;}
         body{background: url("images/bg.jpg");background-size: cover;font-size: 12px;font-family: "微软雅黑";color: #666;overflow: hidden;}
         .chat{height: 500px;width:900px;background:#EFE4B0;
               /*
                设置离上下边框方式是：
                margin:上 右 下 左;
                margin:垂直 水平;
                margin:全部;
               */
               margin: 50px auto;/**/

         }

         .chat .c-title{height: 68px;background: #2D8EF2;line-height:68px;font-size: 18px;color: #ffffff;padding-left: 10px;}

         .chat .c-content{height: 380px;background: #E7E5EB;overflow: auto;}
         .chat .c-message{height:82px;background: #DCDADC;}
         .chat .c-content .c-left img{vertical-align: middle;}
         .chat .c-content .c-left{padding: 20px;}
         .chat .c-content .c-right{text-align: right;}
         .chat .c-content .c-right img{border-radius: 25px;vertical-align: middle;}
         .chat .c-message .c-box{width: 780px;height: 62px;background: #dedede;outline: none;padding: 10px;float: left;}
         .chat  .c-message .c-send .c-btn{width: 100px;height: 82px;border: none;float: right;cursor: pointer;outline: none;background: #b7b7b7}
         /*********
         基于css3的拖动条
         **********/
          ::-webkit-scrollbar{width: 5px;height: 6px;background: #ccc;}
          ::-webkit-scrollbar-button{background-color: #e5e5e5;}
          ::-webkit-scrollbar-track{background: #999}
          ::-webkit-scrollbar-track-piece{background: #ccc}
          ::-webkit-scrollbar-thumb{background: #666}
          ::-webkit-scrollbar-corner{background: #82AFFF}
          ::-webkit-scrollbar-resizer{background: #FF0BEE}
          scrollbar{-moz-appearance:none !important;background: rgb(0,255,0) !important;}
          scrollbarbutton{-moz-appearance:none !important;background-color: rgb(0,0,255) !important;}
          scrollbarbutton:hover{-moz-appearance:none !important;background-color: rgb(255,0,0) !important;}

       </style>
     </head>

<body>
    <!--div:层,盒子,容器-->
    <!--
     命名规则:
     1.见名知意
     2.不能以数字开头
     3.使用"-","_"命名
    -->
    <div class = "chat">
        <div class = "c-title">人工智能客服IM系统</div>
        <div class = "c-content"></div>
        <div class = "c-message">
              <div class="c-box" id="c-box-msg"  contenteditable="true"></div>
              <div class = "c-send">
                  <input type = "button" id = "c-send" class = "c-btn" value = "发送">
              </div>
        </div>
    </div>
<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
<script type="text/javascript">
/***
 * ajax异步获取数据
 */
 $("#c-send").click(
   function send(){
	   var value=$("#c-box-msg").text();
	   var htmlRight="<div class=\"c-right\">"+value+"<img src=\"images/me.jpg\" alt=\"我\" width = \"50px\" height = \"50px\"></div>";
	   $(".c-content").append(htmlRight);
	  
	   $.ajax({
		   url:"data.jsp",
		   type:"post",
		   data:{info:value},
		   success:function(jsonObj){
			   var msg=JSON.parse(jsonObj);
			   var htmlLeft="<div class=\"c-left\"><img src=\"images/robot.png\" alt=\"京东机器人\" width = \"50px\" height = \"50px\">"+msg.text+"</div>";
			   $(".c-content").append(htmlLeft);
			   $("#c-box-msg").text("");
		   }
	   });
   }		 
 );
</script>
</body>
</html>






















