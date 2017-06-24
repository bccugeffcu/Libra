/*
 * Copyright 2005-2015 shopxx.net. All rights reserved.
 * Support: http://www.shopxx.net
 * License: http://www.shopxx.net/license
 */
package net.shopxx.template.directive;

import java.io.IOException;
import java.util.Map;

import javax.annotation.Resource;

import net.shopxx.entity.Seo;
import net.shopxx.service.SeoService;
import net.shopxx.util.FreeMarkerUtils;

import org.springframework.stereotype.Component;

import freemarker.core.Environment;
import freemarker.template.TemplateDirectiveBody;
import freemarker.template.TemplateException;
import freemarker.template.TemplateModel;

@Component("seoDirective")
public class SeoDirective extends BaseDirective {

	private static final String TYPE_PARAMETER_NAME = "type";

	private static final String VARIABLE_NAME = "seo";

	@Resource(name = "seoServiceImpl")
	private SeoService seoService;

	@SuppressWarnings({ "unchecked", "rawtypes" })
	public void execute(Environment env, Map params, TemplateModel[] loopVars, TemplateDirectiveBody body) throws TemplateException, IOException {
		Seo.Type type = FreeMarkerUtils.getParameter(TYPE_PARAMETER_NAME, Seo.Type.class, params);
		boolean useCache = useCache(env, params);
		Seo seo = seoService.find(type, useCache);
		setLocalVariable(VARIABLE_NAME, seo, env, body);
	}

}