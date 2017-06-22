/*
 * Copyright 2005-2015 shopxx.net. All rights reserved.
 * Support: http://www.shopxx.net
 * License: http://www.shopxx.net/license
 */
package net.shopxx.plugin;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import net.shopxx.Setting;
import net.shopxx.entity.PaymentLog;
import net.shopxx.entity.PluginConfig;
import net.shopxx.service.PaymentLogService;
import net.shopxx.service.PluginConfigService;
import net.shopxx.util.SystemUtils;

import org.apache.commons.beanutils.ConvertUtils;
import org.apache.commons.lang.ArrayUtils;
import org.apache.commons.lang.StringUtils;
import org.apache.commons.lang.builder.CompareToBuilder;
import org.apache.commons.lang.builder.EqualsBuilder;
import org.apache.commons.lang.builder.HashCodeBuilder;
import org.springframework.stereotype.Component;

public abstract class PaymentPlugin implements Comparable<PaymentPlugin> {

	public static final String PAYMENT_NAME_ATTRIBUTE_NAME = "paymentName";

	public static final String FEE_TYPE_ATTRIBUTE_NAME = "feeType";

	public static final String FEE_ATTRIBUTE_NAME = "fee";

	public static final String LOGO_ATTRIBUTE_NAME = "logo";

	public static final String DESCRIPTION_ATTRIBUTE_NAME = "description";

	public enum FeeType {

		scale,

		fixed
	}

	public enum RequestMethod {

		post,

		get
	}

	public enum NotifyMethod {

		general,

		sync,

		async
	}

	@Resource(name = "pluginConfigServiceImpl")
	private PluginConfigService pluginConfigService;
	@Resource(name = "paymentLogServiceImpl")
	private PaymentLogService paymentLogService;

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

	public String getPaymentName() {
		PluginConfig pluginConfig = getPluginConfig();
		return pluginConfig != null ? pluginConfig.getAttribute(PAYMENT_NAME_ATTRIBUTE_NAME) : null;
	}

	public PaymentPlugin.FeeType getFeeType() {
		PluginConfig pluginConfig = getPluginConfig();
		return pluginConfig != null ? PaymentPlugin.FeeType.valueOf(pluginConfig.getAttribute(FEE_TYPE_ATTRIBUTE_NAME)) : null;
	}

	public BigDecimal getFee() {
		PluginConfig pluginConfig = getPluginConfig();
		return pluginConfig != null ? new BigDecimal(pluginConfig.getAttribute(FEE_ATTRIBUTE_NAME)) : null;
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

	public abstract PaymentPlugin.RequestMethod getRequestMethod();

	public abstract String getRequestCharset();

	public abstract Map<String, Object> getParameterMap(String sn, String description, HttpServletRequest request);

	public abstract boolean verifyNotify(PaymentPlugin.NotifyMethod notifyMethod, HttpServletRequest request);

	public abstract String getSn(HttpServletRequest request);

	public abstract String getNotifyMessage(PaymentPlugin.NotifyMethod notifyMethod, HttpServletRequest request);

	public BigDecimal calculateFee(BigDecimal amount) {
		Setting setting = SystemUtils.getSetting();
		if (PaymentPlugin.FeeType.scale.equals(getFeeType())) {
			return setting.setScale(amount.multiply(getFee()));
		} else {
			return setting.setScale(getFee());
		}
	}

	public BigDecimal calculateAmount(BigDecimal amount) {
		return amount.add(calculateFee(amount)).setScale(2, RoundingMode.UP);
	}

	protected PaymentLog getPaymentLog(String sn) {
		return paymentLogService.findBySn(sn);
	}

	protected String getNotifyUrl(PaymentPlugin.NotifyMethod notifyMethod) {
		Setting setting = SystemUtils.getSetting();
		if (notifyMethod != null) {
			return setting.getSiteUrl() + "/payment/plugin_notify/" + getId() + "/" + notifyMethod + ".jhtml";
		} else {
			return setting.getSiteUrl() + "/payment/plugin_notify/" + getId() + "/" + PaymentPlugin.NotifyMethod.general + ".jhtml";
		}
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
		PaymentPlugin other = (PaymentPlugin) obj;
		return new EqualsBuilder().append(getId(), other.getId()).isEquals();
	}

	@Override
	public int hashCode() {
		return new HashCodeBuilder(17, 37).append(getId()).toHashCode();
	}

	public int compareTo(PaymentPlugin paymentPlugin) {
		if (paymentPlugin == null) {
			return 1;
		}
		return new CompareToBuilder().append(getOrder(), paymentPlugin.getOrder()).append(getId(), paymentPlugin.getId()).toComparison();
	}

}