/*
 * Copyright 2005-2015 shopxx.net. All rights reserved.
 * Support: http://www.shopxx.net
 * License: http://www.shopxx.net/license
 */
package net.shopxx.dao.impl;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

import javax.persistence.NoResultException;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import javax.persistence.criteria.Subquery;

import net.shopxx.Filter;
import net.shopxx.Page;
import net.shopxx.Pageable;
import net.shopxx.dao.OrderDao;
import net.shopxx.entity.Goods;
import net.shopxx.entity.Member;
import net.shopxx.entity.Order;
import net.shopxx.entity.OrderItem;
import net.shopxx.entity.PaymentMethod;
import net.shopxx.entity.Product;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Repository;

@Repository("orderDaoImpl")
public class OrderDaoImpl extends BaseDaoImpl<Order, Long> implements OrderDao {

	public Order findBySn(String sn) {
		if (StringUtils.isEmpty(sn)) {
			return null;
		}
		String jpql = "select orders from Order orders where lower(orders.sn) = lower(:sn)";
		try {
			return entityManager.createQuery(jpql, Order.class).setParameter("sn", sn).getSingleResult();
		} catch (NoResultException e) {
			return null;
		}
	}

	public List<Order> findList(Order.Type type, Order.Status status, Member member, Goods goods, Boolean isPendingReceive, Boolean isPendingRefunds, Boolean isUseCouponCode, Boolean isExchangePoint, Boolean isAllocatedStock, Boolean hasExpired, Integer count, List<Filter> filters,
			List<net.shopxx.Order> orders) {
		CriteriaBuilder criteriaBuilder = entityManager.getCriteriaBuilder();
		CriteriaQuery<Order> criteriaQuery = criteriaBuilder.createQuery(Order.class);
		Root<Order> root = criteriaQuery.from(Order.class);
		criteriaQuery.select(root);
		Predicate restrictions = criteriaBuilder.conjunction();
		if (type != null) {
			restrictions = criteriaBuilder.and(restrictions, criteriaBuilder.equal(root.get("type"), type));
		}
		if (status != null) {
			restrictions = criteriaBuilder.and(restrictions, criteriaBuilder.equal(root.get("status"), status));
		}
		if (member != null) {
			restrictions = criteriaBuilder.and(restrictions, criteriaBuilder.equal(root.get("member"), member));
		}
		if (goods != null) {
			Subquery<Product> productSubquery = criteriaQuery.subquery(Product.class);
			Root<Product> productSubqueryRoot = productSubquery.from(Product.class);
			productSubquery.select(productSubqueryRoot);
			productSubquery.where(criteriaBuilder.equal(productSubqueryRoot.get("goods"), goods));

			Subquery<OrderItem> orderItemSubquery = criteriaQuery.subquery(OrderItem.class);
			Root<OrderItem> orderItemSubqueryRoot = orderItemSubquery.from(OrderItem.class);
			orderItemSubquery.select(orderItemSubqueryRoot);
			orderItemSubquery.where(criteriaBuilder.equal(orderItemSubqueryRoot.get("order"), root), criteriaBuilder.in(orderItemSubqueryRoot.get("product")).value(productSubquery));
			restrictions = criteriaBuilder.and(restrictions, criteriaBuilder.exists(orderItemSubquery));
		}
		if (isPendingReceive != null) {
			Predicate predicate = criteriaBuilder.and(criteriaBuilder.or(root.get("expire").isNull(), criteriaBuilder.greaterThan(root.<Date> get("expire"), new Date())), criteriaBuilder.equal(root.get("paymentMethodType"), PaymentMethod.Type.cashOnDelivery),
					criteriaBuilder.notEqual(root.get("status"), Order.Status.completed), criteriaBuilder.notEqual(root.get("status"), Order.Status.failed), criteriaBuilder.notEqual(root.get("status"), Order.Status.canceled), criteriaBuilder.notEqual(root.get("status"), Order.Status.denied),
					criteriaBuilder.lessThan(root.<BigDecimal> get("amountPaid"), root.<BigDecimal> get("amount")));
			if (isPendingReceive) {
				restrictions = criteriaBuilder.and(restrictions, predicate);
			} else {
				restrictions = criteriaBuilder.and(restrictions, criteriaBuilder.not(predicate));
			}
		}
		if (isPendingRefunds != null) {
			Predicate predicate = criteriaBuilder.or(
					criteriaBuilder.and(
							criteriaBuilder.or(criteriaBuilder.and(root.get("expire").isNotNull(), criteriaBuilder.lessThanOrEqualTo(root.<Date> get("expire"), new Date())), criteriaBuilder.equal(root.get("status"), Order.Status.failed),
									criteriaBuilder.equal(root.get("status"), Order.Status.canceled), criteriaBuilder.equal(root.get("status"), Order.Status.denied)), criteriaBuilder.greaterThan(root.<BigDecimal> get("amountPaid"), BigDecimal.ZERO)),
					criteriaBuilder.and(criteriaBuilder.equal(root.get("status"), Order.Status.completed), criteriaBuilder.greaterThan(root.<BigDecimal> get("amountPaid"), root.<BigDecimal> get("amount"))));
			if (isPendingRefunds) {
				restrictions = criteriaBuilder.and(restrictions, predicate);
			} else {
				restrictions = criteriaBuilder.and(restrictions, criteriaBuilder.not(predicate));
			}
		}
		if (isUseCouponCode != null) {
			restrictions = criteriaBuilder.and(restrictions, criteriaBuilder.equal(root.get("isUseCouponCode"), isUseCouponCode));
		}
		if (isExchangePoint != null) {
			restrictions = criteriaBuilder.and(restrictions, criteriaBuilder.equal(root.get("isExchangePoint"), isExchangePoint));
		}
		if (isAllocatedStock != null) {
			restrictions = criteriaBuilder.and(restrictions, criteriaBuilder.equal(root.get("isAllocatedStock"), isAllocatedStock));
		}
		if (hasExpired != null) {
			if (hasExpired) {
				restrictions = criteriaBuilder.and(restrictions, root.get("expire").isNotNull(), criteriaBuilder.lessThanOrEqualTo(root.<Date> get("expire"), new Date()));
			} else {
				restrictions = criteriaBuilder.and(restrictions, criteriaBuilder.or(root.get("expire").isNull(), criteriaBuilder.greaterThan(root.<Date> get("expire"), new Date())));
			}
		}
		criteriaQuery.where(restrictions);
		return super.findList(criteriaQuery, null, count, filters, orders);
	}

	public Page<Order> findPage(Order.Type type, Order.Status status, Member member, Goods goods, Boolean isPendingReceive, Boolean isPendingRefunds, Boolean isUseCouponCode, Boolean isExchangePoint, Boolean isAllocatedStock, Boolean hasExpired, Pageable pageable) {
		CriteriaBuilder criteriaBuilder = entityManager.getCriteriaBuilder();
		CriteriaQuery<Order> criteriaQuery = criteriaBuilder.createQuery(Order.class);
		Root<Order> root = criteriaQuery.from(Order.class);
		criteriaQuery.select(root);
		Predicate restrictions = criteriaBuilder.conjunction();
		if (type != null) {
			restrictions = criteriaBuilder.and(restrictions, criteriaBuilder.equal(root.get("type"), type));
		}
		if (status != null) {
			restrictions = criteriaBuilder.and(restrictions, criteriaBuilder.equal(root.get("status"), status));
		}
		if (member != null) {
			restrictions = criteriaBuilder.and(restrictions, criteriaBuilder.equal(root.get("member"), member));
		}
		if (goods != null) {
			Subquery<Product> productSubquery = criteriaQuery.subquery(Product.class);
			Root<Product> productSubqueryRoot = productSubquery.from(Product.class);
			productSubquery.select(productSubqueryRoot);
			productSubquery.where(criteriaBuilder.equal(productSubqueryRoot.get("goods"), goods));

			Subquery<OrderItem> orderItemSubquery = criteriaQuery.subquery(OrderItem.class);
			Root<OrderItem> orderItemSubqueryRoot = orderItemSubquery.from(OrderItem.class);
			orderItemSubquery.select(orderItemSubqueryRoot);
			orderItemSubquery.where(criteriaBuilder.equal(orderItemSubqueryRoot.get("order"), root), criteriaBuilder.in(orderItemSubqueryRoot.get("product")).value(productSubquery));
			restrictions = criteriaBuilder.and(restrictions, criteriaBuilder.exists(orderItemSubquery));
		}
		if (isPendingReceive != null) {
			Predicate predicate = criteriaBuilder.and(criteriaBuilder.or(root.get("expire").isNull(), criteriaBuilder.greaterThan(root.<Date> get("expire"), new Date())), criteriaBuilder.equal(root.get("paymentMethodType"), PaymentMethod.Type.cashOnDelivery),
					criteriaBuilder.notEqual(root.get("status"), Order.Status.completed), criteriaBuilder.notEqual(root.get("status"), Order.Status.failed), criteriaBuilder.notEqual(root.get("status"), Order.Status.canceled), criteriaBuilder.notEqual(root.get("status"), Order.Status.denied),
					criteriaBuilder.lessThan(root.<BigDecimal> get("amountPaid"), root.<BigDecimal> get("amount")));
			if (isPendingReceive) {
				restrictions = criteriaBuilder.and(restrictions, predicate);
			} else {
				restrictions = criteriaBuilder.and(restrictions, criteriaBuilder.not(predicate));
			}
		}
		if (isPendingRefunds != null) {
			Predicate predicate = criteriaBuilder.or(
					criteriaBuilder.and(
							criteriaBuilder.or(criteriaBuilder.and(root.get("expire").isNotNull(), criteriaBuilder.lessThanOrEqualTo(root.<Date> get("expire"), new Date())), criteriaBuilder.equal(root.get("status"), Order.Status.failed),
									criteriaBuilder.equal(root.get("status"), Order.Status.canceled), criteriaBuilder.equal(root.get("status"), Order.Status.denied)), criteriaBuilder.greaterThan(root.<BigDecimal> get("amountPaid"), BigDecimal.ZERO)),
					criteriaBuilder.and(criteriaBuilder.equal(root.get("status"), Order.Status.completed), criteriaBuilder.greaterThan(root.<BigDecimal> get("amountPaid"), root.<BigDecimal> get("amount"))));
			if (isPendingRefunds) {
				restrictions = criteriaBuilder.and(restrictions, predicate);
			} else {
				restrictions = criteriaBuilder.and(restrictions, criteriaBuilder.not(predicate));
			}
		}
		if (isUseCouponCode != null) {
			restrictions = criteriaBuilder.and(restrictions, criteriaBuilder.equal(root.get("isUseCouponCode"), isUseCouponCode));
		}
		if (isExchangePoint != null) {
			restrictions = criteriaBuilder.and(restrictions, criteriaBuilder.equal(root.get("isExchangePoint"), isExchangePoint));
		}
		if (isAllocatedStock != null) {
			restrictions = criteriaBuilder.and(restrictions, criteriaBuilder.equal(root.get("isAllocatedStock"), isAllocatedStock));
		}
		if (hasExpired != null) {
			if (hasExpired) {
				restrictions = criteriaBuilder.and(restrictions, root.get("expire").isNotNull(), criteriaBuilder.lessThanOrEqualTo(root.<Date> get("expire"), new Date()));
			} else {
				restrictions = criteriaBuilder.and(restrictions, criteriaBuilder.or(root.get("expire").isNull(), criteriaBuilder.greaterThan(root.<Date> get("expire"), new Date())));
			}
		}
		criteriaQuery.where(restrictions);
		return super.findPage(criteriaQuery, pageable);
	}

	public Long count(Order.Type type, Order.Status status, Member member, Goods goods, Boolean isPendingReceive, Boolean isPendingRefunds, Boolean isUseCouponCode, Boolean isExchangePoint, Boolean isAllocatedStock, Boolean hasExpired) {
		CriteriaBuilder criteriaBuilder = entityManager.getCriteriaBuilder();
		CriteriaQuery<Order> criteriaQuery = criteriaBuilder.createQuery(Order.class);
		Root<Order> root = criteriaQuery.from(Order.class);
		criteriaQuery.select(root);
		Predicate restrictions = criteriaBuilder.conjunction();
		if (type != null) {
			restrictions = criteriaBuilder.and(restrictions, criteriaBuilder.equal(root.get("type"), type));
		}
		if (status != null) {
			restrictions = criteriaBuilder.and(restrictions, criteriaBuilder.equal(root.get("status"), status));
		}
		if (member != null) {
			restrictions = criteriaBuilder.and(restrictions, criteriaBuilder.equal(root.get("member"), member));
		}
		if (goods != null) {
			Subquery<Product> productSubquery = criteriaQuery.subquery(Product.class);
			Root<Product> productSubqueryRoot = productSubquery.from(Product.class);
			productSubquery.select(productSubqueryRoot);
			productSubquery.where(criteriaBuilder.equal(productSubqueryRoot.get("goods"), goods));

			Subquery<OrderItem> orderItemSubquery = criteriaQuery.subquery(OrderItem.class);
			Root<OrderItem> orderItemSubqueryRoot = orderItemSubquery.from(OrderItem.class);
			orderItemSubquery.select(orderItemSubqueryRoot);
			orderItemSubquery.where(criteriaBuilder.equal(orderItemSubqueryRoot.get("order"), root), criteriaBuilder.in(orderItemSubqueryRoot.get("product")).value(productSubquery));
			restrictions = criteriaBuilder.and(restrictions, criteriaBuilder.exists(orderItemSubquery));
		}
		if (isPendingReceive != null) {
			Predicate predicate = criteriaBuilder.and(criteriaBuilder.or(root.get("expire").isNull(), criteriaBuilder.greaterThan(root.<Date> get("expire"), new Date())), criteriaBuilder.equal(root.get("paymentMethodType"), PaymentMethod.Type.cashOnDelivery),
					criteriaBuilder.notEqual(root.get("status"), Order.Status.completed), criteriaBuilder.notEqual(root.get("status"), Order.Status.failed), criteriaBuilder.notEqual(root.get("status"), Order.Status.canceled), criteriaBuilder.notEqual(root.get("status"), Order.Status.denied),
					criteriaBuilder.lessThan(root.<BigDecimal> get("amountPaid"), root.<BigDecimal> get("amount")));
			if (isPendingReceive) {
				restrictions = criteriaBuilder.and(restrictions, predicate);
			} else {
				restrictions = criteriaBuilder.and(restrictions, criteriaBuilder.not(predicate));
			}
		}
		if (isPendingRefunds != null) {
			Predicate predicate = criteriaBuilder.or(
					criteriaBuilder.and(
							criteriaBuilder.or(criteriaBuilder.and(root.get("expire").isNotNull(), criteriaBuilder.lessThanOrEqualTo(root.<Date> get("expire"), new Date())), criteriaBuilder.equal(root.get("status"), Order.Status.failed),
									criteriaBuilder.equal(root.get("status"), Order.Status.canceled), criteriaBuilder.equal(root.get("status"), Order.Status.denied)), criteriaBuilder.greaterThan(root.<BigDecimal> get("amountPaid"), BigDecimal.ZERO)),
					criteriaBuilder.and(criteriaBuilder.equal(root.get("status"), Order.Status.completed), criteriaBuilder.greaterThan(root.<BigDecimal> get("amountPaid"), root.<BigDecimal> get("amount"))));
			if (isPendingRefunds) {
				restrictions = criteriaBuilder.and(restrictions, predicate);
			} else {
				restrictions = criteriaBuilder.and(restrictions, criteriaBuilder.not(predicate));
			}
		}
		if (isUseCouponCode != null) {
			restrictions = criteriaBuilder.and(restrictions, criteriaBuilder.equal(root.get("isUseCouponCode"), isUseCouponCode));
		}
		if (isExchangePoint != null) {
			restrictions = criteriaBuilder.and(restrictions, criteriaBuilder.equal(root.get("isExchangePoint"), isExchangePoint));
		}
		if (isAllocatedStock != null) {
			restrictions = criteriaBuilder.and(restrictions, criteriaBuilder.equal(root.get("isAllocatedStock"), isAllocatedStock));
		}
		if (hasExpired != null) {
			if (hasExpired) {
				restrictions = criteriaBuilder.and(restrictions, root.get("expire").isNotNull(), criteriaBuilder.lessThanOrEqualTo(root.<Date> get("expire"), new Date()));
			} else {
				restrictions = criteriaBuilder.and(restrictions, criteriaBuilder.or(root.get("expire").isNull(), criteriaBuilder.greaterThan(root.<Date> get("expire"), new Date())));
			}
		}
		criteriaQuery.where(restrictions);
		return super.count(criteriaQuery, null);
	}

	public Long createOrderCount(Date beginDate, Date endDate) {
		CriteriaBuilder criteriaBuilder = entityManager.getCriteriaBuilder();
		CriteriaQuery<Order> criteriaQuery = criteriaBuilder.createQuery(Order.class);
		Root<Order> root = criteriaQuery.from(Order.class);
		criteriaQuery.select(root);
		Predicate restrictions = criteriaBuilder.conjunction();
		if (beginDate != null) {
			restrictions = criteriaBuilder.and(restrictions, criteriaBuilder.greaterThanOrEqualTo(root.<Date> get("createDate"), beginDate));
		}
		if (endDate != null) {
			restrictions = criteriaBuilder.and(restrictions, criteriaBuilder.lessThanOrEqualTo(root.<Date> get("createDate"), endDate));
		}
		criteriaQuery.where(restrictions);
		return super.count(criteriaQuery, null);
	}

	public Long completeOrderCount(Date beginDate, Date endDate) {
		CriteriaBuilder criteriaBuilder = entityManager.getCriteriaBuilder();
		CriteriaQuery<Order> criteriaQuery = criteriaBuilder.createQuery(Order.class);
		Root<Order> root = criteriaQuery.from(Order.class);
		criteriaQuery.select(root);
		Predicate restrictions = criteriaBuilder.conjunction();
		if (beginDate != null) {
			restrictions = criteriaBuilder.and(restrictions, criteriaBuilder.greaterThanOrEqualTo(root.<Date> get("completeDate"), beginDate));
		}
		if (endDate != null) {
			restrictions = criteriaBuilder.and(restrictions, criteriaBuilder.lessThanOrEqualTo(root.<Date> get("completeDate"), endDate));
		}
		criteriaQuery.where(restrictions);
		return super.count(criteriaQuery, null);
	}

	public BigDecimal createOrderAmount(Date beginDate, Date endDate) {
		CriteriaBuilder criteriaBuilder = entityManager.getCriteriaBuilder();
		CriteriaQuery<BigDecimal> criteriaQuery = criteriaBuilder.createQuery(BigDecimal.class);
		Root<Order> root = criteriaQuery.from(Order.class);
		criteriaQuery.select(criteriaBuilder.sum(root.<BigDecimal> get("amount")));
		Predicate restrictions = criteriaBuilder.conjunction();
		if (beginDate != null) {
			restrictions = criteriaBuilder.and(restrictions, criteriaBuilder.greaterThanOrEqualTo(root.<Date> get("createDate"), beginDate));
		}
		if (endDate != null) {
			restrictions = criteriaBuilder.and(restrictions, criteriaBuilder.lessThanOrEqualTo(root.<Date> get("createDate"), endDate));
		}
		criteriaQuery.where(restrictions);
		BigDecimal result = entityManager.createQuery(criteriaQuery).getSingleResult();
		return result != null ? result : BigDecimal.ZERO;
	}

	public BigDecimal completeOrderAmount(Date beginDate, Date endDate) {
		CriteriaBuilder criteriaBuilder = entityManager.getCriteriaBuilder();
		CriteriaQuery<BigDecimal> criteriaQuery = criteriaBuilder.createQuery(BigDecimal.class);
		Root<Order> root = criteriaQuery.from(Order.class);
		criteriaQuery.select(criteriaBuilder.sum(root.<BigDecimal> get("amount")));
		Predicate restrictions = criteriaBuilder.conjunction();
		if (beginDate != null) {
			restrictions = criteriaBuilder.and(restrictions, criteriaBuilder.greaterThanOrEqualTo(root.<Date> get("completeDate"), beginDate));
		}
		if (endDate != null) {
			restrictions = criteriaBuilder.and(restrictions, criteriaBuilder.lessThanOrEqualTo(root.<Date> get("completeDate"), endDate));
		}
		criteriaQuery.where(restrictions);
		BigDecimal result = entityManager.createQuery(criteriaQuery).getSingleResult();
		return result != null ? result : BigDecimal.ZERO;
	}

}