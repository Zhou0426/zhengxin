/*
 * Generated by MyEclipse Struts
 * Template path: templates/java/JavaClass.vtl
 */
package org.xpup.hafmis.syscollection.querystatistics.inspection.action;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.xpup.common.util.BSUtils;
import org.xpup.common.util.Pagination;
import org.xpup.common.util.PaginationUtils;
import org.xpup.hafmis.orgstrct.dto.OfficeDto;
import org.xpup.hafmis.orgstrct.dto.SecurityInfo;
import org.xpup.hafmis.syscollection.querystatistics.inspection.bsinterface.IInspectionBS;
import org.xpup.hafmis.syscollection.querystatistics.inspection.form.InspectionShowAF;

/** 
 * MyEclipse Struts
 * Creation date: 06-18-2008
 * 
 * XDoclet definition:
 * @struts.action path="/inspectionShowAC" name="inspectionShowAF" scope="request" validate="true"
 */
public class InspectionShowAC extends Action {
  public static final String PAGINATION_KEY ="org.xpup.hafmis.syscollection.querystatistics.inspection.action.InspectionShowAC";
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		try{
    InspectionShowAF inspectionShowAF = (InspectionShowAF) form;// TODO Auto-generated method stub
    IInspectionBS inspectionBS = (IInspectionBS)BSUtils.getBusinessService("inspectionBS",this,mapping.getModuleConfig());
    SecurityInfo securityInfo = (SecurityInfo) request.getSession()
    .getAttribute("SecurityInfo");
    Pagination pagination = (Pagination)request.getSession().getAttribute(PAGINATION_KEY);
    PaginationUtils.updatePagination(pagination, request);
    String flag="";
    flag=(String) request.getAttribute("flag");
    if(flag!=null&&!flag.equals("")){
    inspectionShowAF=inspectionBS.querygjjpayrate(pagination);
    }
    List officeList = securityInfo.getOfficeList();
    List officeList1 = new ArrayList();
    OfficeDto officedto = null;
    Iterator itr1 = officeList.iterator();
    while (itr1.hasNext()) {
      officedto = (OfficeDto) itr1.next();
      officeList1.add(new org.apache.struts.util.LabelValueBean(officedto.getOfficeName(), officedto.getOfficeCode()));
    }
    request.getSession(true).setAttribute("officeList1", officeList1);
    inspectionShowAF.setOperator(securityInfo.getRealName());
    request.setAttribute("inspectionShowAF", inspectionShowAF);
    }catch(Exception e){
      e.printStackTrace();
    }
    return mapping.findForward("to_inspection.jsp");
	}
}