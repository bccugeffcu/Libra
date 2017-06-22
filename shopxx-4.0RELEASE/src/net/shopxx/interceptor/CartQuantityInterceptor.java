/*
 * Copyright 2005-2015 shopxx.net. All rights reserved.
 * Support: http://www.shopxx.net
 * License: http://www.shopxx.net/license
 */
package net.shopxx.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.shopxx.entity.Cart;
import net.shopxx.util.WebUtils;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class CartQuantityInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		WebUtils.removeCookie(request, response, Cart.QUANTITY_COOKIE_NAME);
		return super.preHandle(request, response, handler);
	}

}