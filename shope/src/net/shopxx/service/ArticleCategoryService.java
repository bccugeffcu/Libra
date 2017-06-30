/*
 * Copyright 2005-2015 shopxx.net. All rights reserved.
 * Support: http://www.shopxx.net
 * License: http://www.shopxx.net/license
 */
package net.shopxx.service;

import java.util.List;

import net.shopxx.entity.ArticleCategory;

public interface ArticleCategoryService extends BaseService<ArticleCategory, Long> {

	List<ArticleCategory> findRoots();

	List<ArticleCategory> findRoots(Integer count);

	List<ArticleCategory> findRoots(Integer count, boolean useCache);

	List<ArticleCategory> findParents(ArticleCategory articleCategory, boolean recursive, Integer count);

	List<ArticleCategory> findParents(Long articleCategoryId, boolean recursive, Integer count, boolean useCache);

	List<ArticleCategory> findTree();

	List<ArticleCategory> findChildren(ArticleCategory articleCategory, boolean recursive, Integer count);

	List<ArticleCategory> findChildren(Long articleCategoryId, boolean recursive, Integer count, boolean useCache);

}