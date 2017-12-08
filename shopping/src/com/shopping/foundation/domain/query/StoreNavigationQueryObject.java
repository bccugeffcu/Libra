package com.shopping.foundation.domain.query;

import org.springframework.web.servlet.ModelAndView;

import com.shopping.core.query.QueryObject;

public class StoreNavigationQueryObject extends QueryObject {
	public StoreNavigationQueryObject(String currentPage, ModelAndView mv,
			String orderBy, String orderType) {
		super(currentPage, mv, orderBy, orderType);
	}

	public StoreNavigationQueryObject() {
	}
}
