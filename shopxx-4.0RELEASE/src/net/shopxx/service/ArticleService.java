/*
 * Copyright 2005-2015 shopxx.net. All rights reserved.
 * Support: http://www.shopxx.net
 * License: http://www.shopxx.net/license
 */
package net.shopxx.service;

import java.util.Date;
import java.util.List;

import net.shopxx.Filter;
import net.shopxx.Order;
import net.shopxx.Page;
import net.shopxx.Pageable;
import net.shopxx.entity.Article;
import net.shopxx.entity.ArticleCategory;
import net.shopxx.entity.Tag;

public interface ArticleService extends BaseService<Article, Long> {

	List<Article> findList(ArticleCategory articleCategory, Tag tag, Boolean isPublication, Integer count, List<Filter> filters, List<Order> orders);

	List<Article> findList(Long articleCategoryId, Long tagId, Boolean isPublication, Integer count, List<Filter> filters, List<Order> orders, boolean useCache);

	List<Article> findList(ArticleCategory articleCategory, Boolean isPublication, Article.GenerateMethod generateMethod, Date beginDate, Date endDate, Integer first, Integer count);

	Page<Article> findPage(ArticleCategory articleCategory, Tag tag, Boolean isPublication, Pageable pageable);

	long viewHits(Long id);

}