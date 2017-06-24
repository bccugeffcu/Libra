/*
 * Copyright 2005-2015 shopxx.net. All rights reserved.
 * Support: http://www.shopxx.net
 * License: http://www.shopxx.net/license
 */
package net.shopxx.service;

import net.shopxx.entity.PluginConfig;

public interface PluginConfigService extends BaseService<PluginConfig, Long> {

	boolean pluginIdExists(String pluginId);

	PluginConfig findByPluginId(String pluginId);

	void deleteByPluginId(String pluginId);

}