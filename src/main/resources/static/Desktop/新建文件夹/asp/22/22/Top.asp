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
		alert("�������û�����");
		document.UserLogin.UserName.focus();
		return false;
	}
	if(document.UserLogin.Passwd.value == "")
	{
		alert("���������룡");
		document.UserLogin.Passwd.focus();
		return false;
	}
	if(document.UserLogin.verifycode.value == "")
	{
		alert("��������֤�룡");
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

<%		'��ȡ��ǰ URL
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
<!--��¼��-->
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
           �û���
          <input name="UserName" style="width:80px;height:16px;border:1px solid #9FAABF">
          ���룺
          <input name="Passwd" type="password" style="width:80px;height:16px;border:1px solid #9FAABF">
          ���룺
          <input name="verifycode" type="text"  style="width:50px;height:16px;border:1px solid #9FAABF" >
          <%=getcode1()%>
		  <input name="Submit" type="image" src="images/login.gif" width="38" height="18" border="0" align="absmiddle"/>
		  <%if reg=1 then%>
		  <a href="javascript:adduser()"><img src="images/reg.gif" width="38" height="18" border="0"  align="absmiddle"/></a>
          <%end if%>
</form>
        <%else%>
         ��ӭ��<%=Request.cookies(eChsys)("UserName")%>
            <%if db_Birthday_Select="EChuang" then		'�Ա��ֶ���ԭE���ֶ�%>
            <%=Request.cookies(eChsys)("sex")%>
            <%else
				if db_Birthday_Select="Text" then		'�Ա��ֶ���BBS���ı��Ͱ���������
					if Request.cookies(eChsys)("sex")=1 then%>
          ��
          <%else
						if Request.cookies(eChsys)("sex")=0 then%>
          Ů
          <%else%>
          ����
          <%end if
					end if
				end if
			end if%>
          ����Ȩ�ޣ�
          <%if Request.cookies(eChsys)("KEY")="super" and Request.cookies(eChsys)("purview")="99999" then%>
          <font color="#ff0000">��������Ա</font>
          <%end if%>
          <%if Request.cookies(eChsys)("KEY")="super" and Request.cookies(eChsys)("purview")<>"99999" then%>
          <font color="#ff0000">ϵͳ����Ա</font>
          <%end if%>
          <%if Request.cookies(eChsys)("KEY")="check" then%>
          <font color="#ff0000">�������Ա</font>
          <%end if%>
          <%if Request.cookies(eChsys)("KEY")="selfreg" then%>
          <font color="#ff0000">ע���û�</font>
          <%end if%>
          <%if Request.cookies(eChsys)("KEY")="smallmaster" then%>
          <font color="#ff0000">С�����Ա</font>
          <%end if%>
          <%if Request.cookies(eChsys)("KEY")="bigmaster" then%>
          <font color="#ff0000">�������Ա</font>
          <%end if%>
          <%if Request.cookies(eChsys)("KEY")="typemaster" then%>
          <font color="#ff0000">��������Ա</font>
          <%end if%>
          ���ĵȼ���
          <%if Request.cookies(eChsys)("KEY")<>"selfreg" then%>
          <font color="#ff0000">�ڲ���Ա</font>
          <%end if%>
          <%if Request.cookies(eChsys)("KEY")="selfreg" and Request.cookies(eChsys)("reglevel")="1" then%>
          <font color="red">��ͨ</font>
          <%end if%>
          <%if Request.cookies(eChsys)("KEY")="selfreg" and Request.cookies(eChsys)("reglevel")="2" then%>
          <font color="red">�߼�</font>
          <%end if%>
          <%if Request.cookies(eChsys)("KEY")="selfreg" and Request.cookies(eChsys)("reglevel")="3" then%>
          <font color="red">�ؼ�</font>
          <%end if%>
          <a href="admin_index.asp">[�������]</a>&nbsp;<a href="Exit.asp" >[�˳���¼]</a>&nbsp;<a href="bloguser.asp?user=<%=Request.cookies(eChsys)("UserName")%>">[�ҵĲ���]</a>
        <%end if%>
</div>
<!--�����Զ���˵�-->
<div class="mymenu white_tit float_right">
<%
dim mymenu
mymenu=echuangmenu
Response.Write mymenu
%>
</div>
<!--�����Զ���˵�-->
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
<LI><SPAN class=nav_current id=nav1 ><A class=f_nav href="index.asp">�� ҳ</A></SPAN></LI>
<LI><SPAN class=nav_link id=nav2 ><a href="E_Conmunicate.asp">��������</a></SPAN></LI>
<LI><SPAN class=nav_link id=nav3 ><a href="E_Type.asp?E_typeid=11">���·���</a> </SPAN></LI>
<LI><SPAN class=nav_link id=nav4 ><A href="E_Approve.asp">��������</A></SPAN></LI>
<LI><SPAN class=nav_link id=nav5 ><A href="bbs/">������̳</A></SPAN></LI>
</UL>
<div class="data float_right"><%Response.Write FormatDateTime(Date(),1) & "  ����"& Mid("��һ����������",WeekDay(Date),1) %></div>
</div>
<!--#include file="menu.asp"-->





