/*
 * Copyright 2005-2015 shopxx.net. All rights reserved.
 * Support: http://www.shopxx.net
 * License: http://www.shopxx.net/license
 */
package net.shopxx.dao;

import net.shopxx.Page;
import net.shopxx.Pageable;
import net.shopxx.entity.Member;
import net.shopxx.entity.Product;
import net.shopxx.entity.ProductNotify;

public interface ProductNotifyDao extends BaseDao<ProductNotify, Long> {

	boolean exists(Product product, String email);

	Page<ProductNotify> findPage(Member member, Boolean isMarketable, Boolean isOutOfStock, Boolean hasSent, Pageable pageable);

	Long count(Member member, Boolean isMarketable, Boolean isOutOfStock, Boolean hasSent);

}