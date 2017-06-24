/*
 * Copyright 2005-2015 shopxx.net. All rights reserved.
 * Support: http://www.shopxx.net
 * License: http://www.shopxx.net/license
 */
package net.shopxx.service;

import java.util.List;

import net.shopxx.Filter;
import net.shopxx.Order;
import net.shopxx.entity.MemberRank;
import net.shopxx.entity.ProductCategory;
import net.shopxx.entity.Promotion;

public interface PromotionService extends BaseService<Promotion, Long> {

	boolean isValidPriceExpression(String priceExpression);

	boolean isValidPointExpression(String pointExpression);

	List<Promotion> findList(MemberRank memberRank, ProductCategory productCategory, Boolean hasBegun, Boolean hasEnded, Integer count, List<Filter> filters, List<Order> orders);

	List<Promotion> findList(Long memberRankId, Long productCategoryId, Boolean hasBegun, Boolean hasEnded, Integer count, List<Filter> filters, List<Order> orders, boolean useCache);

}