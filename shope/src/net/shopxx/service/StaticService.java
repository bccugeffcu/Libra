/*
 * Copyright 2005-2015 shopxx.net. All rights reserved.
 * Support: http://www.shopxx.net
 * License: http://www.shopxx.net/license
 */
package net.shopxx.service;

import java.util.Date;
import java.util.Map;

import net.shopxx.entity.Article;
import net.shopxx.entity.ArticleCategory;
import net.shopxx.entity.Goods;
import net.shopxx.entity.ProductCategory;

public interface StaticService {

	int generate(String templatePath, String staticPath, Map<String, Object> model);

	int generate(Article article);

	int generate(Goods goods);

	int generateArticle(ArticleCategory articleCategory, Boolean isPublication, Article.GenerateMethod generateMethod, Date beginDate, Date endDate);

	int generateGoods(ProductCategory productCategory, Boolean isMarketable, Goods.GenerateMethod generateMethod, Date beginDate, Date endDate);

	int generateIndex();

	int generateSitemap();

	int generateOther();

	int generateAll();

	int delete(String staticPath);

	int delete(Article article);

	int delete(Goods goods);

	int deleteIndex();

	int deleteOther();

}