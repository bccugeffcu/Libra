/*
 * Copyright 2005-2015 shopxx.net. All rights reserved.
 * Support: http://www.shopxx.net
 * License: http://www.shopxx.net/license
 */
package net.shopxx.service;

import java.util.List;
import java.util.Set;

import net.shopxx.entity.Admin;
import net.shopxx.entity.Goods;
import net.shopxx.entity.Product;
import net.shopxx.entity.StockLog;

public interface ProductService extends BaseService<Product, Long> {

	boolean snExists(String sn);

	Product findBySn(String sn);

	List<Product> search(Goods.Type type, String keyword, Set<Product> excludes, Integer count);

	void addStock(Product product, int amount, StockLog.Type type, Admin operator, String memo);

	void addAllocatedStock(Product product, int amount);

	void filter(List<Product> products);

}