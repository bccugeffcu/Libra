/*
 * Copyright 2005-2015 shopxx.net. All rights reserved.
 * Support: http://www.shopxx.net
 * License: http://www.shopxx.net/license
 */
package net.shopxx.service;

import java.math.BigDecimal;
import java.util.List;

import net.shopxx.Page;
import net.shopxx.Pageable;
import net.shopxx.entity.Admin;
import net.shopxx.entity.DepositLog;
import net.shopxx.entity.Member;
import net.shopxx.entity.PointLog;

public interface MemberService extends BaseService<Member, Long> {

	boolean usernameExists(String username);

	boolean usernameDisabled(String username);

	boolean emailExists(String email);

	boolean emailUnique(String previousEmail, String currentEmail);

	Member find(String loginPluginId, String openId);

	Member findByUsername(String username);

	List<Member> findListByEmail(String email);

	Page<Member> findPage(Member.RankingType rankingType, Pageable pageable);

	boolean isAuthenticated();

	Member getCurrent();

	Member getCurrent(boolean lock);

	String getCurrentUsername();

	void addBalance(Member member, BigDecimal amount, DepositLog.Type type, Admin operator, String memo);

	void addPoint(Member member, long amount, PointLog.Type type, Admin operator, String memo);

	void addAmount(Member member, BigDecimal amount);

}