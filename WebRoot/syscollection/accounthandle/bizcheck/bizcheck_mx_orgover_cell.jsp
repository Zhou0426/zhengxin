<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.lang.*" import="java.util.*" import="java.math.*"%>
<%@ page import="org.xpup.hafmis.syscollection.accounthandle.bizcheck.form.*" %>
<%@ page import="org.xpup.hafmis.syscollection.common.domain.entity.*" %>
<%@ taglib uri="/WEB-INF/taglib/struts-html.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/taglib/struts-html.tld" prefix="logic"%>
<%@ page
	import="org.xpup.hafmis.syscollection.common.domain.entity.ChgOrgRate"%>
<%@ include file="/../checkUrl.jsp"%>

<%
String path = request.getContextPath();
%>
<html>
	<head>
		<title>财务处理>>业务复核>>业务复核列表>>打印列表</title>
		<script src="<%=path%>/js/common.js">
</script>
	</head>

	<script type="text/javascript">
	function load(){	
	
	document.forms(0).Cell1.openfile("/hafmis/syscollection/accounthandle/bizcheck/report/orgover.cll","");
   
   
	<%
	
	BizcheckDetailAF bizcheckDetailAF=(BizcheckDetailAF) request.getSession().getAttribute("bizcheckDetailAF");
	
	%>
	

	  var totalPageline=15;                  //每页显示15行
	  var pageCurrent=0;                     //当前页
	  var completeline=0;                    //记录行
	
	  if(pageCurrent==0){
	  var temp_noteNum="<%= bizcheckDetailAF.getNoteNum() %>";
	  if(temp_noteNum==null){
	   document.forms(0).Cell1.S(2,2,0,"");
	  }else{
	    document.forms(0).Cell1.S(2,2,0,"<%=bizcheckDetailAF.getNoteNum()%>");
	    }
	    document.forms(0).Cell1.S(2,1,0,"<%=bizcheckDetailAF.getTraninId()%>");
	    document.forms(0).Cell1.S(5,1,0,"<%=bizcheckDetailAF.getTraninName()%>");
	    document.forms(0).Cell1.S(5,2,0,"<%=bizcheckDetailAF.getBanlance()%>");
	    document.forms(0).Cell1.S(2,3,0,"<%=bizcheckDetailAF.getAmount()%>");
	    document.forms(0).Cell1.S(2,4,0,"<%=bizcheckDetailAF.getReason()%>");

	  	
	    //premoneytotal=premoneytotal+parseFloat(lastMonthCollectList[k]);
	   // moneytotal=moneytotal+parseFloat(thisMonthCollectList[k]);
	  }

	
	            document.forms(0).Cell1.AllowExtend=false;
				document.forms(0).Cell1.AllowDragdrop=false;
				document.forms(0).Cell1.WorkbookReadonly=true;	
}

     function printPreview(){
		var k=document.forms(0).Cell1.GetCurSheet();//显示打印预览那个页面
		document.forms(0).Cell1.printPreviewEx(1,k,false);
	}
	function Button1_onclick()
	{
		document.forms(0).Cell1.SaveFile();
	}
	function Button2_onclick()
	{
		document.forms(0).Cell1.ExportPdfFile("d:\\aa",-1,1,1);
	}
	function Button3_onclick()
	{
		document.forms(0).Cell1.PrintPageSetup();
	}
	function Button4_onclick()
	{
		document.forms(0).Cell1.FindDialogEx( 0,"");
	}
		function Button5_onclick()
	{
		document.forms(0).Cell1.ImportExcelDlg();
	}
	function LoginRegister()//注册CELL
    { 
        alert(document.all('Cell1').Login( "username","" ,"04000234", "1231332223234"));
    }
    	
    function printsheet(){//真正的打印
		var k=document.forms(0).Cell1.GetCurSheet();//显示打印预览那个页面--固定
		document.forms(0).Cell1.PrintSheet(1,k);//固定...
	}
</script>
	<body onload="load();" onContextmenu="return false">

		<form action="">
			<table align="center">
				<tr>
					<OBJECT id=Cell1
						style="LEFT:0px;WIDTH:700px;  TOP:0px;HEIGHT:400px"
						codeBase="http://192.168.1.44:8088/hafmis/CellWeb5.CAB#version=5,3,7,321"
						classid=clsid:3F166327-8030-4881-8BD2-EA25350E574A VIEWASTEXT>
						<PARAM NAME="_Version" VALUE="65536">
						<PARAM NAME="_ExtentX" VALUE="10266">
						<PARAM NAME="_ExtentY" VALUE="7011">
						<PARAM NAME="_StockProps" VALUE="0">
					</OBJECT>
				</tr>
				<tr>
					<input type="button" name="print" value="打印预览"
						onclick="printPreview();" />
					<INPUT id="Button1" onclick="Button1_onclick()" type="button"
						value="另存为Excel" name="Button1">
					<INPUT id="Button1" onclick="Button2_onclick()" type="button"
						value="另存为pdf" name="Button1">
					<INPUT id="Button3" style="WIDTH: 100px"
						onclick="Button3_onclick()" type="button" value="页面设置">
					<INPUT id="Button3" style="WIDTH: 100px"
						onclick="Button4_onclick()" type="button" value="查找对话框">
					<INPUT id="Button3" style="WIDTH: 100px"
						onclick="Button5_onclick()" type="button" value="excel导入">
					<INPUT id="Button1" onclick="printsheet()" type="button" value=" 打印 " name="Button1">

<INPUT id="Button3" onclick="javascript:history.back();" type="button" value=" 返回 ">

			</table>
		</form>
	</body>
</html>
