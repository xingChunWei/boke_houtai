<!--#include file="conn.asp"-->
<!--#include file="config.asp"-->
<!--#include file="function.asp"-->
<!--#include file="char.inc"-->
<%
dim shu,news,E_BigClassID,E_SmallClassID,E_typeid,specialid,order,time,path,click,title
E_BigClassID= ChkRequest(request.querystring("E_BigClassID"), 1)
E_typeid= ChkRequest(request.querystring("E_typeid"), 1)
E_SmallClassID= ChkRequest(request.querystring("E_SmallClassID"), 1)
specialid= ChkRequest(request.querystring("specialid"), 1)
shu= ChkRequest(request.querystring("shu"), 1)
order= ChkRequest(request("order"))
time= ChkRequest(request.querystring("time"))
title= ChkRequest(request.querystring("title"))
click= ChkRequest(request.querystring("click"))
Path = "./"
if shu<>"" then   '��ʾ��Ŀ������Ϊ10
ss=shu
else
ss=10
end if
if order="click" then  '����ʽ��clickΪ�������
oo="click"
else
oo="newsid"
end if
if time="" or time="0" then  '��ʾʱ�䣬0Ϊ����ʾ
tt=0
else
tt=1
end if
if click="" or click="0" then  '��ʾ�������0Ϊ����ʾ
cc=0
else
cc=1
end if
if title<>"" then   '��ʾ��Ŀ������Ϊ10
nn=CInt(title)
else
nn=20
end if
if E_typeid<>"" then
	set rs=conn.execute("SELECT top "&ss&" * FROM "& db_EC_News_Table &"  where E_typeid="& cint(E_typeid) &" and checkked=1 order by "&oo&" desc")
else
if E_BigClassID<>"" then
	set rs=conn.execute("SELECT top "&ss&" * FROM "& db_EC_News_Table &"  where E_BigClassID="& cint(E_BigClassID)&" and checkked=1 order by "&oo&" desc")
else
if E_SmallClassID<>"" then
	set rs=conn.execute("SELECT top "&ss&" * FROM "& db_EC_News_Table &"  where E_SmallClassID="& cint(E_SmallClassID)&" and checkked=1 order by "&oo&" desc")
else
if specialid<>"" then
	set rs=conn.execute("SELECT top "&ss&" * FROM "& db_EC_News_Table &"  where specialid="& cint(specialid) &" and checkked=1 order by "&oo&" desc")
else
	set rs=conn.execute("SELECT top "&ss&" * FROM "& db_EC_News_Table &" where checkked=1 order by "&oo&" desc")
end if
end if
end if
end if
if rs.eof and rs.bof then %>
     document.write('û��');
  <% else  
do while not rs.eof

title=htmlencode4(trim(rs("title")))

%>
document.write('<LINK href=css/home.css rel=stylesheet><div class="side_con">��<font ><A  href="<%=path%>E_ReadNews.asp?NewsID=<%=rs("NewsID")%>" title="<%=title%>" target="_blank"><%=CutStr(title,nn)%></A><%if tt=1 then%><FONT color="#666666">(<%=month(rs("updatetime"))%>-<%=day(rs("updatetime"))%>)</FONT><%end if%><%if date()-rs("updatetime")<2 then%><FONT color="#ff0000">�£�</FONT><%end if%><%if cc=1 then%><FONT color="#666666">(<%=rs("click")%>)</FONT><%end if%></font></div>');

<%

rs.movenext 
loop 
end if
Rs.Close
set Rs=nothing
%>
