<!--#include file="conn.asp" -->
<%
dim LASTIP,NEWIP
set rs=server.CreateObject("ADODB.RecordSet")
Rs.Open "Select * from EC_counters" ,conn,1,3

LASTIP = RS("LASTIP")
NEWIP = REQUEST.servervariables("REMOTE_ADDR")

IF CSTR(Month(RS("DATE"))) <> CSTR(Month(DATE())) THEN
	RS("DATE") = DATE()
	RS("YESTERDAY") = RS("TODAY")
	RS("BMONTH") = RS("MONTH")
	RS("MONTH") = 0
	RS("TODAY") = 0
	RS("TOTAL")  =  RS("TOTAL") + 1
	RS("TODAY") =  RS("TODAY") + 1
	RS("MONTH")  =  RS("MONTH") + 1
	RS("LASTIP") = NEWIP
	RS.Update
	session("IsFirst")=true
ELSE
	IF CSTR(Day(RS("DATE"))) <> CSTR(Day(DATE())) THEN
		RS("DATE") = DATE()
		RS("YESTERDAY") = RS("TODAY")
		RS("TODAY") = 0
		RS("TOTAL")  =  RS("TOTAL") + 1
		RS("TODAY") =  RS("TODAY") + 1
		RS("MONTH")  =  RS("MONTH") + 1
		RS("LASTIP") = NEWIP
		RS.Update
		session("IsFirst")=true
	END IF
END IF
if session("IsFirst")="" then		'�ж��Ƿ��ǵ�һ�ε�½����������������һ
	RS("TOTAL")  =  RS("TOTAL") + 1
	RS("TODAY") =  RS("TODAY") + 1
	RS("MONTH")  =  RS("MONTH") + 1
	RS("LASTIP") = NEWIP
	RS.Update
	session("IsFirst")=true
end if
%>
document.write('<li>�����շ��ʣ�<font color=red>[<%=rs("YESTERDAY")%>]</font></li>');
document.write('<li>�����շ��ʣ�<font color=red>[<%=rs("TODAY")%>]</font></li>');
document.write('<li>�����·��ʣ�<font color=red>[<%=rs("BMONTH")%>]</font></li>');
document.write('<li>�����·��ʣ�<font color=red>[<%=rs("MONTH")%>]</font></li>');
document.write('<li>������������<font color=red>[<%=rs("TOTAL")%>]</font></li> '); 
<%rs.Close
set rs=nothing%>