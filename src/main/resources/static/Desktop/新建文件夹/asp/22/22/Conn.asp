<%
starttime=timer()

DbType = "ACCESS" '����ACCESS���ݿ�

 DbType="ACCESS" 
	DB = "DataBases/###EC0801.V7010#.asp"
	ConnStr = "Provider = Microsoft.Jet.OLEDB.4.0;Data Source = " & Server.MapPath(db)

On Error Resume Next
Set conn = Server.CreateObject("ADODB.Connection")
conn.open ConnStr

If Err Then
	err.Clear
	Set Conn = Nothing
	Response.Write "���ݿ����ӳ���[���룺01]���������ݿ������ļ��е������ִ���"
	Response.End
End If
%>                                                                                              
