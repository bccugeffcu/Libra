package com.shopping.foundation.service;

import com.shopping.core.query.support.IPageList;
import com.shopping.core.query.support.IQueryObject;
import com.shopping.foundation.domain.GoldRecord;
import java.io.Serializable;
import java.util.List;
import java.util.Map;

public abstract interface IGoldRecordService {
	public abstract boolean save(GoldRecord paramGoldRecord);

	public abstract GoldRecord getObjById(Long paramLong);

	public abstract boolean delete(Long paramLong);

	public abstract boolean batchDelete(List<Serializable> paramList);

	public abstract IPageList list(IQueryObject paramIQueryObject);

	public abstract boolean update(GoldRecord paramGoldRecord);

	public abstract List<GoldRecord> query(String paramString, Map paramMap,
			int paramInt1, int paramInt2);
}
