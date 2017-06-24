/*
 * Copyright 2005-2015 shopxx.net. All rights reserved.
 * Support: http://www.shopxx.net
 * License: http://www.shopxx.net/license
 */
package net.shopxx.service;

import java.util.List;

import net.shopxx.Filter;
import net.shopxx.Order;
import net.shopxx.Page;
import net.shopxx.Pageable;
import net.shopxx.entity.Goods;
import net.shopxx.entity.Member;
import net.shopxx.entity.Review;

public interface ReviewService extends BaseService<Review, Long> {

	List<Review> findList(Member member, Goods goods, Review.Type type, Boolean isShow, Integer count, List<Filter> filters, List<Order> orders);

	List<Review> findList(Long memberId, Long goodsId, Review.Type type, Boolean isShow, Integer count, List<Filter> filters, List<Order> orders, boolean useCache);

	Page<Review> findPage(Member member, Goods goods, Review.Type type, Boolean isShow, Pageable pageable);

	Long count(Member member, Goods goods, Review.Type type, Boolean isShow);

	boolean hasPermission(Member member, Goods goods);

}