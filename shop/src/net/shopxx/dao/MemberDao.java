/*
 * Copyright 2005-2015 shopxx.net. All rights reserved.
 * Support: http://www.shopxx.net
 * License: http://www.shopxx.net/license
 */
package net.shopxx.dao;

import java.util.Date;
import java.util.List;

import net.shopxx.Page;
import net.shopxx.Pageable;
import net.shopxx.entity.Member;
import net.shopxx.entity.MemberAttribute;

public interface MemberDao extends BaseDao<Member, Long> {

	boolean usernameExists(String username);

	boolean emailExists(String email);

	Member find(String loginPluginId, String openId);

	Member findByUsername(String username);

	List<Member> findListByEmail(String email);

	Page<Member> findPage(Member.RankingType rankingType, Pageable pageable);

	Long registerMemberCount(Date beginDate, Date endDate);

	void clearAttributeValue(MemberAttribute memberAttribute);

}