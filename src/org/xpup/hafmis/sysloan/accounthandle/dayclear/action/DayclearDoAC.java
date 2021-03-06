package org.xpup.hafmis.sysloan.accounthandle.dayclear.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;
import org.apache.struts.action.ActionMessages;
import org.xpup.common.exception.BusinessException;
import org.xpup.common.util.BSUtils;
import org.xpup.hafmis.common.form.IdAF;
import org.xpup.hafmis.common.util.BusiTools;
import org.xpup.hafmis.common.util.bizlog.BusiLogConst;
import org.xpup.hafmis.orgstrct.dto.SecurityInfo;
import org.xpup.hafmis.sysloan.accounthandle.dayclear.form.DayclearAF;
import org.xpup.security.wsf.bizsrvc.IUserControlBS;

public class DayclearDoAC extends Action {

  public ActionForward execute(ActionMapping arg0, ActionForm arg1,
      HttpServletRequest arg2, HttpServletResponse arg3) throws Exception {
    ActionMessages messages = null;
    try {
      IdAF lform = (IdAF) arg1;
      SecurityInfo securityInfo = (SecurityInfo) arg2.getSession()
          .getAttribute("SecurityInfo");
      IUserControlBS securityControlBS = (IUserControlBS) BSUtils
          .getBusinessService("securityControlBS", this, arg0.getModuleConfig());

      String[] rowArray = lform.getRowArray();
      securityControlBS.updatePLBizDate_jj(rowArray);
      messages = new ActionMessages();
      messages
          .add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage("0", false));
      saveErrors(arg2, messages);
    } catch (BusinessException bex) {
      messages = new ActionMessages();
      messages.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(bex
          .getMessage(), false));
      saveErrors(arg2, messages);
    }
    return arg0.findForward("dayclearShowAC");
  }

}
