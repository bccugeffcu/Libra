/*
 * Copyright 2005-2015 shopxx.net. All rights reserved.
 * Support: http://www.shopxx.net
 * License: http://www.shopxx.net/license
 */
package net.shopxx.entity;

import java.math.BigDecimal;
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
import javax.persistence.Transient;

import net.shopxx.BaseAttributeConverter;

@Entity
@Table(name = "xx_order_item")
@SequenceGenerator(name = "sequenceGenerator", sequenceName = "seq_order_item")
public class OrderItem extends BaseEntity<Long> {

	private static final long serialVersionUID = -3754220301959312551L;

	private String sn;

	private String name;

	private Goods.Type type;

	private BigDecimal price;

	private Integer weight;

	private Boolean isDelivery;

	private String thumbnail;

	private Integer quantity;

	private Integer shippedQuantity;

	private Integer returnedQuantity;

	private Product product;

	private Order order;

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

	@Column(nullable = false, updatable = false)
	public Goods.Type getType() {
		return type;
	}

	public void setType(Goods.Type type) {
		this.type = type;
	}

	@Column(nullable = false, updatable = false, precision = 21, scale = 6)
	public BigDecimal getPrice() {
		return price;
	}

	public void setPrice(BigDecimal price) {
		this.price = price;
	}

	@Column(updatable = false)
	public Integer getWeight() {
		return weight;
	}

	public void setWeight(Integer weight) {
		this.weight = weight;
	}

	@Column(nullable = false, updatable = false)
	public Boolean getIsDelivery() {
		return isDelivery;
	}

	public void setIsDelivery(Boolean isDelivery) {
		this.isDelivery = isDelivery;
	}

	@Column(updatable = false)
	public String getThumbnail() {
		return thumbnail;
	}

	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}

	@Column(nullable = false, updatable = false)
	public Integer getQuantity() {
		return quantity;
	}

	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}

	@Column(nullable = false)
	public Integer getShippedQuantity() {
		return shippedQuantity;
	}

	public void setShippedQuantity(Integer shippedQuantity) {
		this.shippedQuantity = shippedQuantity;
	}

	@Column(nullable = false)
	public Integer getReturnedQuantity() {
		return returnedQuantity;
	}

	public void setReturnedQuantity(Integer returnedQuantity) {
		this.returnedQuantity = returnedQuantity;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "orders", nullable = false, updatable = false)
	public Order getOrder() {
		return order;
	}

	public void setOrder(Order order) {
		this.order = order;
	}

	@Column(updatable = false, length = 4000)
	@Convert(converter = SpecificationConverter.class)
	public List<String> getSpecifications() {
		return specifications;
	}

	public void setSpecifications(List<String> specifications) {
		this.specifications = specifications;
	}

	@Transient
	public int getTotalWeight() {
		if (getWeight() != null && getQuantity() != null) {
			return getWeight() * getQuantity();
		} else {
			return 0;
		}
	}

	@Transient
	public BigDecimal getSubtotal() {
		if (getPrice() != null && getQuantity() != null) {
			return getPrice().multiply(new BigDecimal(getQuantity()));
		} else {
			return BigDecimal.ZERO;
		}
	}

	@Transient
	public int getShippableQuantity() {
		int shippableQuantity = getQuantity() - getShippedQuantity();
		return shippableQuantity >= 0 ? shippableQuantity : 0;
	}

	@Transient
	public int getReturnableQuantity() {
		int returnableQuantity = getShippedQuantity() - getReturnedQuantity();
		return returnableQuantity >= 0 ? returnableQuantity : 0;
	}

	@Converter
	public static class SpecificationConverter extends BaseAttributeConverter<List<String>> implements AttributeConverter<Object, String> {
	}

}
