<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="/WEB-INF/taglib/struts-html.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/taglib/struts-html.tld" prefix="logic"%>
<%@ page
	import="org.xpup.hafmis.sysloan.loanapply.loanreturnedbyfund.form.LoanreturnedbyfundTaAF"%>
<%@ include file="/checkUrl.jsp"%>
<%
	String path = request.getContextPath();
	request.removeAttribute("error");
%>
<html>
	<head>
		<script src="<%=path%>/js/common.js">
</script>
	</head>
	<script type="text/javascript">
	function load(){
	<%
		
		LoanreturnedbyfundTaAF loanreturnedbyfundTaAF=(LoanreturnedbyfundTaAF)request.getAttribute("loanreturnedbyfundTaAF");
   		String bizdate=loanreturnedbyfundTaAF.getBizTime();   		
   		String status = loanreturnedbyfundTaAF.getPrint_status();
   		String userName=(String)request.getSession().getAttribute("username");
   		String noborrower = (String)request.getAttribute("noborrower");
   		if(noborrower==null)
   			noborrower="";
	%>
	var bizDateYear;
	var bizDateMonth;
	var bizDate;
	
	var bizDateYear_stop;
	var bizDateMonth_stop;
	var bizDate_stop;
	
	var userName;
	var status;
    bizDateYear="<%=bizdate.substring(0, 4)%>";		
	bizDateMonth="<%=bizdate.substring(4, 6)%>";	// 办理日期年				
	bizDate="<%=bizdate.substring(6, 8)%>";	//办理日期月
	userName="<%=userName%>";//办理日期日		
	status ="<%=status%>";
	var contractId = <%=loanreturnedbyfundTaAF.getBorrower().getContractId()%>;//合同编号
	var cardNum= "<%=loanreturnedbyfundTaAF.getBorrower().getCardNum()%>";  //借款人身份证号
		
	loginReg();
	if(status=="1"){
		//document.forms(0).Cell1.openfile("<%=path%>/sysloan/loanapply/issuenotice/fund_pl_start1.cll","");	
		
		document.forms(0).Cell1.openfile("<%=path%>/sysloan/loanapply/issuenotice/fund_pl_start222.cll","");
		<% String name1=loanreturnedbyfundTaAF.getName();
		   String name2=loanreturnedbyfundTaAF.getBorrow_s_empnamea();
		   String name3=loanreturnedbyfundTaAF.getBorrow_s_empnameb();
		   String money1=loanreturnedbyfundTaAF.getAssiMaxMoney();
		   String money2=loanreturnedbyfundTaAF.getF1MaxMoney();
		   String money3=loanreturnedbyfundTaAF.getF2MaxMoney();
		   String nameee = "";
		   String moneyyy = "";
		      if(!"".equals(money1)){
		   if("-".equals(money1.substring(0,1))){
		     money1 = "0";
		   }
		   }
		   if((name2!=null && !"".equals(name2)) &&  (name3 == null || "".equals(name3))){
		     nameee = name2;
		        if(  !"".equals(money2)){
		     if("-".equals(money2.substring(0,1))){
		      money2 = "0";
		     }
		     }
		     moneyyy = money2;
		   }
		   if((name3!=null && !"".equals(name3)) && (name2 == null || "".equals(name2))){
		     nameee = name3;
		      if(  !"".equals(money3)){
		     if("-".equals(money3.substring(0,1))){
		      money2 = "0";
		     }
		     }
		     moneyyy = money3;
		   }
		   if((name2!=null && !"".equals(name2)) && (name3 != null && !"".equals(name3))){
		     nameee = name2+","+name3;
		     if(  !"".equals(money2)){
		     if("-".equals(money2.substring(0,1))){
		      money2 = "0";
		     }
		     }
		      if ( !"".equals(money3)){
		     if("-".equals(money3.substring(0,1))){
		      money2 = "0";
		     }
		     }
		     moneyyy = money2+","+money3;
		   }
		%>
	}else{
	<% 	String date_stop = loanreturnedbyfundTaAF.getDate_stop();%>
	    bizDateYear_stop="<%=date_stop.substring(0, 4)%>";		
	    bizDateMonth_stop="<%=date_stop.substring(4, 6)%>";				
		bizDate_stop="<%=date_stop.substring(6, 8)%>";	
		document.forms(0).Cell1.openfile("<%=path%>/sysloan/loanapply/issuenotice/fund_pl_stop.cll","");
	}
    if(status=="1"){
    	if("<%=noborrower%>"!="noborrower"){
			document.forms(0).Cell1.S(5,9,0,"<%=loanreturnedbyfundTaAF.getBorrowerName()%>");
			document.forms(0).Cell1.S(10,9,0,format("<%=loanreturnedbyfundTaAF.getBorrow_empid()%>")+"<%=loanreturnedbyfundTaAF.getBorrow_empid()%>");
			document.forms(0).Cell1.S(6,15,0,"<%=loanreturnedbyfundTaAF.getBorrowerName()%>");
			document.forms(0).Cell1.S(10,15,0,"<%=loanreturnedbyfundTaAF.getBorrowerMaxMoney()%>");
    	}
		document.forms(0).Cell1.S(10,1,0,"<%=loanreturnedbyfundTaAF.getXieYinum()%>");
		document.forms(0).Cell1.S(3,4,0,"<%=loanreturnedbyfundTaAF.getBorrowerName()%>");
		document.forms(0).Cell1.S(8,4,0,"<%=loanreturnedbyfundTaAF.getBorrower_cardNum()%>");
		document.forms(0).Cell1.S(3,5,0,"<%=loanreturnedbyfundTaAF.getName()%>");
		document.forms(0).Cell1.S(8,5,0,"<%=loanreturnedbyfundTaAF.getCardNum()%>");
		document.forms(0).Cell1.S(3,6,0,"<%=loanreturnedbyfundTaAF.getBorrow_s_empnamea()%>");
		document.forms(0).Cell1.S(8,6,0,"<%=loanreturnedbyfundTaAF.getBorrow_s_cardnuma()%>");
		document.forms(0).Cell1.S(3,7,0,"<%=loanreturnedbyfundTaAF.getBorrow_s_empnameb()%>");
		document.forms(0).Cell1.S(8,7,0,"<%=loanreturnedbyfundTaAF.getBorrow_s_cardnumb()%>");
		
		document.forms(0).Cell1.S(5,10,0,"<%=loanreturnedbyfundTaAF.getName()%>");
		document.forms(0).Cell1.S(10,10,0,format("<%=loanreturnedbyfundTaAF.getBorrow_s_empid()%>")+"<%=loanreturnedbyfundTaAF.getBorrow_s_empid()%>");
		document.forms(0).Cell1.S(5,11,0,"<%=loanreturnedbyfundTaAF.getBorrow_s_empnamea()%>");
		document.forms(0).Cell1.S(10,11,0,format("<%=loanreturnedbyfundTaAF.getBorrow_s_empida()%>")+"<%=loanreturnedbyfundTaAF.getBorrow_s_empida()%>");
		document.forms(0).Cell1.S(5,12,0,"<%=loanreturnedbyfundTaAF.getBorrow_s_empnameb()%>");
		document.forms(0).Cell1.S(10,12,0,format("<%=loanreturnedbyfundTaAF.getBorrow_s_empidb()%>")+"<%=loanreturnedbyfundTaAF.getBorrow_s_empidb()%>");
		
		document.forms(0).Cell1.S(5,13,0,"<%=loanreturnedbyfundTaAF.getBorrowerName()%>");
		document.forms(0).Cell1.S(9,13,0,"<%=loanreturnedbyfundTaAF.getBorrower_cardNum()%>");
		document.forms(0).Cell1.S(3,14,0,"<%=loanreturnedbyfundTaAF.getContractId()%>");
		
		document.forms(0).Cell1.S(2,16,0,"<%=name1%>");//配偶
		document.forms(0).Cell1.S(5,16,0,"<%=money1%>");//最大金额
		document.forms(0).Cell1.S(9,16,0,"<%=nameee%>");//辅助借款人
		document.forms(0).Cell1.S(3,17,0,"<%=moneyyy%>");//最大金额
		document.forms(0).Cell1.S(8,47,0,bizDateYear+"年"+bizDateMonth+"月"+bizDate+"日");
	}else{
		document.forms(0).Cell1.S(16,2,0,"撤销"+"<%=loanreturnedbyfundTaAF.getXieYinum()%>");
		document.forms(0).Cell1.S(6,4,0,"<%=loanreturnedbyfundTaAF.getBorrowerName()%>");
		document.forms(0).Cell1.S(14,4,0,"<%=loanreturnedbyfundTaAF.getBorrower_cardNum()%>");
		document.forms(0).Cell1.S(2,6,0,bizDateYear);
		document.forms(0).Cell1.S(4,6,0,bizDateMonth);
		document.forms(0).Cell1.S(6,6,0,bizDate);
		document.forms(0).Cell1.S(11,6,0,"<%=loanreturnedbyfundTaAF.getXieYinum()%>");
		document.forms(0).Cell1.S(18,7,0,format("<%=loanreturnedbyfundTaAF.getBorrow_empid()%>")+"<%=loanreturnedbyfundTaAF.getBorrow_empid()%>");
		document.forms(0).Cell1.S(2,8,0,"<%=loanreturnedbyfundTaAF.getName()%>");
		document.forms(0).Cell1.S(10,8,0,format("<%=loanreturnedbyfundTaAF.getBorrow_s_empid()%>")+"<%=loanreturnedbyfundTaAF.getBorrow_s_empid()%>");
		document.forms(0).Cell1.S(3,9,0,"<%=loanreturnedbyfundTaAF.getBorrowerName()%>");	
		document.forms(0).Cell1.S(9,9,0,"<%=loanreturnedbyfundTaAF.getBorrower_cardNum()%>");
		document.forms(0).Cell1.S(18,9,0,"<%=loanreturnedbyfundTaAF.getContractId()%>");
		
		document.forms(0).Cell1.S(12,27,0,bizDateYear_stop);
		document.forms(0).Cell1.S(15,27,0,bizDateMonth_stop);
		document.forms(0).Cell1.S(17,27,0,bizDate_stop);
	}
	//document.forms(0).Cell1.S(7,11,0,userName);		
	document.forms(0).Cell1.ReDraw();
   	document.forms(0).Cell1.AllowExtend=false;
   	document.forms(0).Cell1.AllowDragdrop=false;
	//document.forms(0).Cell1.WorkbookReadonly=true;	
}
function printsheet(){//真正的打印
		var k=document.forms(0).Cell1.GetCurSheet();//显示打印预览那个页面--固定
		document.forms(0).Cell1.PrintSheet(1,k);//固定...
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
	function back(){
	document.location="loanreturnedbyfundTbShowAC.do";
	}	
</script>
	<script language="JScript.Encode">
		eval(unescape('function%20LoginRegister%28%29//%u6CE8%u518CCELL%0D%0A%20%7B%20%0D%0A%20document.forms%280%29.Cell1.Login%28%22%u6C88%u9633%u91D1%u8F6F%u79D1%u6280%u6709%u9650%u516C%u53F8%22%2C%22%22%2C%2213100104509%22%2C%220740-1662-7775-3003%22%29%3B%20%20%20%20%0D%0A%20%7D'))
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
					<td>
						<input type="button" name="print" value="打印预览"
							onclick="printPreview();" />
					</td>
					<td>
						<INPUT id="Button1" onclick="Button1_onclick()" type="button"
							value="另存为Excel" name="Button1">
					</td>
					<td>
						<INPUT id="Button1" onclick="Button2_onclick()" type="button"
							value="另存为pdf" name="Button1">
					</td>
					<td>
						<INPUT id="Button3" style="WIDTH: 100px"
							onclick="Button3_onclick()" type="button" value="页面设置">
					</td>
					<td>
						<INPUT id="Button3" style="WIDTH: 100px"
							onclick="Button4_onclick()" type="button" value="查找对话框">
					</td>
					<td>
						<INPUT id="Button3" style="WIDTH: 100px"
							onclick="Button5_onclick()" type="button" value="excel导入">
					</td>
					<td>
						<INPUT id="Button1" onclick="printsheet()" type="button"
							value=" 打印 " name="Button1">
					</td>
					<td>
						<INPUT id="Button3" onclick="back();" type="button" value=" 返回 ">
					</td>
			</table>
		</form>
	</body>
</html>

