package org.xpup.hafmis.sysfinance.accmng.listacc.action;

import java.util.HashMap;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.xpup.common.util.Pagination;
import org.xpup.hafmis.sysfinance.accmng.listacc.form.ListaccAF;

public class ListaccFindAC extends Action {

  public ActionForward execute(ActionMapping mapping, ActionForm form,
      HttpServletRequest request, HttpServletResponse response)
      throws Exception {

    ListaccAF f = (ListaccAF) form;
    HashMap criterions = makeCriterionsMap(f);

    Pagination pagination = new Pagination(0, 10, 1, "", "DESC", criterions);
    String paginationKey = getPaginationKey();
    request.getSession().setAttribute(paginationKey, pagination);
    request.setAttribute("find", "1");
    f.reset(mapping, request);

    return mapping.findForward(getForword());
  }

  protected String getForword() {
    return "listaccShowAC";
  }

  protected String getPaginationKey() {
    return "org.xpup.hafmis.sysfinance.accmng.listacc.action.ListaccShowAC";
  }

  protected HashMap makeCriterionsMap(ListaccAF form) {
    HashMap m = new HashMap();
    String bizyear = form.getBizyear().trim();
    String starperiod = form.getStarperiod().trim();
    String endperiod = form.getEndperiod().trim();
    String starsubject = form.getStarsubject().trim();
    String office = form.getOffice().trim();

    if (!(bizyear == null || "".equals(bizyear)))
      m.put("bizyear", bizyear);

    if (!(starperiod == null || starperiod.length() == 0)) {
      if (starperiod.length() == 1) {
        starperiod = "0" + starperiod;
      }
    }
    m.put("starperiod", starperiod);

    if (!(endperiod == null || endperiod.length() == 0)) {
      if (endperiod.length() == 1) {
        endperiod = "0" + endperiod;
      }
    }
    m.put("endperiod", endperiod);

    if (!(starsubject == null || starsubject.length() == 0))
      m.put("starsubject", starsubject);

    if (!(office == null || office.length() == 0))
      m.put("office", office);
    
    return m;
  }
}
