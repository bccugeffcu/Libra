/*
 * Copyright 2005-2015 shopxx.net. All rights reserved.
 * Support: http://www.shopxx.net
 * License: http://www.shopxx.net/license
 */
package net.shopxx.service;

import java.util.List;

import net.shopxx.Filter;
import net.shopxx.Order;
import net.shopxx.entity.Navigation;

public interface NavigationService extends BaseService<Navigation, Long> {

	List<Navigation> findList(Navigation.Position position);

	List<Navigation> findList(Integer count, List<Filter> filters, List<Order> orders, boolean useCache);

}