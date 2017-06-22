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
import net.shopxx.entity.Consultation;
import net.shopxx.entity.Goods;
import net.shopxx.entity.Member;

public interface ConsultationService extends BaseService<Consultation, Long> {

	List<Consultation> findList(Member member, Goods goods, Boolean isShow, Integer count, List<Filter> filters, List<Order> orders);

	List<Consultation> findList(Long memberId, Long goodsId, Boolean isShow, Integer count, List<Filter> filters, List<Order> orders, boolean useCache);

	Page<Consultation> findPage(Member member, Goods goods, Boolean isShow, Pageable pageable);

	Long count(Member member, Goods goods, Boolean isShow);

	void reply(Consultation consultation, Consultation replyConsultation);

}