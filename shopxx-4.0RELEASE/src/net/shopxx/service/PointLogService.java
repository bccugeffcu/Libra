/*
 * Copyright 2005-2015 shopxx.net. All rights reserved.
 * Support: http://www.shopxx.net
 * License: http://www.shopxx.net/license
 */
package net.shopxx.service;

import net.shopxx.Page;
import net.shopxx.Pageable;
import net.shopxx.entity.Member;
import net.shopxx.entity.PointLog;

public interface PointLogService extends BaseService<PointLog, Long> {

	Page<PointLog> findPage(Member member, Pageable pageable);

}