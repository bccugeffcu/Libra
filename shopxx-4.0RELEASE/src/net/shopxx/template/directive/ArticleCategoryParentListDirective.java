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

import net.shopxx.entity.ArticleCategory;
import net.shopxx.service.ArticleCategoryService;
import net.shopxx.util.FreeMarkerUtils;

import org.springframework.stereotype.Component;

import freemarker.core.Environment;
import freemarker.template.TemplateDirectiveBody;
import freemarker.template.TemplateException;
import freemarker.template.TemplateModel;

@Component("articleCategoryParentListDirective")
public class ArticleCategoryParentListDirective extends BaseDirective {

	private static final String ARTICLE_CATEGORY_ID_PARAMETER_NAME = "articleCategoryId";

	private static final String RECURSIVE_PARAMETER_NAME = "recursive";

	private static final String VARIABLE_NAME = "articleCategories";

	@Resource(name = "articleCategoryServiceImpl")
	private ArticleCategoryService articleCategoryService;

	@SuppressWarnings({ "unchecked", "rawtypes" })
	public void execute(Environment env, Map params, TemplateModel[] loopVars, TemplateDirectiveBody body) throws TemplateException, IOException {
		Long articleCategoryId = FreeMarkerUtils.getParameter(ARTICLE_CATEGORY_ID_PARAMETER_NAME, Long.class, params);
		Boolean recursive = FreeMarkerUtils.getParameter(RECURSIVE_PARAMETER_NAME, Boolean.class, params);
		Integer count = getCount(params);
		boolean useCache = useCache(env, params);
		List<ArticleCategory> articleCategories = articleCategoryService.findParents(articleCategoryId, recursive != null ? recursive : true, count, useCache);
		setLocalVariable(VARIABLE_NAME, articleCategories, env, body);
	}

}