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
import javax.persistence.OneToMany;
import javax.persistence.PreRemove;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;

@Entity
@Table(name = "xx_delivery_corp")
@SequenceGenerator(name = "sequenceGenerator", sequenceName = "seq_delivery_corp")
public class DeliveryCorp extends OrderEntity<Long> {

	private static final long serialVersionUID = 6228064873853908418L;

	private String name;

	private String url;

	private String code;

	private Set<ShippingMethod> shippingMethods = new HashSet<ShippingMethod>();

	@NotEmpty
	@Length(max = 200)
	@Column(nullable = false)
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Length(max = 200)
	@Pattern(regexp = "^(?i)(http:\\/\\/|https:\\/\\/|ftp:\\/\\/|mailto:|\\/|#).*$")
	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	@Length(max = 200)
	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	@OneToMany(mappedBy = "defaultDeliveryCorp", fetch = FetchType.LAZY)
	public Set<ShippingMethod> getShippingMethods() {
		return shippingMethods;
	}

	public void setShippingMethods(Set<ShippingMethod> shippingMethods) {
		this.shippingMethods = shippingMethods;
	}

	@PreRemove
	public void preRemove() {
		Set<ShippingMethod> shippingMethods = getShippingMethods();
		if (shippingMethods != null) {
			for (ShippingMethod shippingMethod : shippingMethods) {
				shippingMethod.setDefaultDeliveryCorp(null);
			}
		}
	}

}
