/*
 * Copyright 2005-2015 shopxx.net. All rights reserved.
 * Support: http://www.shopxx.net
 * License: http://www.shopxx.net/license
 */
package net.shopxx.service;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;
import java.util.Map;

import net.shopxx.Filter;
import net.shopxx.Order;
import net.shopxx.Page;
import net.shopxx.Pageable;
import net.shopxx.entity.Admin;
import net.shopxx.entity.Attribute;
import net.shopxx.entity.Brand;
import net.shopxx.entity.Goods;
import net.shopxx.entity.Member;
import net.shopxx.entity.Product;
import net.shopxx.entity.ProductCategory;
import net.shopxx.entity.Promotion;
import net.shopxx.entity.Tag;

public interface GoodsService extends BaseService<Goods, Long> {

	boolean snExists(String sn);

	Goods findBySn(String sn);

	List<Goods> findList(Goods.Type type, ProductCategory productCategory, Brand brand, Promotion promotion, Tag tag, Map<Attribute, String> attributeValueMap, BigDecimal startPrice, BigDecimal endPrice, Boolean isMarketable, Boolean isList, Boolean isTop, Boolean isOutOfStock,
			Boolean isStockAlert, Boolean hasPromotion, Goods.OrderType orderType, Integer count, List<Filter> filters, List<Order> orders);

	List<Goods> findList(Goods.Type type, Long productCategoryId, Long brandId, Long promotionId, Long tagId, Map<Long, String> attributeValueMap, BigDecimal startPrice, BigDecimal endPrice, Boolean isMarketable, Boolean isList, Boolean isTop, Boolean isOutOfStock, Boolean isStockAlert,
			Boolean hasPromotion, Goods.OrderType orderType, Integer count, List<Filter> filters, List<Order> orders, boolean useCache);

	List<Goods> findList(ProductCategory productCategory, Boolean isMarketable, Goods.GenerateMethod generateMethod, Date beginDate, Date endDate, Integer first, Integer count);

	Page<Goods> findPage(Goods.Type type, ProductCategory productCategory, Brand brand, Promotion promotion, Tag tag, Map<Attribute, String> attributeValueMap, BigDecimal startPrice, BigDecimal endPrice, Boolean isMarketable, Boolean isList, Boolean isTop, Boolean isOutOfStock,
			Boolean isStockAlert, Boolean hasPromotion, Goods.OrderType orderType, Pageable pageable);

	Page<Goods> findPage(Goods.RankingType rankingType, Pageable pageable);

	Page<Goods> findPage(Member member, Pageable pageable);

	Long count(Goods.Type type, Member favoriteMember, Boolean isMarketable, Boolean isList, Boolean isTop, Boolean isOutOfStock, Boolean isStockAlert);

	long viewHits(Long id);

	void addHits(Goods goods, long amount);

	void addSales(Goods goods, long amount);

	Goods save(Goods goods, Product product, Admin operator);

	Goods save(Goods goods, List<Product> products, Admin operator);

	Goods update(Goods goods, Product product, Admin operator);

	Goods update(Goods goods, List<Product> products, Admin operator);

}