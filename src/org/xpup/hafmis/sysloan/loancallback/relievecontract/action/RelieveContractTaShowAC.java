/*
 * Generated by MyEclipse Struts
 * Template path: templates/java/JavaClass.vtl
 */
package org.xpup.hafmis.sysloan.loancallback.relievecontract.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.xpup.hafmis.sysloan.loancallback.relievecontract.form.RelieveContractTaAF;

/** 
 * MyEclipse Struts
 * Creation date: 09-20-2007
 * 
 * XDoclet definition:
 * @struts.action validate="true"
 */
public class RelieveContractTaShowAC extends Action {
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
    RelieveContractTaAF relieveContractTaAF=new RelieveContractTaAF();
    request.setAttribute("relieveContractTaAF", relieveContractTaAF);
    return mapping.findForward("to_relievecontractta_show");
	}
}