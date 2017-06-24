/*
 * Copyright 2005-2015 shopxx.net. All rights reserved.
 * Support: http://www.shopxx.net
 * License: http://www.shopxx.net/license
 */
package net.shopxx.entity;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.AttributeConverter;
import javax.persistence.Column;
import javax.persistence.Convert;
import javax.persistence.Converter;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;

import net.shopxx.BaseAttributeConverter;

@Entity
@Table(name = "xx_shipping_item")
@SequenceGenerator(name = "sequenceGenerator", sequenceName = "seq_shipping_item")
public class ShippingItem extends BaseEntity<Long> {

	private static final long serialVersionUID = 1696161820095974584L;

	private String sn;

	private String name;

	private Integer quantity;

	private Boolean isDelivery;

	private Product product;

	private Shipping shipping;

	private List<String> specifications = new ArrayList<String>();

	@Column(nullable = false, updatable = false)
	public String getSn() {
		return sn;
	}

	public void setSn(String sn) {
		this.sn = sn;
	}

	@Column(nullable = false, updatable = false)
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@NotNull
	@Min(1)
	@Column(nullable = false, updatable = false)
	public Integer getQuantity() {
		return quantity;
	}

	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}

	@Column(nullable = false, updatable = false)
	public Boolean getIsDelivery() {
		return isDelivery;
	}

	public void setIsDelivery(Boolean isDelivery) {
		this.isDelivery = isDelivery;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(nullable = false, updatable = false)
	public Shipping getShipping() {
		return shipping;
	}

	public void setShipping(Shipping shipping) {
		this.shipping = shipping;
	}

	@Column(updatable = false, length = 4000)
	@Convert(converter = SpecificationConverter.class)
	public List<String> getSpecifications() {
		return specifications;
	}

	public void setSpecifications(List<String> specifications) {
		this.specifications = specifications;
	}

	@Converter
	public static class SpecificationConverter extends BaseAttributeConverter<List<String>> implements AttributeConverter<Object, String> {
	}

}
