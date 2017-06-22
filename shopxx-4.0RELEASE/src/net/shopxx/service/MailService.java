/*
 * Copyright 2005-2015 shopxx.net. All rights reserved.
 * Support: http://www.shopxx.net
 * License: http://www.shopxx.net/license
 */
package net.shopxx.service;

import java.util.Map;

import net.shopxx.entity.Member;
import net.shopxx.entity.Order;
import net.shopxx.entity.ProductNotify;
import net.shopxx.entity.SafeKey;

public interface MailService {

	void send(String smtpHost, int smtpPort, String smtpUsername, String smtpPassword, boolean smtpSSLEnabled, String smtpFromMail, String[] toMails, String subject, String content, boolean async);

	void send(String smtpHost, int smtpPort, String smtpUsername, String smtpPassword, boolean smtpSSLEnabled, String smtpFromMail, String[] toMails, String subject, String templatePath, Map<String, Object> model, boolean async);

	void send(String[] toMails, String subject, String content, boolean async);

	void send(String[] toMails, String subject, String templatePath, Map<String, Object> model, boolean async);

	void send(String toMail, String subject, String content);

	void send(String toMail, String subject, String templatePath, Map<String, Object> model);

	void sendTestSmtpMail(String smtpHost, int smtpPort, String smtpUsername, String smtpPassword, boolean smtpSSLEnabled, String smtpFromMail, String toMail);

	void sendFindPasswordMail(String toMail, String username, SafeKey safeKey);

	void sendProductNotifyMail(ProductNotify productNotify);

	void sendRegisterMemberMail(Member member);

	void sendCreateOrderMail(Order order);

	void sendUpdateOrderMail(Order order);

	void sendCancelOrderMail(Order order);

	void sendReviewOrderMail(Order order);

	void sendPaymentOrderMail(Order order);

	void sendRefundsOrderMail(Order order);

	void sendShippingOrderMail(Order order);

	void sendReturnsOrderMail(Order order);

	void sendReceiveOrderMail(Order order);

	void sendCompleteOrderMail(Order order);

	void sendFailOrderMail(Order order);

}