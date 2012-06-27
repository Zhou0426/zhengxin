/*
 * Generated by MyEclipse Struts
 * Template path: templates/java/JavaClass.vtl
 */
package org.xpup.hafmis.sysfinance.bookmng.settlemodle.action;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;
import org.apache.struts.action.ActionMessages;
import org.apache.struts.actions.LookupDispatchAction;
import org.xpup.common.util.BSUtils;
import org.xpup.hafmis.common.form.IdAF;
import org.xpup.hafmis.orgstrct.dto.SecurityInfo;
import org.xpup.hafmis.sysfinance.bookmng.settlemodle.bsinterface.ISettlemodleBS;
import org.xpup.hafmis.sysfinance.bookmng.settlemodle.dto.SettlemodleDTO;

/** 
 * MyEclipse Struts
 * Creation date: 10-24-2007
 * Copy Right Information   : ���㷽ʽ
 * Project                  : �ļ���
 * @Version                 : 1.0
 * @author                  : ����
 * ��������                   : 10-24-2007
 * XDoclet definition:
 * @struts.action path="/settlemodleMainTainAC" name="idAF" scope="request" validate="true"
 */
public class SettlemodleMainTainAC extends LookupDispatchAction {
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
	public ActionForward updateSettlemodle(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		IdAF idaf = (IdAF) form;// TODO Auto-generated method stub
    try {
      String paraId = idaf.getId().toString();
      ISettlemodleBS settlemodleBS = (ISettlemodleBS) BSUtils.getBusinessService(
          "settlemodleBS", this, mapping.getModuleConfig());
      boolean temp_isSettlemodle = settlemodleBS.isSettlemodleById(paraId);
      if(!temp_isSettlemodle){
        ActionMessages messages = new ActionMessages();
        messages.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage("�ü�¼������,�����޸�!",
            false));
        saveErrors(request, messages);
        return mapping.findForward("settlemodleShowAC");
      }
      //����ID ��ѯ���㷽ʽ
      SettlemodleDTO settlemodleDTO = settlemodleBS.querySettlemodleParamExplainInfo(paraId);
      String paramExplain = settlemodleDTO.getParamExplain();
      request.setAttribute("paraId", paraId);
      request.setAttribute("paramExplain", paramExplain);
      request.setAttribute("updateInfo", "updateInfo");
    } catch (Exception e) {
      e.printStackTrace();
    }
    return mapping.findForward("settlemodleShowAC");
	}
  
  public ActionForward deleteSettlemodle(ActionMapping mapping, ActionForm form,
      HttpServletRequest request, HttpServletResponse response) {
    IdAF idaf = (IdAF) form;// TODO Auto-generated method stub
    try {
      String paraId = idaf.getId().toString();
      ISettlemodleBS settlemodleBS = (ISettlemodleBS) BSUtils.getBusinessService(
          "settlemodleBS", this, mapping.getModuleConfig());
      //Ȩ��
      SecurityInfo securityInfo = (SecurityInfo) request.getSession()
          .getAttribute("SecurityInfo");
      //bookId
      String bookId = securityInfo.getBookId();
      //����ID �ж��Ƿ��м�¼
      boolean temp_settlemodle = settlemodleBS.isSettlemodleById(paraId);
      
      
      if(temp_settlemodle){//�м�¼
        //�жϸü�¼��FN102.PARA_ID��FN201.SETT_TYPE or FN210.SETT_TYPE���Ƿ����
        boolean temp_Existence = settlemodleBS.isSettlemodleByParamValue(paraId, bookId);
        if(temp_Existence){//������
          //ɾ�� paramId ��¼
          settlemodleBS.deleteSettlemodleInfo(paraId, securityInfo);
        }else{//����
          ActionMessages messages = new ActionMessages();
          messages.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage("������¼�ѱ�Ӧ�ã�������ɾ��!",
              false));
          saveErrors(request, messages);
        }
      }else{
        //û�м�¼
        ActionMessages messages = new ActionMessages();
        messages.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage("�ü�¼��ɾ��!",
            false));
        saveErrors(request, messages);
      }
      
    } catch (Exception e) {
      e.printStackTrace();
    }
    return mapping.findForward("settlemodleShowAC");
  }

  protected Map getKeyMethodMap() {
    Map map = new HashMap();
    map.put("button.update", "updateSettlemodle");
    map.put("button.delete", "deleteSettlemodle");
    return map;
  }
}