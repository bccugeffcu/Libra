/*
 * Copyright 2005-2015 shopxx.net. All rights reserved.
 * Support: http://www.shopxx.net
 * License: http://www.shopxx.net/license
 */
package net.shopxx.service;

import java.util.List;

import net.shopxx.Filter;
import net.shopxx.Order;
import net.shopxx.entity.Tag;

public interface TagService extends BaseService<Tag, Long> {

	List<Tag> findList(Tag.Type type);

	List<Tag> findList(Integer count, List<Filter> filters, List<Order> orders, boolean useCache);

}