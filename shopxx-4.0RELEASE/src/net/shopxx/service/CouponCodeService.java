/*
 * Copyright 2005-2015 shopxx.net. All rights reserved.
 * Support: http://www.shopxx.net
 * License: http://www.shopxx.net/license
 */
package net.shopxx.service;

import java.util.List;

import net.shopxx.Page;
import net.shopxx.Pageable;
import net.shopxx.entity.Admin;
import net.shopxx.entity.Coupon;
import net.shopxx.entity.CouponCode;
import net.shopxx.entity.Member;

public interface CouponCodeService extends BaseService<CouponCode, Long> {

	boolean codeExists(String code);

	CouponCode findByCode(String code);

	CouponCode generate(Coupon coupon, Member member);

	List<CouponCode> generate(Coupon coupon, Member member, Integer count);

	CouponCode exchange(Coupon coupon, Member member, Admin operator);

	Page<CouponCode> findPage(Member member, Pageable pageable);

	Long count(Coupon coupon, Member member, Boolean hasBegun, Boolean hasExpired, Boolean isUsed);

}