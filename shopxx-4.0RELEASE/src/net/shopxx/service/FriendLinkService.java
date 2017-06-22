/*
 * Copyright 2005-2015 shopxx.net. All rights reserved.
 * Support: http://www.shopxx.net
 * License: http://www.shopxx.net/license
 */
package net.shopxx.service;

import java.util.List;

import net.shopxx.Filter;
import net.shopxx.Order;
import net.shopxx.entity.FriendLink;

public interface FriendLinkService extends BaseService<FriendLink, Long> {

	List<FriendLink> findList(FriendLink.Type type);

	List<FriendLink> findList(Integer count, List<Filter> filters, List<Order> orders, boolean useCache);

}