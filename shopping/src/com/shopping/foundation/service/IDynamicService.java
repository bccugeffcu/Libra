package com.shopping.foundation.service;

import com.shopping.core.query.support.IPageList;
import com.shopping.core.query.support.IQueryObject;
import com.shopping.foundation.domain.Dynamic;
import java.io.Serializable;
import java.util.List;
import java.util.Map;

public abstract interface IDynamicService
{
  public abstract boolean save(Dynamic paramDynamic);

  public abstract Dynamic getObjById(Long paramLong);

  public abstract boolean delete(Long paramLong);

  public abstract boolean batchDelete(List<Serializable> paramList);

  public abstract IPageList list(IQueryObject paramIQueryObject);

  public abstract boolean update(Dynamic paramDynamic);

  public abstract List<Dynamic> query(String paramString, Map paramMap, int paramInt1, int paramInt2);
}



 
 