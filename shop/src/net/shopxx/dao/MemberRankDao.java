/*
 * Copyright 2005-2015 shopxx.net. All rights reserved.
 * Support: http://www.shopxx.net
 * License: http://www.shopxx.net/license
 */
package net.shopxx.dao;

import java.math.BigDecimal;

import net.shopxx.entity.MemberRank;

public interface MemberRankDao extends BaseDao<MemberRank, Long> {

	boolean nameExists(String name);

	boolean amountExists(BigDecimal amount);

	MemberRank findDefault();

	MemberRank findByAmount(BigDecimal amount);

	void setDefault(MemberRank memberRank);

}