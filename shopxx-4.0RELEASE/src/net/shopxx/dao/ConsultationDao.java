/*
 * Copyright 2005-2015 shopxx.net. All rights reserved.
 * Support: http://www.shopxx.net
 * License: http://www.shopxx.net/license
 */
package net.shopxx.dao;

import java.util.List;

import net.shopxx.Filter;
import net.shopxx.Order;
import net.shopxx.Page;
import net.shopxx.Pageable;
import net.shopxx.entity.Consultation;
import net.shopxx.entity.Goods;
import net.shopxx.entity.Member;

public interface ConsultationDao extends BaseDao<Consultation, Long> {

	List<Consultation> findList(Member member, Goods goods, Boolean isShow, Integer count, List<Filter> filters, List<Order> orders);

	Page<Consultation> findPage(Member member, Goods goods, Boolean isShow, Pageable pageable);

	Long count(Member member, Goods goods, Boolean isShow);

}