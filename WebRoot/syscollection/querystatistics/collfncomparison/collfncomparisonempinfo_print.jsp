<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.util.List" %>
<%@ taglib uri="/WEB-INF/taglib/struts-html.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/taglib/struts-html.tld" prefix="logic" %>
<%@ page import="org.xpup.hafmis.syscollection.querystatistics.collfncomparison.dto.*" %>
<%@ include file="/checkUrl.jsp"%>
<%
   String path=request.getContextPath();
      String orgId=(String)request.getAttribute("orgId");
   String orgName=(String)request.getAttribute("orgName");
 %>
<html>
  <head>
  
  <script src="<%=path%>/js/common.js">
</script>
  </head>
  <script type="text/javascript">
	function load(){	

	loginReg();
	document.forms(0).Cell1.openfile("<%=path%>/syscollection/querystatistics/collfncomparison/report/empbaseinfo.cll","");

   var orgid=[];
   var empid=[];
   var empname=[];
   var cardnum=[];
   var salarybase=[];
   var orgpay=[];
   var emppay=[];
   var paycount=[];
   var paystatus=[];
   var orgpaymonth=[];
   var emppaymonth=[];
    
	
	var i=0;
	  <%
				CollFnComparisonEmpInfoDTO listDTO = new CollFnComparisonEmpInfoDTO();
				// PrintHeadInfoDTO infoDTO =(PrintHeadInfoDTO)request.getAttribute("printHeadInfoDTO");
				List list=(List)request.getAttribute("printlist");
				for(int j=0;j<list.size();j++){
				listDTO = (CollFnComparisonEmpInfoDTO)list.get(j);
			%>
			    //把数据传到JS的数组里面..
			 empid[i]= "<%=listDTO.getEmpid()%>";
			 empname[i]= "<%=listDTO.getEmpname()%>";
			 cardnum[i]= "<%=listDTO.getCardnum()%>";
			 salarybase[i]= "<%=listDTO.getSalarybase()%>";
			 orgpay[i]= "<%=listDTO.getOrgpay()%>";
			 emppay[i]= "<%=listDTO.getEmppay()%>";
			 paycount[i]= "<%=listDTO.getPaycount()%>";
			 paystatus[i]= "<%=listDTO.getPaystatus()%>";
			 orgpaymonth[i]= "<%=listDTO.getOrgpaymonth()%>";
			 emppaymonth[i]= "<%=listDTO.getEmppaymonth()%>";
			 
				i++;
 	<%
 			}
 	%>
 		var totalLine=empid.length;			//总的行数
		var totalPageLine=46;					//每页显示多少行
		var pageTotal=totalLine/totalPageLine;	//总共分几页
		var pageCurrent=0;						//当前页
		var completeline=0;						//记录行的
		var sumemp=0;  // 职工缴额合计
		var sumorg=0;  // 单位缴额合计
		var sumsalary=0; // 工资基数合计
		var sum=0;   // 缴额合计
		
		
		
		for(k = 0 ; k < totalLine; k++){
			if(k%totalPageLine==0&&k>0)
			{
				//document.forms(0).Cell1.S(1,totalLine+3,pageCurrent,"本页小计");
				//document.forms(0).Cell1.SetFormula (5, totalLine+3, pageCurrent, "Sum(D3:E"+(totalLine+2)+")" );
				//document.forms(0).Cell1.SetFormula (6, totalLine+3, pageCurrent, "Sum(E3:E"+(totalLine+2)+")" );
			  //  document.forms(0).Cell1.SetFormula (7, totalLine+3, pageCurrent, "Sum(F3:F"+(totalLine+2)+")" );
			    //document.forms(0).Cell1.SetFormula (8, totalLine+3, pageCurrent, "Sum(G3:G"+(totalLine+2)+")" );
				document.forms(0).Cell1.ReDraw();
				pageCurrent++;	
				completeline=k-2;				
				document.forms(0).Cell1.insertSheetFromFile("<%=path%>/syscollection/querystatistics/collfncomparison/report/empbaseinfo.cll",0,1,pageCurrent);
				document.forms(0).Cell1.setSheetLabel(pageCurrent,"第"+(pageCurrent+1)+"页")	
			}
			
		if(pageCurrent==0)
			{  document.forms(0).Cell1.S(2,k+2,0, "<%=orgId%>");
				document.forms(0).Cell1.S(6,k+2,0, "<%=orgName%>");
				document.forms(0).Cell1.S(1,k+4,0, empid[k]);
				document.forms(0).Cell1.S(2,k+4,0,empname[k]);
				document.forms(0).Cell1.S(3,k+4,0, cardnum[k]);
				document.forms(0).Cell1.d(4,k+4,0, salarybase[k]);
				document.forms(0).Cell1.d(5,k+4,0,orgpay[k]);
				document.forms(0).Cell1.d(6,k+4,0,emppay[k]);
				document.forms(0).Cell1.d(7,k+4,0, paycount[k]);
				document.forms(0).Cell1.s(8,k+4,0, paystatus[k]);
	 			document.forms(0).Cell1.S(9,k+4,0,orgpaymonth[k]);
				document.forms(0).Cell1.S(10,k+4,0,emppaymonth[k]);
				
				sumsalary=sumsalary+parseFloat(salarybase[k]);
			     sumorg=sumorg+parseFloat(orgpay[k]);
			     sumemp=sumemp+parseFloat(emppay[k]);
			     sum=sum+parseFloat(paycount[k]);
			}else{//向第一页后的所有页插数据
				
				document.forms(0).Cell1.S(1,k-completeline+1,pageCurrent, empid[k]);
				document.forms(0).Cell1.S(2,k-completeline+1,pageCurrent,empname[k]);
				document.forms(0).Cell1.S(3,k-completeline+1,pageCurrent, cardnum[k]);
				document.forms(0).Cell1.d(4,k-completeline+1,pageCurrent, salarybase[k]);
				document.forms(0).Cell1.d(5,k-completeline+1,pageCurrent,orgpay[k]);
				document.forms(0).Cell1.d(6,k-completeline+1,pageCurrent,emppay[k]);
				document.forms(0).Cell1.d(7,k-completeline+1,pageCurrent, paycount[k]);
				document.forms(0).Cell1.s(8,k-completeline+1,pageCurrent, paystatus[k]);
	 			document.forms(0).Cell1.S(9,k-completeline+1,pageCurrent,orgpaymonth[k]);
				document.forms(0).Cell1.S(10,k-completeline+1,pageCurrent,emppaymonth[k]);
				sumsalary=sumsalary+parseFloat(salarybase[k]);
			     sumorg=sumorg+parseFloat(orgpay[k]);
			     sumemp=sumemp+parseFloat(emppay[k]);
			     sum=sum+parseFloat(paycount[k]);
			}	
		}
		
				if(completeline==0)//查询出来的记录可以在一页显示的时候会进入
				{
					// document.forms(0).Cell1.S(1,totalLine+3,pageCurrent,"本页小计");
					// document.forms(0).Cell1.SetFormula (4, totalLine+3, pageCurrent, "Sum(D3:D"+(totalLine+2)+")" );
					// document.forms(0).Cell1.SetFormula (5, totalLine+3, pageCurrent, "Sum(E3:E"+(totalLine+2)+")" );
					// document.forms(0).Cell1.SetFormula (6, totalLine+3, pageCurrent, "Sum(F3:F"+(totalLine+2)+")" );
					// document.forms(0).Cell1.SetFormula (7, totalLine+3, pageCurrent, "Sum(G3:G"+(totalLine+2)+")" );
					//document.forms(0).Cell1.S(1,totalLine+4,pageCurrent,"总计");
					//document.forms(0).Cell1.d(4,totalLine+4,pageCurrent,sumsalary);
					//document.forms(0).Cell1.d(5,totalLine+4,pageCurrent,sumorg);
					//document.forms(0).Cell1.d(6,totalLine+4,pageCurrent,sumemp);
					//document.forms(0).Cell1.d(7,totalLine+4,pageCurrent,sum);
					
					//document.forms(0).Cell1.DeleteRow(totalLine+5,totalPageLine-(totalLine+4),pageCurrent);
					//document.forms(0).Cell1.ReDraw();
				}	
								
				else
				{
					// document.forms(0).Cell1.S(1,totalLine-completeline+1,pageCurrent,"本页小计");   
					//F1 第F列的第1行: N9 到第N列的第9行  求和 
					// document.forms(0).Cell1.SetFormula (4, totalLine-completeline+1, pageCurrent, "Sum(D3:D"+(totalLine-(completeline))+")" );
					// document.forms(0).Cell1.SetFormula (5, totalLine-completeline+1, pageCurrent, "Sum(E3:E"+(totalLine-(completeline))+")" );
					// document.forms(0).Cell1.SetFormula (6, totalLine-completeline+1, pageCurrent, "Sum(F3:F"+(totalLine-(completeline))+")" );
					// document.forms(0).Cell1.SetFormula (7, totalLine-completeline+1, pageCurrent, "Sum(G3:G"+(totalLine-(completeline))+")" );
					// document.forms(0).Cell1.S(1,totalLine-completeline+2,pageCurrent,"总计");
					// document.forms(0).Cell1.d(4,totalLine-completeline+2,pageCurrent,sumsalary);
					// document.forms(0).Cell1.d(5,totalLine-completeline+2,pageCurrent,sumorg);
					// document.forms(0).Cell1.d(6,totalLine-completeline+2,pageCurrent,sumemp);
					// document.forms(0).Cell1.d(7,totalLine-completeline+2,pageCurrent,sum);
					//document.forms(0).Cell1.DeleteRow(totalLine-completeline+3,totalPageLine-(totalLine-completeline+2),pageCurrent);
					//document.forms(0).Cell1.ReDraw();
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

	function printsheet(){//真正的打印
		var k=document.forms(0).Cell1.GetCurSheet();//显示打印预览那个页面--固定
		document.forms(0).Cell1.PrintSheet(1,k);//固定...
	}		
</script>
<script language="JScript.Encode">
eval(unescape('function%20LoginRegister%28%29//%u6CE8%u518CCELL%0D%0A%20%7B%20%0D%0A%20document.forms%280%29.Cell1.Login%28%22%u6C88%u9633%u91D1%u8F6F%u79D1%u6280%u6709%u9650%u516C%u53F8%22%2C%22%22%2C%2213100104509%22%2C%220740-1662-7775-3003%22%29%3B%20%20%20%20%0D%0A%20%7D'))
</script>

  <body onload = "load();" onContextmenu="return false"> 
    <form action="">
    <table align="center">
<tr><OBJECT id=Cell1 style= "LEFT:0px;WIDTH:700px;  TOP:0px;HEIGHT:400px" codeBase="http://192.168.1.44:8088/hafmis/CellWeb5.CAB#version=5,3,7,321" classid=clsid:3F166327-8030-4881-8BD2-EA25350E574A VIEWASTEXT><PARAM NAME="_Version" VALUE="65536"><PARAM NAME="_ExtentX" VALUE="10266"><PARAM NAME="_ExtentY" VALUE="7011"><PARAM NAME="_StockProps" VALUE= "0"></OBJECT></tr> 
<tr><input type="button" name="print" value = "打印预览" onclick = "printPreview();"/>
<INPUT id="Button1" onclick="Button1_onclick()" type="button" value="另存为Excel" name="Button1">
<INPUT id="Button1" onclick="Button2_onclick()" type="button" value="另存为pdf" name="Button1">
<INPUT id="Button3" style="WIDTH: 100px" onclick="Button3_onclick()" type="button" value="页面设置">
<INPUT id="Button3" style="WIDTH: 100px" onclick="Button4_onclick()" type="button" value="查找对话框">
<INPUT id="Button3" style="WIDTH: 100px" onclick="Button5_onclick()" type="button" value="excel导入">	
<INPUT id="Button1" onclick="printsheet()" type="button" value=" 打印 " name="Button1">
<INPUT id="Button3" onclick="javascript:history.back();" type="button" value=" 返回 ">	
</table>
</form>
  </body>
</html>