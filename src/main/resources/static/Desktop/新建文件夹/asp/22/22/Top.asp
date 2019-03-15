<!--#include file="ConnUser.asp"-->
<!--#include file="inc/config.asp"-->
<!--#include file="char.inc"-->
<SCRIPT src="inc/menu_fun.js"></SCRIPT>
<noscript><iframe scr="*"></iframe></noscript>
<script language=javascript>
function CheckFormUserLogin()
{
	if(document.UserLogin.UserName.value=="")
	{
		alert("请输入用户名！");
		document.UserLogin.UserName.focus();
		return false;
	}
	if(document.UserLogin.Passwd.value == "")
	{
		alert("请输入密码！");
		document.UserLogin.Passwd.focus();
		return false;
	}
	if(document.UserLogin.verifycode.value == "")
	{
		alert("请输入验证码！");
		document.UserLogin.verifycode.focus();
		return false;
	}
}
</script>
<SCRIPT language="JavaScript" type="text/javascript">
    // Begin morelink
      function morelink(morelink)
      {
        url = 'MoreLink.asp?linktype=1';
        window.open(url,morelink);
      }
    // End morelink-->
 // Begin linkreg
      function linkreg(linkreg)
      {
        url = 'LinkReg.asp';
        window.open(url,linkreg);
      }
    // End linkreg-->
// Begin vote
      function vote(vote)
      {
        url = 'E_Vote.asp?stype=view';
        window.open(url,vote);
      }
    // End vote-->
// Begin adduser
      function adduser(adduser)
      {
        url = 'AddUser.asp';
        window.open(url,adduser);
      }
    // End adduser-->
// Begin getpwd
      function getpwd(getpwd)
      {
        url = 'GetPwd.asp';
        window.open(url,getpwd);
      }
    // End getpwd-->
</script>

<%		'获取当前 URL
dim ViewUrl
if Request.ServerVariables("QUERY_STRING")<>"" then
	ViewUrl=Request.ServerVariables("url") &"?"& Request.ServerVariables("QUERY_STRING")&""
else
	ViewUrl=Request.ServerVariables("url") &""
end if
response.cookies(eChsys)("ViewUrl")=ViewUrl%>

<%if topbg=1 then %>
<script src="clearevents.js"></script>
<%end if%>
<%if R_BG=1 then %>
<SCRIPT language=JavaScript src="Float_AD.asp"></SCRIPT>
<%end if%>
<div class=header>

<div class="login white_tit float_left">
<!--登录表单-->
<%if Request.cookies(eChsys)("username")="" then%>
        <%
		Function getcode1()
			Dim test
			On Error Resume Next
			Set test=Server.CreateObject("Adodb.Stream")
			Set test=Nothing
			If Err Then
				Dim zNum
				Randomize timer
				zNum = cint(8999*Rnd+1000)
				Session("verifycode") = zNum
				getcode1= Session("verifycode")		
			Else
				getcode1= "<img src=""getcode.asp"">"		
			End If
		End Function
		%>
<form method="POST" action="ChkLogin.asp" name="UserLogin" onSubmit="return CheckFormUserLogin();">
           用户：
          <input name="UserName" style="width:80px;height:16px;border:1px solid #9FAABF">
          密码：
          <input name="Passwd" type="password" style="width:80px;height:16px;border:1px solid #9FAABF">
          验码：
          <input name="verifycode" type="text"  style="width:50px;height:16px;border:1px solid #9FAABF" >
          <%=getcode1()%>
		  <input name="Submit" type="image" src="images/login.gif" width="38" height="18" border="0" align="absmiddle"/>
		  <%if reg=1 then%>
		  <a href="javascript:adduser()"><img src="images/reg.gif" width="38" height="18" border="0"  align="absmiddle"/></a>
          <%end if%>
</form>
        <%else%>
         欢迎：<%=Request.cookies(eChsys)("UserName")%>
            <%if db_Birthday_Select="EChuang" then		'性别字段是原E创字段%>
            <%=Request.cookies(eChsys)("sex")%>
            <%else
				if db_Birthday_Select="Text" then		'性别字段是BBS的文本型阿拉伯数字
					if Request.cookies(eChsys)("sex")=1 then%>
          男
          <%else
						if Request.cookies(eChsys)("sex")=0 then%>
          女
          <%else%>
          保密
          <%end if
					end if
				end if
			end if%>
          您的权限：
          <%if Request.cookies(eChsys)("KEY")="super" and Request.cookies(eChsys)("purview")="99999" then%>
          <font color="#ff0000">超级管理员</font>
          <%end if%>
          <%if Request.cookies(eChsys)("KEY")="super" and Request.cookies(eChsys)("purview")<>"99999" then%>
          <font color="#ff0000">系统管理员</font>
          <%end if%>
          <%if Request.cookies(eChsys)("KEY")="check" then%>
          <font color="#ff0000">文章审核员</font>
          <%end if%>
          <%if Request.cookies(eChsys)("KEY")="selfreg" then%>
          <font color="#ff0000">注册用户</font>
          <%end if%>
          <%if Request.cookies(eChsys)("KEY")="smallmaster" then%>
          <font color="#ff0000">小类管理员</font>
          <%end if%>
          <%if Request.cookies(eChsys)("KEY")="bigmaster" then%>
          <font color="#ff0000">大类管理员</font>
          <%end if%>
          <%if Request.cookies(eChsys)("KEY")="typemaster" then%>
          <font color="#ff0000">总栏管理员</font>
          <%end if%>
          您的等级：
          <%if Request.cookies(eChsys)("KEY")<>"selfreg" then%>
          <font color="#ff0000">内部成员</font>
          <%end if%>
          <%if Request.cookies(eChsys)("KEY")="selfreg" and Request.cookies(eChsys)("reglevel")="1" then%>
          <font color="red">普通</font>
          <%end if%>
          <%if Request.cookies(eChsys)("KEY")="selfreg" and Request.cookies(eChsys)("reglevel")="2" then%>
          <font color="red">高级</font>
          <%end if%>
          <%if Request.cookies(eChsys)("KEY")="selfreg" and Request.cookies(eChsys)("reglevel")="3" then%>
          <font color="red">特级</font>
          <%end if%>
          <a href="admin_index.asp">[发文入口]</a>&nbsp;<a href="Exit.asp" >[退出登录]</a>&nbsp;<a href="bloguser.asp?user=<%=Request.cookies(eChsys)("UserName")%>">[我的博客]</a>
        <%end if%>
</div>
<!--顶部自定义菜单-->
<div class="mymenu white_tit float_right">
<%
dim mymenu
mymenu=echuangmenu
Response.Write mymenu
%>
</div>
<!--顶部自定义菜单-->
<div class=clear_float><img src="images/clear_line" width="1002" height="1" border="0" align="absmiddle"></div>
</div>
<div class=banner>
<%if gd2="1" then%>
		
        <a href="<%=TopBannerurl%>"><img src="<%=TopBanner%>" width="1002" height="165" border="0" align="absmiddle"></a>
        <%else%>
		<a href="<%=TopBannerurl%>">
        <object codebase='http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=5,0,0,0' 
      height="165" width="1002" classid='clsid:D27CDB6E-AE6D-11cf-96B8-444553540000'>
          <param name="movie" value='<%=TopBanner%>'>
          <param name="quality" value="high">
          <param name="wmode">
          <embed src="photo/top.swf" quality=high 
      pluginspage="http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash" 
      type="application/x-shockwave-flash" width="1002" height="165"> </embed>
        </object>
		</a>
        <%end if%>
		
</div>
<div class=mainnav>
<UL>
<LI><SPAN class=nav_current id=nav1 ><A class=f_nav href="index.asp">首 页</A></SPAN></LI>
<LI><SPAN class=nav_link id=nav2 ><a href="E_Conmunicate.asp">民政互动</a></SPAN></LI>
<LI><SPAN class=nav_link id=nav3 ><a href="E_Type.asp?E_typeid=11">办事服务</a> </SPAN></LI>
<LI><SPAN class=nav_link id=nav4 ><A href="E_Approve.asp">办事审批</A></SPAN></LI>
<LI><SPAN class=nav_link id=nav5 ><A href="bbs/">政务论坛</A></SPAN></LI>
</UL>
<div class="data float_right"><%Response.Write FormatDateTime(Date(),1) & "  星期"& Mid("日一二三四五六",WeekDay(Date),1) %></div>
</div>
<!--#include file="menu.asp"-->





