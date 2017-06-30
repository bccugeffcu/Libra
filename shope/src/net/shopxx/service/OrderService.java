/*
 * Copyright 2005-2015 shopxx.net. All rights reserved.
 * Support: http://www.shopxx.net
 * License: http://www.shopxx.net/license
 */
package net.shopxx.service;

import java.math.BigDecimal;
import java.util.List;

import net.shopxx.Filter;
import net.shopxx.Page;
import net.shopxx.Pageable;
import net.shopxx.entity.Admin;
import net.shopxx.entity.Cart;
import net.shopxx.entity.CouponCode;
import net.shopxx.entity.Goods;
import net.shopxx.entity.Invoice;
import net.shopxx.entity.Member;
import net.shopxx.entity.Order;
import net.shopxx.entity.Payment;
import net.shopxx.entity.PaymentMethod;
import net.shopxx.entity.Receiver;
import net.shopxx.entity.Refunds;
import net.shopxx.entity.Returns;
import net.shopxx.entity.Shipping;
import net.shopxx.entity.ShippingMethod;

public interface OrderService extends BaseService<Order, Long> {

	Order findBySn(String sn);

	List<Order> findList(Order.Type type, Order.Status status, Member member, Goods goods, Boolean isPendingReceive, Boolean isPendingRefunds, Boolean isUseCouponCode, Boolean isExchangePoint, Boolean isAllocatedStock, Boolean hasExpired, Integer count, List<Filter> filters,
			List<net.shopxx.Order> orders);

	Page<Order> findPage(Order.Type type, Order.Status status, Member member, Goods goods, Boolean isPendingReceive, Boolean isPendingRefunds, Boolean isUseCouponCode, Boolean isExchangePoint, Boolean isAllocatedStock, Boolean hasExpired, Pageable pageable);

	Long count(Order.Type type, Order.Status status, Member member, Goods goods, Boolean isPendingReceive, Boolean isPendingRefunds, Boolean isUseCouponCode, Boolean isExchangePoint, Boolean isAllocatedStock, Boolean hasExpired);

	BigDecimal calculateTax(BigDecimal price, BigDecimal promotionDiscount, BigDecimal couponDiscount, BigDecimal offsetAmount);

	BigDecimal calculateTax(Order order);

	BigDecimal calculateAmount(BigDecimal price, BigDecimal fee, BigDecimal freight, BigDecimal tax, BigDecimal promotionDiscount, BigDecimal couponDiscount, BigDecimal offsetAmount);

	BigDecimal calculateAmount(Order order);

	boolean isLocked(Order order, Admin admin, boolean autoLock);

	boolean isLocked(Order order, Member member, boolean autoLock);

	void lock(Order order, Admin admin);

	void lock(Order order, Member member);

	void undoExpiredUseCouponCode();

	void undoExpiredExchangePoint();

	void releaseExpiredAllocatedStock();

	Order generate(Order.Type type, Cart cart, Receiver receiver, PaymentMethod paymentMethod, ShippingMethod shippingMethod, CouponCode couponCode, Invoice invoice, BigDecimal balance, String memo);

	Order create(Order.Type type, Cart cart, Receiver receiver, PaymentMethod paymentMethod, ShippingMethod shippingMethod, CouponCode couponCode, Invoice invoice, BigDecimal balance, String memo);

	void update(Order order, Admin operator);

	void cancel(Order order);

	void review(Order order, boolean passed, Admin operator);

	void payment(Order order, Payment payment, Admin operator);

	void refunds(Order order, Refunds refunds, Admin operator);

	void shipping(Order order, Shipping shipping, Admin operator);

	void returns(Order order, Returns returns, Admin operator);

	void receive(Order order, Admin operator);

	void complete(Order order, Admin operator);

	void fail(Order order, Admin operator);

}