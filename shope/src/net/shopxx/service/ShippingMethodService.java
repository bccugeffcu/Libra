/*
 * Copyright 2005-2015 shopxx.net. All rights reserved.
 * Support: http://www.shopxx.net
 * License: http://www.shopxx.net/license
 */
package net.shopxx.service;

import java.math.BigDecimal;

import net.shopxx.entity.Area;
import net.shopxx.entity.Receiver;
import net.shopxx.entity.ShippingMethod;

public interface ShippingMethodService extends BaseService<ShippingMethod, Long> {

	BigDecimal calculateFreight(ShippingMethod shippingMethod, Area area, Integer weight);

	BigDecimal calculateFreight(ShippingMethod shippingMethod, Receiver receiver, Integer weight);

}