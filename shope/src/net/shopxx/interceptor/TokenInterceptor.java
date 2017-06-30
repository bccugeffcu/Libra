/*
 * Copyright 2005-2015 shopxx.net. All rights reserved.
 * Support: http://www.shopxx.net
 * License: http://www.shopxx.net/license
 */
package net.shopxx.interceptor;

import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.shopxx.util.WebUtils;

import org.apache.commons.codec.digest.DigestUtils;
import org.apache.commons.lang.RandomStringUtils;
import org.apache.commons.lang.StringUtils;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class TokenInterceptor extends HandlerInterceptorAdapter {

	private static final String TOKEN_ATTRIBUTE_NAME = "token";

	private static final String TOKEN_COOKIE_NAME = "token";

	private static final String TOKEN_PARAMETER_NAME = "token";

	private static final String ERROR_MESSAGE = "Bad or missing token!";

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		String token = WebUtils.getCookie(request, TOKEN_COOKIE_NAME);
		if (StringUtils.equalsIgnoreCase(request.getMethod(), "POST")) {
			if (StringUtils.isNotEmpty(token)) {
				String requestType = request.getHeader("X-Requested-With");
				if (StringUtils.equalsIgnoreCase(requestType, "XMLHttpRequest")) {
					if (StringUtils.equals(token, request.getHeader(TOKEN_PARAMETER_NAME))) {
						return true;
					} else {
						response.addHeader("tokenStatus", "accessDenied");
					}
				} else {
					if (StringUtils.equals(token, request.getParameter(TOKEN_PARAMETER_NAME))) {
						return true;
					}
				}
			} else {
				WebUtils.addCookie(request, response, TOKEN_COOKIE_NAME, DigestUtils.md5Hex(UUID.randomUUID() + RandomStringUtils.randomAlphabetic(30)));
			}
			response.sendError(HttpServletResponse.SC_FORBIDDEN, ERROR_MESSAGE);
			return false;
		} else {
			if (StringUtils.isEmpty(token)) {
				token = DigestUtils.md5Hex(UUID.randomUUID() + RandomStringUtils.randomAlphabetic(30));
				WebUtils.addCookie(request, response, TOKEN_COOKIE_NAME, token);
			}
			request.setAttribute(TOKEN_ATTRIBUTE_NAME, token);
			return true;
		}
	}

}