/*
 * Copyright 2005-2015 shopxx.net. All rights reserved.
 * Support: http://www.shopxx.net
 * License: http://www.shopxx.net/license
 */
package net.shopxx.service;

import net.shopxx.entity.PaymentLog;

public interface PaymentLogService extends BaseService<PaymentLog, Long> {

	PaymentLog findBySn(String sn);

	void handle(PaymentLog paymentLog);

}