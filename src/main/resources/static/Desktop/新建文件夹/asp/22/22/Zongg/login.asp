<!--#include file="config.asp"-->
<%
adsconn.open adsdata
dim adssql,adsrs,admname,admpass
DeInj_set = "'|;|and|(|)|exec|insert|select|delete|update|count|chr|mid|master|truncate|char|declare"
DeInj_code = split(DeInj_set,"|")
admname=trim(request("username"))
admpass=trim(request("password"))
For DeInj_no=0 To Ubound(DeInj_code)
       If Instr(LCase(admname),DeInj_code(DeInj_no))<>0 Then
             %>
              非法参数！
             <%
            Response.End
       end if
next
set adsrs=server.createobject("adodb.recordset")
asql="select * from EC_Admin where admin='"&admname&"'"
adsrs.open asql,adsconn,1,1
if adsrs.bof and adsrs.eof then
%>
无此管理员！
<%
else
if admpass=adsrs("passwd") then
session("masterlogin")="superadvertadmin"
session("admname")=adsrs("admin")
session("aid")=adsrs("aid")
Response.Redirect "index.asp"
adsrs.close
set adsrs=nothing
adsconn.close
set adsconn=nothing
else
%>
密码错误！
<%
end if
end if
%>