/*
 * Copyright 2005-2015 shopxx.net. All rights reserved.
 * Support: http://www.shopxx.net
 * License: http://www.shopxx.net/license
 */
package net.shopxx.job;

import java.util.Calendar;

import javax.annotation.Resource;

import net.shopxx.entity.Statistic;
import net.shopxx.service.StatisticService;

import org.springframework.context.annotation.Lazy;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

@Lazy(false)
@Component("statisticJob")
public class StatisticJob {

	@Resource(name = "statisticServiceImpl")
	private StatisticService statisticService;

	@Scheduled(cron = "${job.statistic_collect.cron}")
	public void collect() {
		Calendar calendar = Calendar.getInstance();
		calendar.add(Calendar.DAY_OF_MONTH, -1);
		int year = calendar.get(Calendar.YEAR);
		int month = calendar.get(Calendar.MONTH);
		int day = calendar.get(Calendar.DAY_OF_MONTH);
		if (statisticService.exists(year, month, day)) {
			return;
		}
		Statistic statistic = statisticService.collect(year, month, day);
		statisticService.save(statistic);
	}

}