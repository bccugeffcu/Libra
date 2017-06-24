/*
 * Copyright 2005-2015 shopxx.net. All rights reserved.
 * Support: http://www.shopxx.net
 * License: http://www.shopxx.net/license
 */
package net.shopxx.entity;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Lob;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.PreRemove;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;

@Entity
@Table(name = "xx_payment_method")
@SequenceGenerator(name = "sequenceGenerator", sequenceName = "seq_payment_method")
public class PaymentMethod extends OrderEntity<Long> {

	private static final long serialVersionUID = 3345212816061792294L;

	public enum Type {

		deliveryAgainstPayment,

		cashOnDelivery
	}

	public enum Method {

		online,

		offline
	}

	private String name;

	private PaymentMethod.Type type;

	private PaymentMethod.Method method;

	private Integer timeout;

	private String icon;

	private String description;

	private String content;

	private Set<ShippingMethod> shippingMethods = new HashSet<ShippingMethod>();

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
	@Column(nullable = false)
	public PaymentMethod.Type getType() {
		return type;
	}

	public void setType(PaymentMethod.Type type) {
		this.type = type;
	}

	@NotNull
	@Column(nullable = false)
	public PaymentMethod.Method getMethod() {
		return method;
	}

	public void setMethod(PaymentMethod.Method method) {
		this.method = method;
	}

	@Min(1)
	public Integer getTimeout() {
		return timeout;
	}

	public void setTimeout(Integer timeout) {
		this.timeout = timeout;
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

	@Lob
	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	@ManyToMany(mappedBy = "paymentMethods", fetch = FetchType.LAZY)
	public Set<ShippingMethod> getShippingMethods() {
		return shippingMethods;
	}

	public void setShippingMethods(Set<ShippingMethod> shippingMethods) {
		this.shippingMethods = shippingMethods;
	}

	@OneToMany(mappedBy = "paymentMethod", fetch = FetchType.LAZY)
	public Set<Order> getOrders() {
		return orders;
	}

	public void setOrders(Set<Order> orders) {
		this.orders = orders;
	}

	@PreRemove
	public void preRemove() {
		Set<ShippingMethod> shippingMethods = getShippingMethods();
		if (shippingMethods != null) {
			for (ShippingMethod shippingMethod : shippingMethods) {
				shippingMethod.getPaymentMethods().remove(this);
			}
		}
		Set<Order> orders = getOrders();
		if (orders != null) {
			for (Order order : orders) {
				order.setPaymentMethod(null);
			}
		}
	}

}
