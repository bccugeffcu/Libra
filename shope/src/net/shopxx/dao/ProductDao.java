/*
 * Copyright 2005-2015 shopxx.net. All rights reserved.
 * Support: http://www.shopxx.net
 * License: http://www.shopxx.net/license
 */
package net.shopxx.dao;

import java.util.List;
import java.util.Set;

import net.shopxx.entity.Goods;
import net.shopxx.entity.Product;

public interface ProductDao extends BaseDao<Product, Long> {

	boolean snExists(String sn);

	Product findBySn(String sn);

	List<Product> search(Goods.Type type, String keyword, Set<Product> excludes, Integer count);

}