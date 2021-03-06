<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.util.*" %>
<%@ taglib uri="/WEB-INF/taglib/struts-html.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/taglib/struts-html.tld" prefix="logic" %>
<%@ page import="org.xpup.hafmis.syscollection.accounthandle.adjustaccount.dto.AdjustaccountReportDTO" %>
<%@ include file="/checkUrl.jsp"%>
<html:html>
<%
   	String path=request.getContextPath();
    String url=(String)request.getAttribute("URL");
    System.out.println(url);
   	if(url == null){
   		url="showAdjustaccountServiceAC.do";
   	}else if(url.equals("L")){
   		url=path+"/syscollection/querystatistics/operationflow/orgoperationflow/empOperationFlowTaShowAC.do";
   	}
 %>
  <head>
    <title>完成调整打印</title>
    <script src="<%=path%>/js/common.js">
</script>
    <script type="text/javascript">
    function load(){//打开文件...
    	loginReg();
    	//前边3句话那是固定的....不能改的...如果改了就显示不正确了
		document.forms(0).Cell1.openfile("<%=path%>/syscollection/accounthandle/adjustaccount/report/adjustaccount_single.cll","");
		
		var bizdocnum=[];
		var empid=[];
		var empname=[];
		var idcard=[];
		var adjustmoney=[];
		var wrongdate=[];
		var type=[];
		var num=[];
		var reason=[];
		var sumPay=0;
		var orgid='';
		var orgname='';
		var officename='';
		var orgId = "";
		var officeId = "";
		var collBankName = "";
		var openBank = "";
		var openBankAcc = "";
		var checkPerson = "";
		var clearPerson = "";
		var i = 0;
		<%
			List list=(List)request.getAttribute("printlist");
			String bizDate=(String) request.getAttribute("bizDate");
    		String userName=(String) request.getAttribute("userName");
    		String collectionBankName=(String) request.getAttribute("collectionBankName");
			AdjustaccountReportDTO adjustaccountReportDTO = null; 
			for(int j=0;j<list.size();j++){
			adjustaccountReportDTO = (AdjustaccountReportDTO)list.get(j);
		%>
			/*以上是打印全部凭证的功能*/
			//第一页是openFile ...第二页以后必须全用inertSheetFromFile
			num[i]="<%=j+1%>";
			bizdocnum[i] = "<%=adjustaccountReportDTO.getWrongdocnum()%>";
			empid[i] =format("<%=adjustaccountReportDTO.getEmpid()%>")+"<%=adjustaccountReportDTO.getEmpid()%>";
			empname[i] = "<%=adjustaccountReportDTO.getEmpname()%>";
			idcard[i] = "<%=adjustaccountReportDTO.getEmpidcard()%>";
			adjustmoney[i] =<%=adjustaccountReportDTO.getAdjustaccount()%>;
			sumPay=sumPay+parseFloat(adjustmoney[i]);
			wrongdate[i] ="<%=adjustaccountReportDTO.getWrongaccountdate()%>";
			type[i] = "<%=adjustaccountReportDTO.getBis_type()%>";
			reason[i]= "<%=adjustaccountReportDTO.getBadReason()%>";
			orgid="<%=adjustaccountReportDTO.getOrgid() %>";
			orgname="<%=adjustaccountReportDTO.getOrgname() %>";
			orgId="<%=adjustaccountReportDTO.getOrgid() %>";			
			openBank="<%=adjustaccountReportDTO.getOpenBank() %>";			
			collBankName="<%=adjustaccountReportDTO.getCollBankName() %>";			
			officename="<%=adjustaccountReportDTO.getOfficename() %>";
			openBankAcc = "<%=adjustaccountReportDTO.getOpenBankAcc() %>";
			checkPerson="<%=adjustaccountReportDTO.getCheckPerson() %>";
			clearPerson="<%=adjustaccountReportDTO.getClearPerson() %>";
			i++;//这个地方的i是脚本的i  而不是循环中java的i;
		<%
			}
		%>
		
		document.forms(0).Cell1.S(2,12,0,"<%=bizDate%>");
     	document.forms(0).Cell1.S(4,12,0,"<%=userName%>");
		var orgidtemp=(formatTen(orgid)+""+orgid);
		document.forms(0).Cell1.S(2,4,0,orgidtemp);
		document.forms(0).Cell1.S(5,4,0,orgname);
	    document.forms(0).Cell1.S(2,5,0,openBank);
	    document.forms(0).Cell1.S(5,5,0,openBankAcc);
	    document.forms(0).Cell1.d(2,10,0,sumPay);
	    document.forms(0).Cell1.S(5,10,0,type[0]);
	    document.forms(0).Cell1.S(3,11,0,clearPerson);
	    document.forms(0).Cell1.S(5,11,0,checkPerson);
		document.forms(0).Cell1.insertSheetFromFile("<%=path%>/syscollection/accounthandle/adjustaccount/report/adjustaccount_list.cll",0,1,1);
		document.forms(0).Cell1.setSheetLabel(1,"第2页");
		document.forms(0).Cell1.PrintSetCustomPaper(2400,1280,1);
		document.forms(0).Cell1.PrintSetMargin(100,50,100,50);
	    var totalLine=empid.length;			//总的行数 数组的长度
		var totalPageLine=11;					//每页显示多少行--除了第一行
		var pageTotal=totalLine/totalPageLine;	//总共分几页 总行数/每页的行数
		var pageCurrent=1;						//当前页
		var completeline=0;						//记录行的
		var moneytotal=0;						//总的合计
		var iPage = getInt(totalLine,totalPageLine);
		for(k = 0 ; k < totalLine; k++){
			if(k%totalPageLine==0&&k>0)
			{
				document.forms(0).Cell1.S(1,totalPageLine+5,pageCurrent,"本页小计");
			    document.forms(0).Cell1.SetFormula (8, totalPageLine+5, pageCurrent, "Sum(H5:H"+(totalPageLine+4)+")" );
				document.forms(0).Cell1.DeleteRow(totalPageLine+6,(totalPageLine+7)-(totalPageLine+5),pageCurrent);
				document.forms(0).Cell1.ReDraw();
				pageCurrent++;	
				completeline=k-2;				
				document.forms(0).Cell1.insertSheetFromFile("<%=path%>/syscollection/accounthandle/adjustaccount/report/adjustaccount_list.cll",0,1,pageCurrent);
				document.forms(0).Cell1.setSheetLabel(pageCurrent,"第"+(pageCurrent+1)+"页");
			}
			if(pageCurrent==1)//如果当前页为第一页的时候 插入数据-->这个地方应该写当前页是第2页了..因为第一页是凭证
			{
				//document.forms(0).Cell1.S(列,行,页数,"本页小计");
				document.forms(0).Cell1.S(1,2,pageCurrent,"第"+(pageCurrent+1)+"/"+iPage+"页");
				document.forms(0).Cell1.S(3,2,pageCurrent,collBankName);
				document.forms(0).Cell1.S(6,2,pageCurrent,"<%=userName%>");
				document.forms(0).Cell1.S(8,2,pageCurrent,"<%=bizDate%>");
				document.forms(0).Cell1.S(2,3,pageCurrent,orgname);
				document.forms(0).Cell1.S(2,3,pageCurrent,formatTen(orgid)+orgid);
				document.forms(0).Cell1.S(4,3,pageCurrent,orgname);
				document.forms(0).Cell1.S(1,k+5,pageCurrent,num[k]);//这个地方也要写第二页
				document.forms(0).Cell1.S(2,k+5,pageCurrent,empid[k]);
				document.forms(0).Cell1.S(3,k+5,pageCurrent,empname[k]);
				document.forms(0).Cell1.S(4,k+5,pageCurrent,idcard[k]);
				document.forms(0).Cell1.S(6,k+5,pageCurrent,type[k]);
				document.forms(0).Cell1.s(7,k+5,pageCurrent,wrongdate[k]);
				document.forms(0).Cell1.d(8,k+5,pageCurrent,adjustmoney[k]);
				document.forms(0).Cell1.s(9,k+5,pageCurrent,reason[k]);
				moneytotal=moneytotal+parseFloat(adjustmoney[k]);
			}else{//向第一页后的所有页插数据
				document.forms(0).Cell1.S(1,2,pageCurrent,"第"+(pageCurrent+1)+"/"+iPage+"页");
				document.forms(0).Cell1.S(3,2,pageCurrent,collBankName);
				document.forms(0).Cell1.S(6,2,pageCurrent,"<%=userName%>");
				document.forms(0).Cell1.S(8,2,pageCurrent,"<%=bizDate%>");
				document.forms(0).Cell1.S(2,3,pageCurrent,orgname);
				document.forms(0).Cell1.S(2,3,pageCurrent,formatTen(orgid)+orgid);
				document.forms(0).Cell1.S(4,3,pageCurrent,orgname);
				document.forms(0).Cell1.S(1,k-completeline+3,pageCurrent,num[k]);
				document.forms(0).Cell1.S(2,k-completeline+3,pageCurrent,empid[k]);
				document.forms(0).Cell1.S(3,k-completeline+3,pageCurrent,empname[k]);
				document.forms(0).Cell1.S(4,k-completeline+3,pageCurrent,idcard[k]);
				document.forms(0).Cell1.s(6,k-completeline+3,pageCurrent,type[k]);
				document.forms(0).Cell1.S(7,k-completeline+3,pageCurrent,wrongdate[k]);
				document.forms(0).Cell1.d(8,k-completeline+3,pageCurrent,adjustmoney[k]);
				document.forms(0).Cell1.s(9,k-completeline+3,pageCurrent,reason[k]);
				moneytotal=moneytotal+parseFloat(adjustmoney[k]);
			}	
		}
		if(completeline==0)//查询出来的记录可以在一页显示的时候会进入
		{
			document.forms(0).Cell1.S(1,totalLine+5,pageCurrent,"本页小计");
			document.forms(0).Cell1.SetFormula (8, totalLine+5, pageCurrent, "Sum(H5:H"+(totalLine+4)+")" );
			document.forms(0).Cell1.S(1,totalLine+6,pageCurrent,"总计");
			document.forms(0).Cell1.d(8,totalLine+6,pageCurrent,moneytotal);
		
			document.forms(0).Cell1.DeleteRow(totalLine+7,12-totalLine,pageCurrent);
			document.forms(0).Cell1.ReDraw();
		}
		else
		{
		    document.forms(0).Cell1.S(1,totalLine-completeline+3,pageCurrent,"本页小计");
			document.forms(0).Cell1.SetFormula (8,totalLine-completeline+3, pageCurrent, "Sum(H2:H"+(totalLine-(completeline-2))+")");
			document.forms(0).Cell1.S(1,totalLine-completeline+4,pageCurrent,"总计");
			document.forms(0).Cell1.d(8,totalLine-completeline+4,pageCurrent,moneytotal);
		    document.forms(0).Cell1.DeleteRow(totalLine-completeline+5,totalPageLine-(totalLine-completeline-3),pageCurrent);
			document.forms(0).Cell1.ReDraw();
		}		
		
		document.forms(0).Cell1.AllowExtend=false;
		document.forms(0).Cell1.AllowDragdrop=false;
		document.forms(0).Cell1.WorkbookReadonly=true;	
		document.forms(0).Cell1.PrintSetSheetOpt(3);
        document.forms(0).Cell1.PrintSetPrintRange(1,0);
	}

	function printPreview(){
		var k=document.forms(0).Cell1.GetCurSheet();//显示打印预览那个页面
		document.forms(0).Cell1.printPreviewEx(1,k,false);//key代表当前页
	}
	function Button1_onclick()
	{
		document.forms(0).Cell1.SaveFile();
	}
	function Button2_onclick()
	{
		document.forms(0).Cell1.ExportPdfFile("d:\\aa",-1,1,1);//没有用
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
	function printsheet(){//真正的打印
		var k=document.forms(0).Cell1.GetCurSheet();//显示打印预览那个页面--固定
		document.forms(0).Cell1.PrintSheet(1,k);//固定...
	}	
    </script>
<script language="JScript.Encode">
eval(unescape('function%20LoginRegister%28%29//%u6CE8%u518CCELL%0D%0A%20%7B%20%0D%0A%20document.forms%280%29.Cell1.Login%28%22%u6C88%u9633%u91D1%u8F6F%u79D1%u6280%u6709%u9650%u516C%u53F8%22%2C%22%22%2C%2213100104509%22%2C%220740-1662-7775-3003%22%29%3B%20%20%20%20%0D%0A%20%7D'))
</script>
  </head>
 <body onload = "load();" onContextmenu="return false">
    <form action="">
    <table align="center">
<tr><OBJECT id=Cell1 style= "LEFT:0px;WIDTH:700px;  TOP:0px;HEIGHT:400px" codeBase="http://192.168.1.44:8088/hafmis/CellWeb5.CAB#version=5,3,7,321" classid=clsid:3F166327-8030-4881-8BD2-EA25350E574A VIEWASTEXT><PARAM NAME="_Version" VALUE="65536"><PARAM NAME="_ExtentX" VALUE="10266"><PARAM NAME="_ExtentY" VALUE="7011"><PARAM NAME="_StockProps" VALUE= "0"></OBJECT></tr> 
<tr><td><input type="button" name="print" value = "打印预览" onclick = "printPreview();"/></td>
<td><INPUT id="Button1" onclick="Button1_onclick()" type="button" value="另存为Excel" name="Button1"></td>
<td><INPUT id="Button1" onclick="Button2_onclick()" type="button" value="另存为pdf" name="Button1"></td>
<td><INPUT id="Button3" style="WIDTH: 100px" onclick="Button3_onclick()" type="button" value="页面设置"></td>
<td><INPUT id="Button3" style="WIDTH: 100px" onclick="Button4_onclick()" type="button" value="查找对话框"></td>
<td><INPUT id="Button3" style="WIDTH: 100px" onclick="Button5_onclick()" type="button" value="excel导入"></td>
<td><INPUT id="Button1" onclick="printsheet()" type="button" value=" 打印 " name="Button1"></td>
<td><INPUT id="Button3" onclick="location.href='<%=url%>'" type="button" value=" 返回 "></td>	
</table>
</form>
  </body>
</html:html>
