/*
 * Copyright 2005-2015 shopxx.net. All rights reserved.
 * Support: http://www.shopxx.net
 * License: http://www.shopxx.net/license
 */
package net.shopxx.dao;

import net.shopxx.Page;
import net.shopxx.Pageable;
import net.shopxx.entity.Coupon;
import net.shopxx.entity.CouponCode;
import net.shopxx.entity.Member;

public interface CouponCodeDao extends BaseDao<CouponCode, Long> {

	boolean codeExists(String code);

	CouponCode findByCode(String code);

	Page<CouponCode> findPage(Member member, Pageable pageable);

	Long count(Coupon coupon, Member member, Boolean hasBegun, Boolean hasExpired, Boolean isUsed);

}