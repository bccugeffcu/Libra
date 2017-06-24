/*
 * Copyright 2005-2015 shopxx.net. All rights reserved.
 * Support: http://www.shopxx.net
 * License: http://www.shopxx.net/license
 */
package net.shopxx.dao;

import java.util.List;

import net.shopxx.entity.Cart;

public interface CartDao extends BaseDao<Cart, Long> {

	Cart findByKey(String key);

	List<Cart> findList(Boolean hasExpired, Integer count);

}