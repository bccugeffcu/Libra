/*
 * Copyright 2005-2015 shopxx.net. All rights reserved.
 * Support: http://www.shopxx.net
 * License: http://www.shopxx.net/license
 */
package net.shopxx.service;

import net.shopxx.Page;
import net.shopxx.Pageable;
import net.shopxx.entity.DepositLog;
import net.shopxx.entity.Member;

public interface DepositLogService extends BaseService<DepositLog, Long> {

	Page<DepositLog> findPage(Member member, Pageable pageable);

}