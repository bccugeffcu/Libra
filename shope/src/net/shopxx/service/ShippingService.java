/*
 * Copyright 2005-2015 shopxx.net. All rights reserved.
 * Support: http://www.shopxx.net
 * License: http://www.shopxx.net/license
 */
package net.shopxx.service;

import java.util.List;
import java.util.Map;

import net.shopxx.entity.Shipping;

public interface ShippingService extends BaseService<Shipping, Long> {

	Shipping findBySn(String sn);

	List<Map<String, String>> getTransitSteps(Shipping shipping);

}