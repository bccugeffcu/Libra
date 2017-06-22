/*
 * Copyright 2005-2015 shopxx.net. All rights reserved.
 * Support: http://www.shopxx.net
 * License: http://www.shopxx.net/license
 */
package net.shopxx.dao;

import java.util.List;

import net.shopxx.entity.FriendLink;

public interface FriendLinkDao extends BaseDao<FriendLink, Long> {

	List<FriendLink> findList(FriendLink.Type type);

}