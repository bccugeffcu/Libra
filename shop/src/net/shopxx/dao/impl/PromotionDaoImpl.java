/*
 * Copyright 2005-2015 shopxx.net. All rights reserved.
 * Support: http://www.shopxx.net
 * License: http://www.shopxx.net/license
 */
package net.shopxx.dao.impl;

import java.util.Date;
import java.util.List;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import net.shopxx.Filter;
import net.shopxx.Order;
import net.shopxx.dao.PromotionDao;
import net.shopxx.entity.MemberRank;
import net.shopxx.entity.ProductCategory;
import net.shopxx.entity.Promotion;

import org.springframework.stereotype.Repository;

@Repository("promotionDaoImpl")
public class PromotionDaoImpl extends BaseDaoImpl<Promotion, Long> implements PromotionDao {

	public List<Promotion> findList(MemberRank memberRank, ProductCategory productCategory, Boolean hasBegun, Boolean hasEnded, Integer count, List<Filter> filters, List<Order> orders) {
		CriteriaBuilder criteriaBuilder = entityManager.getCriteriaBuilder();
		CriteriaQuery<Promotion> criteriaQuery = criteriaBuilder.createQuery(Promotion.class);
		Root<Promotion> root = criteriaQuery.from(Promotion.class);
		criteriaQuery.select(root);
		Predicate restrictions = criteriaBuilder.conjunction();
		if (memberRank != null) {
			restrictions = criteriaBuilder.and(restrictions, criteriaBuilder.equal(root.join("memberRanks"), memberRank));
		}
		if (productCategory != null) {
			restrictions = criteriaBuilder.and(restrictions, criteriaBuilder.equal(root.join("productCategories"), productCategory));
		}
		if (hasBegun != null) {
			if (hasBegun) {
				restrictions = criteriaBuilder.and(restrictions, criteriaBuilder.or(root.get("beginDate").isNull(), criteriaBuilder.lessThanOrEqualTo(root.<Date> get("beginDate"), new Date())));
			} else {
				restrictions = criteriaBuilder.and(restrictions, root.get("beginDate").isNotNull(), criteriaBuilder.greaterThan(root.<Date> get("beginDate"), new Date()));
			}
		}
		if (hasEnded != null) {
			if (hasEnded) {
				restrictions = criteriaBuilder.and(restrictions, root.get("endDate").isNotNull(), criteriaBuilder.lessThanOrEqualTo(root.<Date> get("endDate"), new Date()));
			} else {
				restrictions = criteriaBuilder.and(restrictions, criteriaBuilder.or(root.get("endDate").isNull(), criteriaBuilder.greaterThan(root.<Date> get("endDate"), new Date())));
			}
		}
		criteriaQuery.where(restrictions);
		return super.findList(criteriaQuery, null, count, filters, orders);
	}

}