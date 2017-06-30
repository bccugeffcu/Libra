/*
 * Copyright 2005-2015 shopxx.net. All rights reserved.
 * Support: http://www.shopxx.net
 * License: http://www.shopxx.net/license
 */
package net.shopxx.service;

import java.math.BigDecimal;

import net.shopxx.Page;
import net.shopxx.Pageable;
import net.shopxx.entity.Article;
import net.shopxx.entity.Goods;

public interface SearchService {

	void index();

	void index(Class<?> type);

	void index(Article article);

	void index(Goods goods);

	void purge();

	void purge(Class<?> type);

	void purge(Article article);

	void purge(Goods goods);

	Page<Article> search(String keyword, Pageable pageable);

	Page<Goods> search(String keyword, BigDecimal startPrice, BigDecimal endPrice, Goods.OrderType orderType, Pageable pageable);

}