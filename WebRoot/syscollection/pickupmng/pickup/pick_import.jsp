<%@ page language="java" pageEncoding="gbk"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="/WEB-INF/taglib/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/taglib/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/taglib/struts-logic.tld" prefix="logic" %>
<%@taglib uri="/WEB-INF/taglib/struts-nested.tld" prefix="nested"%>
<%@ taglib uri="/WEB-INF/taglib/xpup-security.tld" prefix="security" %>
<%@ include file="/checkUrl.jsp"%>
<%

	String path = request.getContextPath();
%>
<html:html lang="true">
  <head>
    <html:base />
    <title>��ȡ����-���㵼��Excel�ļ�</title>
   </head>
   <script language="javascript">
   function reportErrors() {
	<logic:messagesPresent>
	var message = "<html:messages id="error"><bean:write name="error"/></html:messages>"
	alert(message);
	</logic:messagesPresent>
}
	function goBack(){
    document.Form1.submit();
    return false;
	}
   function on_Submit(eee){  
    if(document.forms[0].theFile.value==""){
	     alert("��ѡ�����ļ�������");//�ļ�����ΪNull
	     return false;
     }else{
     	document.forms[0].url.value=document.forms[0].theFile.value;//����ļ��ľ���·��
     	setPosiTion(eee);MM_showHideLayers('sending','','show');MM_showHideLayers('Layer1','','show');MM_showHideLayers('Layer2','','hide');
     	return true;
     }
    } 
  </script>
  <link rel="stylesheet" href="<%=path%>/css/index.css" type="text/css"/>
  <body bgcolor="#FFFFFF" text="#000000"  onContextmenu="return false" onload="reportErrors();">
  <jsp:include flush="true" page="/waiting.inc"/>
<html:form action="/pickImportAC.do" method="post" enctype="multipart/form-data">
  <table width="95%" border="0" cellspacing="0" cellpadding="0" align="center">
  <tr>
    <td>
    
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="7"><img src="<%=path%>/img/table_left.gif" width="7" height="37"></td>
          <td background="<%=path%>/img/table_bg_line.gif" width="55">&nbsp;</td>
          <td width="235" background="<%=path%>/img/table_bg_line.gif">&nbsp;</td>
          <td background="<%=path%>/img/table_bg_line.gif" align="right"> 
            <table width="300" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td width="37"><img src="<%=path%>/img/title_banner.gif" width="37" height="24"></td>
                <td width="216" class=font14 bgcolor="#FFFFFF" align="center" valign="bottom"><font color="00B5DB">��ȡҵ��&gt;��ͨ��ȡ</font></td>
                <td width="47" class=font14>&nbsp;</td>
              </tr>
            </table>  
          </td>
          <td width="9"><img src="<%=path%>/img/table_right.gif" width="9" height="37"></td>
        </tr>
      </table>
    </td>
  </tr>
    <tr> 
    <td class=td3>
      <table width="95%" border="0" cellspacing="0" cellpadding="0" align="center">
        <tr> 
          <td height="35"> 
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td height="22" bgcolor="#CCCCCC" align="center" width="117"><b class="font14">�� �� �� ��</b></td>
                <td height="22" background="<%=path %>/img/bg2.gif" align="center">&nbsp;</td>
              </tr>
            </table>
          </td>
        </tr>
      </table>
       <table border="0" width="95%" id="table1" cellspacing=1  cellpadding=3 align="center" >
          <tr> 
            <td width="17%" class="td1"  >��ȡ��������:</td>
            <td width="38%"   > 
			      <html:file property="theFile" size="50" maxlength="100" styleClass="input3"/>
			      <html:hidden property="url"/>
            </td>
            <td  >&nbsp;</td>
          </tr>
        </table>
   	  <table width="95%" border="0" cellspacing="0" cellpadding="3" align="center">
        <tr valign="bottom"> 
          <td  colspan="7" bgcolor="#FFFFFF" align="center" height="30"> 
            <table border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td><html:submit styleClass="buttona" onclick="return on_Submit(this)"><bean:message key="button.imports"/></html:submit></td>    
			  	<td><input type='button' class="buttona" onclick="return goBack()"  value="<bean:message key="button.back"/>"></td>    
			  </tr>  
            </table>    
      	  </td>
  		</tr>
      </table> 
    </html:form> 
    </td>
  </tr>
</table>
<form action="/hafmis/syscollection/pickupmng/pickup/pickupShowAC.do" method="POST" name="Form1" id="Form1">
</form>
</body>
</html:html>