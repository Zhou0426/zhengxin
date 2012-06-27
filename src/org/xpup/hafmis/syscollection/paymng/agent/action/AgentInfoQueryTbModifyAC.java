/*
 * Generated by MyEclipse Struts
 * Template path: templates/java/JavaClass.vtl
 */
package org.xpup.hafmis.syscollection.paymng.agent.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;
import org.xpup.hafmis.common.form.IdAF;

/** 
 * MyEclipse Struts
 * Creation date: 12-19-2007
 * 
 * XDoclet definition:
 * @struts.action path="/agentInfoQueryTbModifyAC" name="idAF" parameter="methods" scope="request" validate="true"
 */
public class AgentInfoQueryTbModifyAC extends DispatchAction {
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
	public ActionForward queryEmpInfo(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		IdAF idAF = (IdAF) form;// TODO Auto-generated method stub
    request.setAttribute("orgId_num", idAF.getId().toString().trim());
		return mapping.findForward("agentInfoQueryTcShowAC");
	}
  
  public ActionForward queryBack(ActionMapping mapping, ActionForm form,
      HttpServletRequest request, HttpServletResponse response) {
    //IdAF idAF = (IdAF) form;// TODO Auto-generated method stub
    HttpSession session = request.getSession();
    session.setAttribute(AgentInfoQueryTbShowAC.PAGINATION_KEY, null);
    session.setAttribute("payId_num_session", null);
    return mapping.findForward("agentInfoQueryTaShowAC");
  }
}