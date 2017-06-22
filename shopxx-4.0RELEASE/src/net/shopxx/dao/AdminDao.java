/*
 * Copyright 2005-2015 shopxx.net. All rights reserved.
 * Support: http://www.shopxx.net
 * License: http://www.shopxx.net/license
 */
package net.shopxx.dao;

import net.shopxx.entity.Admin;

public interface AdminDao extends BaseDao<Admin, Long> {

	boolean usernameExists(String username);

	Admin findByUsername(String username);

}