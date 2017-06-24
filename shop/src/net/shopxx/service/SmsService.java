/*
 * Copyright 2005-2015 shopxx.net. All rights reserved.
 * Support: http://www.shopxx.net
 * License: http://www.shopxx.net/license
 */
package net.shopxx.service;

import java.util.Date;
import java.util.Map;

import net.shopxx.entity.Member;
import net.shopxx.entity.Order;

public interface SmsService {

	void send(String[] mobiles, String content, Date sendTime, boolean async);

	void send(String[] mobiles, String templatePath, Map<String, Object> model, Date sendTime, boolean async);

	void send(String mobile, String content);

	void send(String mobile, String templatePath, Map<String, Object> model);

	void sendRegisterMemberSms(Member member);

	void sendCreateOrderSms(Order order);

	void sendUpdateOrderSms(Order order);

	void sendCancelOrderSms(Order order);

	void sendReviewOrderSms(Order order);

	void sendPaymentOrderSms(Order order);

	void sendRefundsOrderSms(Order order);

	void sendShippingOrderSms(Order order);

	void sendReturnsOrderSms(Order order);

	void sendReceiveOrderSms(Order order);

	void sendCompleteOrderSms(Order order);

	void sendFailOrderSms(Order order);

	long getBalance();

}