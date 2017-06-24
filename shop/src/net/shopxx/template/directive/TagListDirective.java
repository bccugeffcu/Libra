/*
 * Copyright 2005-2015 shopxx.net. All rights reserved.
 * Support: http://www.shopxx.net
 * License: http://www.shopxx.net/license
 */
package net.shopxx.template.directive;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import net.shopxx.Filter;
import net.shopxx.Order;
import net.shopxx.entity.Tag;
import net.shopxx.service.TagService;

import org.springframework.stereotype.Component;

import freemarker.core.Environment;
import freemarker.template.TemplateDirectiveBody;
import freemarker.template.TemplateException;
import freemarker.template.TemplateModel;

@Component("tagListDirective")
public class TagListDirective extends BaseDirective {

	private static final String VARIABLE_NAME = "tags";

	@Resource(name = "tagServiceImpl")
	private TagService tagService;

	@SuppressWarnings({ "unchecked", "rawtypes" })
	public void execute(Environment env, Map params, TemplateModel[] loopVars, TemplateDirectiveBody body) throws TemplateException, IOException {
		Integer count = getCount(params);
		List<Filter> filters = getFilters(params, Tag.class);
		List<Order> orders = getOrders(params);
		boolean useCache = useCache(env, params);
		List<Tag> tags = tagService.findList(count, filters, orders, useCache);
		setLocalVariable(VARIABLE_NAME, tags, env, body);
	}

}