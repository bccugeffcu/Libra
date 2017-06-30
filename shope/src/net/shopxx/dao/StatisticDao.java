/*
 * Copyright 2005-2015 shopxx.net. All rights reserved.
 * Support: http://www.shopxx.net
 * License: http://www.shopxx.net/license
 */
package net.shopxx.dao;

import java.util.Date;
import java.util.List;

import net.shopxx.entity.Statistic;

public interface StatisticDao extends BaseDao<Statistic, Long> {

	boolean exists(int year, int month, int day);

	List<Statistic> analyze(Statistic.Period period, Date beginDate, Date endDate);

}