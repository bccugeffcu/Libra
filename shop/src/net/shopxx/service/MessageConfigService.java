/*
 * Copyright 2005-2015 shopxx.net. All rights reserved.
 * Support: http://www.shopxx.net
 * License: http://www.shopxx.net/license
 */
package net.shopxx.service;

import net.shopxx.entity.MessageConfig;

public interface MessageConfigService extends BaseService<MessageConfig, Long> {

	MessageConfig find(MessageConfig.Type type);

}