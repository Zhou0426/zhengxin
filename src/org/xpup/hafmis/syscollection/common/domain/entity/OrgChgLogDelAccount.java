package org.xpup.hafmis.syscollection.common.domain.entity;
/**
 * 单位变更日志-销户
 * 
 * @author王菱 2007-6-19
 */
public class OrgChgLogDelAccount extends OrgChgLog{
  
  private static final long serialVersionUID = -3745806964079944938L;

  /** persistent field */
  private String chgtype;

  public String getChgtype() {
    return "销户";
  }
  
}
