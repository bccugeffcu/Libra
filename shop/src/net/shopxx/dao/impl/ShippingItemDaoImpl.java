/*
 * Copyright 2005-2015 shopxx.net. All rights reserved.
 * Support: http://www.shopxx.net
 * License: http://www.shopxx.net/license
 */
package net.shopxx.dao.impl;

import net.shopxx.dao.ShippingItemDao;
import net.shopxx.entity.ShippingItem;

import org.springframework.stereotype.Repository;

@Repository("shippingItemDaoImpl")
public class ShippingItemDaoImpl extends BaseDaoImpl<ShippingItem, Long> implements ShippingItemDao {

}