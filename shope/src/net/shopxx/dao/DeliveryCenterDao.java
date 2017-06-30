/*
 * Copyright 2005-2015 shopxx.net. All rights reserved.
 * Support: http://www.shopxx.net
 * License: http://www.shopxx.net/license
 */
package net.shopxx.dao;

import net.shopxx.entity.DeliveryCenter;

public interface DeliveryCenterDao extends BaseDao<DeliveryCenter, Long> {

	DeliveryCenter findDefault();

	void setDefault(DeliveryCenter deliveryCenter);

}