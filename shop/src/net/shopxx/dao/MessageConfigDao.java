/*
 * Copyright 2005-2015 shopxx.net. All rights reserved.
 * Support: http://www.shopxx.net
 * License: http://www.shopxx.net/license
 */
package net.shopxx.dao;

import net.shopxx.entity.MessageConfig;

public interface MessageConfigDao extends BaseDao<MessageConfig, Long> {

	MessageConfig find(MessageConfig.Type type);

}