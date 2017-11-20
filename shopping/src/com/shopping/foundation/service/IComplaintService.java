package com.shopping.foundation.service;

import com.shopping.core.query.support.IPageList;
import com.shopping.core.query.support.IQueryObject;
import com.shopping.foundation.domain.Complaint;
import java.io.Serializable;
import java.util.List;
import java.util.Map;

public abstract interface IComplaintService
{
  public abstract boolean save(Complaint paramComplaint);

  public abstract Complaint getObjById(Long paramLong);

  public abstract boolean delete(Long paramLong);

  public abstract boolean batchDelete(List<Serializable> paramList);

  public abstract IPageList list(IQueryObject paramIQueryObject);

  public abstract boolean update(Complaint paramComplaint);

  public abstract List<Complaint> query(String paramString, Map paramMap, int paramInt1, int paramInt2);
}



 
 