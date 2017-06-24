/*
 * Copyright 2005-2015 shopxx.net. All rights reserved.
 * Support: http://www.shopxx.net
 * License: http://www.shopxx.net/license
 */
package net.shopxx.service;

import net.shopxx.TemplateConfig;

public interface TemplateService {

	String read(String templateConfigId);

	String read(TemplateConfig templateConfig);

	void write(String templateConfigId, String content);

	void write(TemplateConfig templateConfig, String content);

}