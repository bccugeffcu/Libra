/*
 * Copyright 2005-2015 shopxx.net. All rights reserved.
 * Support: http://www.shopxx.net
 * License: http://www.shopxx.net/license
 */
package net.shopxx.service;

import java.util.List;

import net.shopxx.Filter;
import net.shopxx.Order;
import net.shopxx.entity.Attribute;
import net.shopxx.entity.ProductCategory;

public interface AttributeService extends BaseService<Attribute, Long> {

	Integer findUnusedPropertyIndex(ProductCategory productCategory);

	List<Attribute> findList(ProductCategory productCategory, Integer count, List<Filter> filters, List<Order> orders);

	List<Attribute> findList(Long productCategoryId, Integer count, List<Filter> filters, List<Order> orders, boolean useCache);

	String toAttributeValue(Attribute attribute, String value);

}