/*
 * Copyright 2005-2015 shopxx.net. All rights reserved.
 * Support: http://www.shopxx.net
 * License: http://www.shopxx.net/license
 */
package net.shopxx.plugin;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import net.shopxx.Setting;
import net.shopxx.entity.PluginConfig;
import net.shopxx.service.PluginConfigService;
import net.shopxx.util.SystemUtils;

import org.apache.commons.beanutils.ConvertUtils;
import org.apache.commons.lang.ArrayUtils;
import org.apache.commons.lang.StringUtils;
import org.apache.commons.lang.builder.CompareToBuilder;
import org.apache.commons.lang.builder.EqualsBuilder;
import org.apache.commons.lang.builder.HashCodeBuilder;
import org.springframework.stereotype.Component;

public abstract class LoginPlugin implements Comparable<LoginPlugin> {

	public static final String LOGIN_METHOD_NAME_ATTRIBUTE_NAME = "loginMethodName";

	public static final String LOGO_ATTRIBUTE_NAME = "logo";

	public static final String DESCRIPTION_ATTRIBUTE_NAME = "description";

	public enum RequestMethod {

		post,

		get
	}

	@Resource(name = "pluginConfigServiceImpl")
	private PluginConfigService pluginConfigService;

	public String getId() {
		return getClass().getAnnotation(Component.class).value();
	}

	public abstract String getName();

	public abstract String getVersion();

	public abstract String getAuthor();

	public abstract String getSiteUrl();

	public abstract String getInstallUrl();

	public abstract String getUninstallUrl();

	public abstract String getSettingUrl();

	public boolean getIsInstalled() {
		return pluginConfigService.pluginIdExists(getId());
	}

	public PluginConfig getPluginConfig() {
		return pluginConfigService.findByPluginId(getId());
	}

	public boolean getIsEnabled() {
		PluginConfig pluginConfig = getPluginConfig();
		return pluginConfig != null ? pluginConfig.getIsEnabled() : false;
	}

	public String getAttribute(String name) {
		PluginConfig pluginConfig = getPluginConfig();
		return pluginConfig != null ? pluginConfig.getAttribute(name) : null;
	}

	public Integer getOrder() {
		PluginConfig pluginConfig = getPluginConfig();
		return pluginConfig != null ? pluginConfig.getOrder() : null;
	}

	public String getLoginMethodName() {
		PluginConfig pluginConfig = getPluginConfig();
		return pluginConfig != null ? pluginConfig.getAttribute(LOGIN_METHOD_NAME_ATTRIBUTE_NAME) : null;
	}

	public String getLogo() {
		PluginConfig pluginConfig = getPluginConfig();
		return pluginConfig != null ? pluginConfig.getAttribute(LOGO_ATTRIBUTE_NAME) : null;
	}

	public String getDescription() {
		PluginConfig pluginConfig = getPluginConfig();
		return pluginConfig != null ? pluginConfig.getAttribute(DESCRIPTION_ATTRIBUTE_NAME) : null;
	}

	public abstract String getRequestUrl();

	public abstract LoginPlugin.RequestMethod getRequestMethod();

	public abstract String getRequestCharset();

	public abstract Map<String, Object> getParameterMap(HttpServletRequest request);

	public abstract boolean verifyNotify(HttpServletRequest request);

	public abstract String getOpenId(HttpServletRequest request);

	public abstract String getEmail(HttpServletRequest request);

	public abstract String getNickname(HttpServletRequest request);

	protected String getNotifyUrl() {
		Setting setting = SystemUtils.getSetting();
		return setting.getSiteUrl() + "/login/plugin_notify/" + getId() + ".jhtml";
	}

	protected String joinKeyValue(Map<String, Object> map, String prefix, String suffix, String separator, boolean ignoreEmptyValue, String... ignoreKeys) {
		List<String> list = new ArrayList<String>();
		if (map != null) {
			for (Map.Entry<String, Object> entry : map.entrySet()) {
				String key = entry.getKey();
				String value = ConvertUtils.convert(entry.getValue());
				if (StringUtils.isNotEmpty(key) && !ArrayUtils.contains(ignoreKeys, key) && (!ignoreEmptyValue || StringUtils.isNotEmpty(value))) {
					list.add(key + "=" + (value != null ? value : ""));
				}
			}
		}
		return (prefix != null ? prefix : "") + StringUtils.join(list, separator) + (suffix != null ? suffix : "");
	}

	protected String joinValue(Map<String, Object> map, String prefix, String suffix, String separator, boolean ignoreEmptyValue, String... ignoreKeys) {
		List<String> list = new ArrayList<String>();
		if (map != null) {
			for (Map.Entry<String, Object> entry : map.entrySet()) {
				String key = entry.getKey();
				String value = ConvertUtils.convert(entry.getValue());
				if (StringUtils.isNotEmpty(key) && !ArrayUtils.contains(ignoreKeys, key) && (!ignoreEmptyValue || StringUtils.isNotEmpty(value))) {
					list.add(value != null ? value : "");
				}
			}
		}
		return (prefix != null ? prefix : "") + StringUtils.join(list, separator) + (suffix != null ? suffix : "");
	}

	@Override
	public boolean equals(Object obj) {
		if (obj == null) {
			return false;
		}
		if (getClass() != obj.getClass()) {
			return false;
		}
		if (this == obj) {
			return true;
		}
		LoginPlugin other = (LoginPlugin) obj;
		return new EqualsBuilder().append(getId(), other.getId()).isEquals();
	}

	@Override
	public int hashCode() {
		return new HashCodeBuilder(17, 37).append(getId()).toHashCode();
	}

	public int compareTo(LoginPlugin loginPlugin) {
		if (loginPlugin == null) {
			return 1;
		}
		return new CompareToBuilder().append(getOrder(), loginPlugin.getOrder()).append(getId(), loginPlugin.getId()).toComparison();
	}

}