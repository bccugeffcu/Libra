/*
 * Copyright 2005-2015 shopxx.net. All rights reserved.
 * Support: http://www.shopxx.net
 * License: http://www.shopxx.net/license
 */
package net.shopxx.job;

import javax.annotation.Resource;

import net.shopxx.entity.Article;
import net.shopxx.entity.Goods;
import net.shopxx.service.StaticService;

import org.springframework.context.annotation.Lazy;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

@Lazy(false)
@Component("staticJob")
public class StaticJob {

	@Resource(name = "staticServiceImpl")
	private StaticService staticService;

	@Scheduled(fixedDelayString = "${job.static_generate_index.delay}")
	public void generateIndex() {
		staticService.generateIndex();
	}

	@Scheduled(fixedDelayString = "${job.static_generate_eager_article.delay}")
	public void generateEagerArticle() {
		staticService.generateArticle(null, null, Article.GenerateMethod.eager, null, null);
	}

	@Scheduled(fixedDelayString = "${job.static_generate_lazy_article.delay}")
	public void generateLazyArticle() {
		staticService.generateArticle(null, null, Article.GenerateMethod.lazy, null, null);
	}

	@Scheduled(fixedDelayString = "${job.static_generate_eager_goods.delay}")
	public void generateEagerGoods() {
		staticService.generateGoods(null, null, Goods.GenerateMethod.eager, null, null);
	}

	@Scheduled(fixedDelayString = "${job.static_generate_lazy_goods.delay}")
	public void generateLazyGoods() {
		staticService.generateGoods(null, null, Goods.GenerateMethod.lazy, null, null);
	}

	@Scheduled(cron = "${job.static_generate_all.cron}")
	public void generateAll() {
		staticService.generateAll();
	}

}