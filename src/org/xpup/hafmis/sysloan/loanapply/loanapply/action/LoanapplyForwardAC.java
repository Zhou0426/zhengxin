/*
 * Generated by MyEclipse Struts
 * Template path: templates/java/JavaClass.vtl
 */
package org.xpup.hafmis.sysloan.loanapply.loanapply.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

/** 
 * MyEclipse Struts
 * Creation date: 10-19-2007
 * 
 * XDoclet definition:
 * @struts.action validate="true"
 */
public class LoanapplyForwardAC extends Action {
	/*
	 * Generated Methods
	 */

	/** 
	 * Method execute
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return ActionForward
	 */
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
    request.getSession().setAttribute("remend",null);
    request.getSession().setAttribute("contractid", null);
//    request.getSession().setAttribute(LoanapplyTeShowAC.PAGINATION_KEY, null);
		return mapping.findForward("showLoanapplytaAC");
	}
}