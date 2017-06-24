/*
 * Copyright 2005-2015 shopxx.net. All rights reserved.
 * Support: http://www.shopxx.net
 * License: http://www.shopxx.net/license
 */
package net.shopxx.service;

import java.util.List;

import net.shopxx.Filter;
import net.shopxx.Order;
import net.shopxx.entity.Brand;
import net.shopxx.entity.ProductCategory;

public interface BrandService extends BaseService<Brand, Long> {

	List<Brand> findList(ProductCategory productCategory, Integer count, List<Filter> filters, List<Order> orders);

	List<Brand> findList(Long productCategoryId, Integer count, List<Filter> filters, List<Order> orders, boolean useCache);

}