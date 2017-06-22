/*
 * Copyright 2005-2015 shopxx.net. All rights reserved.
 * Support: http://www.shopxx.net
 * License: http://www.shopxx.net/license
 */
package net.shopxx.entity;

import java.math.BigDecimal;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OrderBy;
import javax.persistence.PreRemove;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.constraints.Digits;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;

import org.apache.commons.collections.CollectionUtils;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;

@Entity
@Table(name = "xx_shipping_method")
@SequenceGenerator(name = "sequenceGenerator", sequenceName = "seq_shipping_method")
public class ShippingMethod extends OrderEntity<Long> {

	private static final long serialVersionUID = 4511071170385818796L;

	private String name;

	private Integer firstWeight;

	private Integer continueWeight;

	private BigDecimal defaultFirstPrice;

	private BigDecimal defaultContinuePrice;

	private String icon;

	private String description;

	private DeliveryCorp defaultDeliveryCorp;

	private Set<PaymentMethod> paymentMethods = new HashSet<PaymentMethod>();

	private Set<FreightConfig> freightConfigs = new HashSet<FreightConfig>();

	private Set<Order> orders = new HashSet<Order>();

	@NotEmpty
	@Length(max = 200)
	@Column(nullable = false)
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@NotNull
	@Min(0)
	@Column(nullable = false)
	public Integer getFirstWeight() {
		return firstWeight;
	}

	public void setFirstWeight(Integer firstWeight) {
		this.firstWeight = firstWeight;
	}

	@NotNull
	@Min(1)
	@Column(nullable = false)
	public Integer getContinueWeight() {
		return continueWeight;
	}

	public void setContinueWeight(Integer continueWeight) {
		this.continueWeight = continueWeight;
	}

	@NotNull
	@Min(0)
	@Digits(integer = 12, fraction = 3)
	@Column(nullable = false, precision = 21, scale = 6)
	public BigDecimal getDefaultFirstPrice() {
		return defaultFirstPrice;
	}

	public void setDefaultFirstPrice(BigDecimal defaultFirstPrice) {
		this.defaultFirstPrice = defaultFirstPrice;
	}

	@NotNull
	@Min(0)
	@Digits(integer = 12, fraction = 3)
	@Column(nullable = false, precision = 21, scale = 6)
	public BigDecimal getDefaultContinuePrice() {
		return defaultContinuePrice;
	}

	public void setDefaultContinuePrice(BigDecimal defaultContinuePrice) {
		this.defaultContinuePrice = defaultContinuePrice;
	}

	@Length(max = 200)
	@Pattern(regexp = "^(?i)(http:\\/\\/|https:\\/\\/|\\/).*$")
	public String getIcon() {
		return icon;
	}

	public void setIcon(String icon) {
		this.icon = icon;
	}

	@Length(max = 200)
	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	public DeliveryCorp getDefaultDeliveryCorp() {
		return defaultDeliveryCorp;
	}

	public void setDefaultDeliveryCorp(DeliveryCorp defaultDeliveryCorp) {
		this.defaultDeliveryCorp = defaultDeliveryCorp;
	}

	@ManyToMany(fetch = FetchType.LAZY)
	@JoinTable(name = "xx_shipping_payment_method")
	@OrderBy("order asc")
	public Set<PaymentMethod> getPaymentMethods() {
		return paymentMethods;
	}

	public void setPaymentMethods(Set<PaymentMethod> paymentMethods) {
		this.paymentMethods = paymentMethods;
	}

	@OneToMany(mappedBy = "shippingMethod", fetch = FetchType.LAZY, cascade = CascadeType.REMOVE)
	public Set<FreightConfig> getFreightConfigs() {
		return freightConfigs;
	}

	public void setFreightConfigs(Set<FreightConfig> freightConfigs) {
		this.freightConfigs = freightConfigs;
	}

	@OneToMany(mappedBy = "shippingMethod", fetch = FetchType.LAZY)
	public Set<Order> getOrders() {
		return orders;
	}

	public void setOrders(Set<Order> orders) {
		this.orders = orders;
	}

	public boolean isSupported(PaymentMethod paymentMethod) {
		return paymentMethod == null || (getPaymentMethods() != null && getPaymentMethods().contains(paymentMethod));
	}

	@Transient
	public FreightConfig getFreightConfig(Area area) {
		if (area == null || CollectionUtils.isEmpty(getFreightConfigs())) {
			return null;
		}

		for (FreightConfig freightConfig : getFreightConfigs()) {
			if (freightConfig.getArea() != null && freightConfig.getArea().equals(area)) {
				return freightConfig;
			}
		}
		return null;
	}

	@PreRemove
	public void preRemove() {
		Set<Order> orders = getOrders();
		if (orders != null) {
			for (Order order : orders) {
				order.setShippingMethod(null);
			}
		}
	}

}
