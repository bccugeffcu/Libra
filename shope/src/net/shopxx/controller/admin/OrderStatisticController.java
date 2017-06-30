/*
 * Copyright 2005-2015 shopxx.net. All rights reserved.
 * Support: http://www.shopxx.net
 * License: http://www.shopxx.net/license
 */
package net.shopxx.controller.admin;

import java.util.Date;

import javax.annotation.Resource;

import net.shopxx.entity.Statistic;
import net.shopxx.service.StatisticService;

import org.apache.commons.lang.time.DateUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller("adminOrderStatisticController")
@RequestMapping("/admin/order_statistic")
public class OrderStatisticController extends BaseController {

	@Resource(name = "statisticServiceImpl")
	private StatisticService statisticService;

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(Statistic.Period period, Date beginDate, Date endDate, Model model) {
		if (period == null) {
			period = Statistic.Period.day;
		}
		if (beginDate == null) {
			switch (period) {
			case year:
				beginDate = DateUtils.addYears(new Date(), -10);
				break;
			case month:
				beginDate = DateUtils.addYears(new Date(), -1);
				break;
			case day:
				beginDate = DateUtils.addMonths(new Date(), -1);
				break;
			}
		}
		if (endDate == null) {
			endDate = new Date();
		}
		model.addAttribute("periods", Statistic.Period.values());
		model.addAttribute("period", period);
		model.addAttribute("beginDate", beginDate);
		model.addAttribute("endDate", endDate);
		model.addAttribute("statistics", statisticService.analyze(period, beginDate, endDate));
		return "/admin/order_statistic/list";
	}

}