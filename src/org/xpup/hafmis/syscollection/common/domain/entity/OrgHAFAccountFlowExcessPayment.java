package org.xpup.hafmis.syscollection.common.domain.entity;
/**
 * 单位住房公积业务流水-挂账  
 * 
 * @author王菱 2007-6-20
 */
public class OrgHAFAccountFlowExcessPayment extends OrgHAFAccountFlow{
  
  private static final long serialVersionUID = -3745806964079944938L;

  /** persistent field */
  private String bizType;

  public String getBizType() {
    return "挂账";
  }
  
}