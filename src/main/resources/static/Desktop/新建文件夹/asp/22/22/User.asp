<%@ Language=VBScript%>
<!--#include file="conn.asp" -->
<!--#include file="ConnUser.asp"-->
<!--#include file="config.asp" -->
<!--#include file="function.asp"-->
<!--#include file="char.inc"-->
<%
username1=checkstr(trim(Request("user")))

PageShowSize = 10            'ÿҳ��ʾ���ٸ�ҳ
MyPageSize   = 40           'ÿҳ��ʾ������
	
If Not IsNumeric(Request("page")) Or IsEmpty(Request("page")) Or Request("page") <=0 Then
	MyPage=1
	Else
	MyPage=Int(Abs(Request("page")))
End if

if username1="" then
	Response.Write "<script>alert('δָ������');history.back()</script>"
	Response.End
end if

set rs=server.CreateObject("ADODB.RecordSet")
rs.Source="select * from "& db_EC_Type_Table &" order by E_typeorder"
rs.Open rs.Source,conn,1,1

dim ArrayE_typeid(10000),ArrayE_typename(10000),Arraytypecontent(10000)
typeCount=rs.RecordCount
for i=1 to typeCount
	ArrayE_typeid(i)=rs("E_typeid")
	ArrayE_typename(i)=rs("E_typename")
	Arraytypecontent(i)=rs("typecontent")
	rs.MoveNext
next
rs.Close
set rs=nothing
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>��Ա��<%=username1%>__ȫ����Ա__<%=eChSys%></title>
<LINK href=css/home.css rel=stylesheet>
<style type="text/css">
<!--
.STYLE1 {color: #FFFFFF}
.STYLE2 {background-repeat: repeat-x; font-size: 12px;}
-->
</style>
</head>
<body topmargin="0">
<!--#include file="Top.asp"-->
<table width="1002" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tr valign="top"> 
    <td width="210" background="Images/l_b.gif" bgcolor="#FDF6E7"><center>
      <table width="210" border="0" align="center" cellpadding="0" cellspacing="0" id="AutoNumber2" style="border-collapse: collapse">
        <tr>
          <td width="100%" height="30" valign="middle" background="Images/red_bg.jpg"><p align="center" class="yellow_title">��Ա����</td>
        </tr>
        <%
	set rs2=server.CreateObject("ADODB.RecordSet")
	rs2.Source="select * from "& db_User_Table &" where "& db_User_Name &"='"&username1&"'"
	rs2.Open rs2.Source,ConnUser,1,1
	if not rs2.eof then
	%>
        <tr>
          <td width="100%" height="24" align=center valign="middle"><br>
              <%if rs2(db_User_Face)<>"" then%>
              <%if UserTableType = "EChuang" then%>
              <% if rs2(db_User_Face)<>"images/nopic.gif" then %>
              <img src="<%=rs2(db_User_Face)%>" border="0" width="120">
              <%else%>
              <% if rs2(db_User_sex)="����" then %>
              <img src="images/nopic.gif" border="0" >
              <%else%>
              <%if  rs2(db_User_sex)="����" then %>
              <img src="images/Image9.gif" border="0" >
              <%else%>
              <%if  rs2(db_User_sex)="Ůʿ" then %>
              <img src="images/Image18.gif" border="0" >
              <%else%>
              <%end if%>
              <%end if%>
              <%end if%>
              <%end if%>
              <%else%>
              <%if UserTableType="Dvbbs" then%>
              <img src="<%=BbsPath%><%=rs2(db_User_Face)%>" border="0" width="<%=rs2(db_User_FaceWidth)%>" height="<%=rs2(db_User_FaceHeight)%>">
              <%''��ʾ�û�ͷ�񣬼�'bbs/'ǰ׺·��,ʹͼ��ϵͳֱ����ʾ������̳ͷ��%>
            <br>
              <a href="<%=BbsPath%>dispuser.asp?name=<%=username1%>" target="_blank"><font color=blue>��̳�еĸ�������</font></a> <br>
            <br>
              <%end if%>
              <%end if%>
              <%else%>
              <% if rs2(db_User_sex)="����" then %>
              <img src="images/nopic.gif" border="0" >
              <%else%>
              <%if  rs2(db_User_sex)="����" then %>
              <img src="images/Image9.gif" border="0" >
              <%else%>
              <%if  rs2(db_User_sex)="Ůʿ" then %>
              <img src="images/Image18.gif" border="0" >
              <%else%>
              <%end if%>
              <%end if%>
              <%end if%>
              <%end if%>
          </td>
        </tr>
        <tr>
          <td width="100%" height="24" valign="middle"><div align="center">
              <table width="90%" border="0" cellpadding="3" cellspacing="0">
                <tr>
                  <td style="LEFT: 0px; WIDTH: 165px; WORD-WRAP: break-word"><div>��ʵ������<%=rs2("fullname")%><br>
                          <%if db_Birthday_Select = "EChuang" then%>
                    ��λ��<%=rs2("E_DepName")%> <br>
                    ���ţ�<%=rs2("E_DepType")%><br>
                    ���գ�<%=rs2(db_User_Birthyear)%>-<%=rs2(db_User_Birthmonth)%>-<%=rs2(db_User_Birthday)%><br>
                    <%else%>
                    <%if db_Birthday_Select = "Text" then%>
                    ���գ�<%=year(rs2(db_User_birthday))%>-<%=month(rs2(db_User_birthday))%>-<%=day(rs2(db_User_birthday))%><br>
                    <%end if%>
                    <%end if%>
                    <%if db_Sex_Select = "EChuang" then%>
                    �Ա�<%=rs2(db_User_sex)%><br>
                    <%else%>
                    <%if db_Sex_Select = "Number" then%>
                    �Ա�
                    <%if rs2(db_User_Sex)="0" then%>
                    Ů
                    <%else%>
                    ��
                    <%end if%>
                    <br>
                    <%end if%>
                    <%end if%>
                    EMAIL��<%=rs2(db_User_Email)%><br>
                    ע��ʱ�䣺<%=year(rs2(db_User_RegDate))%>-<%=month(rs2(db_User_RegDate))%>-<%=day(rs2(db_User_RegDate))%><br>
                    ���ҽ��ܣ� <%=rs2("content")%> </div></td>
                </tr>
              </table>
          </div></td>
        </tr>
        <%rs2.close
	set rs2=nothing%>
      </table>
    </center>
    </td>
    <td width="792"> 
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td height="25" background="Images/dh_bg.gif">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="daohang">��Ŀ����</span><span class="STYLE1"><b>&nbsp;&nbsp; 
            </b></span><span class="STYLE2">��ǰλ�ã�</span><span class="STYLE1"><a class="daohang" href="./" >��վ��ҳ</a></span>&gt;&gt;<a href="E_AllUser.asp" class=STYLE2>ȫ����Ա</a><span class="STYLE2">>>��Ա</span><span class="STYLE2">��</span><b><font color=red><%=username1%></font></b></td>
        </tr>
        <tr> 
          <td height="25"><div align="center"> 
              <table width="95%"  border="0" align="center" cellpadding="0" cellspacing="0" id="AutoNumber3" style="border-collapse: collapse">
                <tr> 
                  <td valign=top>&nbsp;</td>
                </tr>
                <tr> 
                  <td valign=top><table border="0" cellpadding="3" cellspacing="0" width="100%">
                      <%
			set rs=server.CreateObject("ADODB.RecordSet")
			if session("key")="" then
				rs.Source="select * from "& db_EC_News_Table &" where editor='" & username1 & "' and checkked=1 order by NewsID DESC"
			end if
			if session("key")="super" or session("key")="typemaster" or session("key")="bigmaster" or session("key")="smallmaster" or session("key")="check" then
				rs.Source="select * from "& db_EC_News_Table &" where editor='" & username1 & "' and checkked=1 order by NewsID DESC"
			end if
			if session("key")="selfreg" then
				if session("reglevel")=3 then
					rs.Source="select * from "& db_EC_News_Table &" where editor='" & username1 & "' and checkked=1 order by NewsID DESC"
				end if
				if session("reglevel")=2 then
					rs.Source="select * from "& db_EC_News_Table &" where editor='" & username1 & "' and checkked=1 order by NewsID DESC"
				end if
				if session("reglevel")=1 then
					rs.Source="select * from "& db_EC_News_Table &" where editor='" & username1 & "' and checkked=1 order by NewsID DESC"
				end if
			end if

			rs.Open rs.Source,conn,1,1
			rs.PageSize=20
			rs.CacheSize = RS.PageSize
			for i=1 to rs.PageSize *(page-1)
				if not rs.EOF then
					rs.MoveNext
				end if
			next

			Response.Write "<tr><td width=100% height=28 align=center>&nbsp;"
			if rs.EOF then
				Response.Write "<font color=red>�û�Ա��û�����£�</font>"
			else
				rs.PageSize     = MyPageSize
				MaxPages         = rs.PageCount
				rs.absolutepage = MyPage
				total            = rs.RecordCount
				Response.Write "�û�Ա����" & total & "ƪ���£���ǰ��"& myPage &"/"& MaxPages &"ҳ��ÿҳ"& rs.PageSize &"��"
			end if
			Response.Write "</td></tr>"

			If Not rs.eof then
				i = 0
				do until rs.Eof or i = rs.PageSize
				if rs("picname")<>"" then
					img="<font color=red>[ͼ]</font>"
				else
					img=""
			end if
			%>
                      <tr> 
                        <%
			title=htmlencode4(trim(rs("title")))
			%>
                        <td width="100%" height="20">&nbsp;<img src="images/006.gif" width="8" height="10" border="0">&nbsp;<a  href="E_ReadNews.asp?NewsID=<%=rs("NewsID")%>" target=_blank title="<%=title%>"> 
                          <%if mode="2" then%>
                          <%=img%> 
                          <%end if%>
                          <font color="<%=rs("titlecolor")%>">                
                          <%=CutStr(title,50)%>                          </font></a><font >(<%=rs("UpdateTime")%>)[<font color="#ff0000"><%=rs("click")%></font>]</font></td>
                      </tr>
			<%
			rs.MoveNext
			i = i + 1
			loop
			%>
                      <tr> 
                        <td width="100%" align=center>�� <%=Mypage%>/<%=Maxpages%>ҳ��ÿҳ <%=MyPageSize%> �� 
			<%
			url="user.asp?user=" & username1
			PageNextSize=int((MyPage-1)/PageShowSize)+1
			Pagetpage=int((total-1)/rs.PageSize)+1
			if PageNextSize >1 then
				PagePrev=PageShowSize*(PageNextSize-1)
				Response.write "<a  href='" & Url & "&page=" & PagePrev & "' title='��" & PageShowSize & "ҳ'>��һ��ҳ</a> "
				Response.write "<a  href='" & Url & "&page=1' title='��1ҳ'>ҳ��</a> "
			end if
			if MyPage-1 > 0 then
				Prev_Page = MyPage - 1
				Response.write "<a  href='" & Url & "&page=" & Prev_Page & "' title='��" & Prev_Page & "ҳ'>��һҳ</a> "
			end if

			if Maxpages>=PageNextSize*PageShowSize then
				PageSizeShow = PageShowSize
			Else
				PageSizeShow = Maxpages-PageShowSize*(PageNextSize-1)
			End if
			
			If PageSizeShow < 1 Then PageSizeShow = 1
				for PageCounterSize=1 to PageSizeShow
				PageLink = (PageCounterSize+PageNextSize*PageShowSize)-PageShowSize
				if PageLink <> MyPage Then
					Response.write "<a  href='" & Url & "&page=" & PageLink & "'>[" & PageLink & "]</a> "
				else
					Response.Write "<B>["& PageLink &"]</B> "
				end if
				If PageLink = MaxPages Then Exit for
				Next

				if Mypage+1 <=Pagetpage  then
					Next_Page = MyPage + 1
					Response.write "<a  href='" & Url & "&page=" & Next_Page & "' title='��" & Next_Page & "ҳ'>��һҳ</A>"
				end if

				if MaxPages > PageShowSize*PageNextSize then
					PageNext = PageShowSize * PageNextSize + 1
					Response.write " <A  href='" & Url & "&page=" & Pagetpage & "' title='��"& Pagetpage &"ҳ'>ҳβ</A>"
					Response.write " <a  href='" & Url & "&page=" & PageNext & "' title='��" & PageShowSize & "ҳ'>��һ��ҳ</a>"
				End if
			end if
			rs.close					
			%>                        </td>
                      </tr>
                    </table></td>
                </tr>
                <tr> 
                  <td valign=top>&nbsp;</td>
                </tr>
              </table>
          </div></td>
        </tr>
    </table>    </td>
  </tr>
</table>
<!--#include file="bottom.asp"-->
</body>
</html>
<%
else

Response.Write "<script>alert('�޴��û���');history.back()</script>"
Response.End

end if
%>