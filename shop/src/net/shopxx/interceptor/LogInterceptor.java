/*
 * Copyright 2005-2015 shopxx.net. All rights reserved.
 * Support: http://www.shopxx.net
 * License: http://www.shopxx.net/license
 */
package net.shopxx.interceptor;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.shopxx.LogConfig;
import net.shopxx.entity.Log;
import net.shopxx.service.AdminService;
import net.shopxx.service.LogService;
import net.shopxx.util.SystemUtils;

import org.apache.commons.lang.ArrayUtils;
import org.springframework.util.AntPathMatcher;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LogInterceptor extends HandlerInterceptorAdapter {

	private static final String[] DEFAULT_IGNORE_PARAMETERS = new String[] { "password", "rePassword", "currentPassword" };

	private static AntPathMatcher antPathMatcher = new AntPathMatcher();

	private String[] ignoreParameters = DEFAULT_IGNORE_PARAMETERS;

	@Resource(name = "logServiceImpl")
	private LogService logService;
	@Resource(name = "adminServiceImpl")
	private AdminService adminService;

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
		List<LogConfig> logConfigs = SystemUtils.getLogConfigs();
		if (logConfigs != null) {
			String path = request.getServletPath();
			for (LogConfig logConfig : logConfigs) {
				if (antPathMatcher.match(logConfig.getUrlPattern(), path)) {
					String username = adminService.getCurrentUsername();
					String operation = logConfig.getOperation();
					String operator = username;
					String content = (String) request.getAttribute(Log.LOG_CONTENT_ATTRIBUTE_NAME);
					String ip = request.getRemoteAddr();
					request.removeAttribute(Log.LOG_CONTENT_ATTRIBUTE_NAME);
					StringBuilder parameter = new StringBuilder();
					Map<String, String[]> parameterMap = request.getParameterMap();
					if (parameterMap != null) {
						for (Map.Entry<String, String[]> entry : parameterMap.entrySet()) {
							String parameterName = entry.getKey();
							if (!ArrayUtils.contains(ignoreParameters, parameterName)) {
								String[] parameterValues = entry.getValue();
								if (parameterValues != null) {
									for (String parameterValue : parameterValues) {
										parameter.append(parameterName + " = " + parameterValue + "\n");
									}
								}
							}
						}
					}
					Log log = new Log();
					log.setOperation(operation);
					log.setOperator(operator);
					log.setContent(content);
					log.setParameter(parameter.toString());
					log.setIp(ip);
					logService.save(log);
					break;
				}
			}
		}
	}

	public String[] getIgnoreParameters() {
		return ignoreParameters;
	}

	public void setIgnoreParameters(String[] ignoreParameters) {
		this.ignoreParameters = ignoreParameters;
	}

}