/*
 * Copyright 2005-2015 shopxx.net. All rights reserved.
 * Support: http://www.shopxx.net
 * License: http://www.shopxx.net/license
 */
package net.shopxx.service;

import net.shopxx.entity.Cart;
import net.shopxx.entity.Member;
import net.shopxx.entity.Product;

public interface CartService extends BaseService<Cart, Long> {

	Cart getCurrent();

	Cart add(Product product, int quantity);

	void merge(Member member, Cart cart);

	void evictExpired();

}