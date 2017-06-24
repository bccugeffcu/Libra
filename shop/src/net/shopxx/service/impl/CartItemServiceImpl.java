/*
 * Copyright 2005-2015 shopxx.net. All rights reserved.
 * Support: http://www.shopxx.net
 * License: http://www.shopxx.net/license
 */
package net.shopxx.service.impl;

import net.shopxx.entity.CartItem;
import net.shopxx.service.CartItemService;

import org.springframework.stereotype.Service;

@Service("cartItemServiceImpl")
public class CartItemServiceImpl extends BaseServiceImpl<CartItem, Long> implements CartItemService {

}