/*
 * Copyright 2005-2015 shopxx.net. All rights reserved.
 * Support: http://www.shopxx.net
 * License: http://www.shopxx.net/license
 */
package net.shopxx.entity;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.AttributeConverter;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Convert;
import javax.persistence.Converter;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.PreRemove;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.Valid;
import javax.validation.constraints.Digits;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import javax.validation.groups.Default;

import net.shopxx.BaseAttributeConverter;
import net.shopxx.Setting;
import net.shopxx.util.SystemUtils;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang.BooleanUtils;

@Entity
@Table(name = "xx_product")
@SequenceGenerator(name = "sequenceGenerator", sequenceName = "seq_product")
public class Product extends BaseEntity<Long> {

	private static final long serialVersionUID = 405738368989028506L;

	public interface General extends Default {

	}

	public interface Exchange extends Default {

	}

	public interface Gift extends Default {

	}

	private String sn;

	private BigDecimal price;

	private BigDecimal cost;

	private BigDecimal marketPrice;

	private Long rewardPoint;

	private Long exchangePoint;

	private Integer stock;

	private Integer allocatedStock;

	private Boolean isDefault;

	private Goods goods;

	private List<SpecificationValue> specificationValues = new ArrayList<SpecificationValue>();

	private Set<CartItem> cartItems = new HashSet<CartItem>();

	private Set<OrderItem> orderItems = new HashSet<OrderItem>();

	private Set<ShippingItem> shippingItems = new HashSet<ShippingItem>();

	private Set<ProductNotify> productNotifies = new HashSet<ProductNotify>();

	private Set<StockLog> stockLogs = new HashSet<StockLog>();

	private Set<Promotion> giftPromotions = new HashSet<Promotion>();

	@Column(nullable = false, updatable = false, unique = true)
	public String getSn() {
		return sn;
	}

	public void setSn(String sn) {
		this.sn = sn;
	}

	@NotNull(groups = General.class)
	@Min(0)
	@Digits(integer = 12, fraction = 3)
	@Column(nullable = false, precision = 21, scale = 6)
	public BigDecimal getPrice() {
		return price;
	}

	public void setPrice(BigDecimal price) {
		this.price = price;
	}

	@Min(0)
	@Digits(integer = 12, fraction = 3)
	@Column(precision = 21, scale = 6)
	public BigDecimal getCost() {
		return cost;
	}

	public void setCost(BigDecimal cost) {
		this.cost = cost;
	}

	@Min(0)
	@Digits(integer = 12, fraction = 3)
	@Column(nullable = false, precision = 21, scale = 6)
	public BigDecimal getMarketPrice() {
		return marketPrice;
	}

	public void setMarketPrice(BigDecimal marketPrice) {
		this.marketPrice = marketPrice;
	}

	@Min(0)
	@Column(nullable = false)
	public Long getRewardPoint() {
		return rewardPoint;
	}

	public void setRewardPoint(Long rewardPoint) {
		this.rewardPoint = rewardPoint;
	}

	@NotNull(groups = Exchange.class)
	@Min(0)
	@Column(nullable = false)
	public Long getExchangePoint() {
		return exchangePoint;
	}

	public void setExchangePoint(Long exchangePoint) {
		this.exchangePoint = exchangePoint;
	}

	@NotNull(groups = Save.class)
	@Min(0)
	@Column(nullable = false)
	public Integer getStock() {
		return stock;
	}

	public void setStock(Integer stock) {
		this.stock = stock;
	}

	@Column(nullable = false)
	public Integer getAllocatedStock() {
		return allocatedStock;
	}

	public void setAllocatedStock(Integer allocatedStock) {
		this.allocatedStock = allocatedStock;
	}

	@NotNull
	@Column(nullable = false)
	public Boolean getIsDefault() {
		return isDefault;
	}

	public void setIsDefault(Boolean isDefault) {
		this.isDefault = isDefault;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(nullable = false, updatable = false)
	public Goods getGoods() {
		return goods;
	}

	public void setGoods(Goods goods) {
		this.goods = goods;
	}

	@Valid
	@Column(length = 4000)
	@Convert(converter = SpecificationValueConverter.class)
	public List<SpecificationValue> getSpecificationValues() {
		return specificationValues;
	}

	public void setSpecificationValues(List<SpecificationValue> specificationValues) {
		this.specificationValues = specificationValues;
	}

	@OneToMany(mappedBy = "product", fetch = FetchType.LAZY, cascade = CascadeType.REMOVE)
	public Set<CartItem> getCartItems() {
		return cartItems;
	}

	public void setCartItems(Set<CartItem> cartItems) {
		this.cartItems = cartItems;
	}

	@OneToMany(mappedBy = "product", fetch = FetchType.LAZY)
	public Set<OrderItem> getOrderItems() {
		return orderItems;
	}

	public void setOrderItems(Set<OrderItem> orderItems) {
		this.orderItems = orderItems;
	}

	@OneToMany(mappedBy = "product", fetch = FetchType.LAZY)
	public Set<ShippingItem> getShippingItems() {
		return shippingItems;
	}

	public void setShippingItems(Set<ShippingItem> shippingItems) {
		this.shippingItems = shippingItems;
	}

	@OneToMany(mappedBy = "product", fetch = FetchType.LAZY, cascade = CascadeType.REMOVE)
	public Set<ProductNotify> getProductNotifies() {
		return productNotifies;
	}

	public void setProductNotifies(Set<ProductNotify> productNotifies) {
		this.productNotifies = productNotifies;
	}

	@OneToMany(mappedBy = "product", fetch = FetchType.LAZY, cascade = CascadeType.REMOVE)
	public Set<StockLog> getStockLogs() {
		return stockLogs;
	}

	public void setStockLogs(Set<StockLog> stockLogs) {
		this.stockLogs = stockLogs;
	}

	@ManyToMany(mappedBy = "gifts", fetch = FetchType.LAZY)
	public Set<Promotion> getGiftPromotions() {
		return giftPromotions;
	}

	public void setGiftPromotions(Set<Promotion> giftPromotions) {
		this.giftPromotions = giftPromotions;
	}

	@Transient
	public String getName() {
		return getGoods() != null ? getGoods().getName() : null;
	}

	@Transient
	public Goods.Type getType() {
		return getGoods() != null ? getGoods().getType() : null;
	}

	@Transient
	public String getImage() {
		return getGoods() != null ? getGoods().getImage() : null;
	}

	@Transient
	public String getUnit() {
		return getGoods() != null ? getGoods().getUnit() : null;
	}

	@Transient
	public Integer getWeight() {
		return getGoods() != null ? getGoods().getWeight() : null;
	}

	@Transient
	public boolean getIsMarketable() {
		return getGoods() != null && BooleanUtils.isTrue(getGoods().getIsMarketable());
	}

	@Transient
	public boolean getIsList() {
		return getGoods() != null && BooleanUtils.isTrue(getGoods().getIsList());
	}

	@Transient
	public boolean getIsTop() {
		return getGoods() != null && BooleanUtils.isTrue(getGoods().getIsTop());
	}

	@Transient
	public boolean getIsDelivery() {
		return getGoods() != null && BooleanUtils.isTrue(getGoods().getIsDelivery());
	}

	@Transient
	public String getPath() {
		return getGoods() != null ? getGoods().getPath() : null;
	}

	@Transient
	public String getUrl() {
		return getGoods() != null ? getGoods().getUrl() : null;
	}

	@Transient
	public String getThumbnail() {
		return getGoods() != null ? getGoods().getThumbnail() : null;
	}

	@Transient
	public int getAvailableStock() {
		int availableStock = getStock() - getAllocatedStock();
		return availableStock >= 0 ? availableStock : 0;
	}

	@Transient
	public boolean getIsStockAlert() {
		Setting setting = SystemUtils.getSetting();
		return setting.getStockAlertCount() != null && getAvailableStock() <= setting.getStockAlertCount();
	}

	@Transient
	public boolean getIsOutOfStock() {
		return getAvailableStock() <= 0;
	}

	@Transient
	public List<Integer> getSpecificationValueIds() {
		List<Integer> specificationValueIds = new ArrayList<Integer>();
		if (CollectionUtils.isNotEmpty(getSpecificationValues())) {
			for (SpecificationValue specificationValue : getSpecificationValues()) {
				specificationValueIds.add(specificationValue.getId());
			}
		}
		return specificationValueIds;
	}

	@Transient
	public List<String> getSpecifications() {
		List<String> specifications = new ArrayList<String>();
		if (CollectionUtils.isNotEmpty(getSpecificationValues())) {
			for (SpecificationValue specificationValue : getSpecificationValues()) {
				specifications.add(specificationValue.getValue());
			}
		}
		return specifications;
	}

	@Transient
	public Set<Promotion> getValidPromotions() {
		return getGoods() != null ? getGoods().getValidPromotions() : Collections.<Promotion> emptySet();
	}

	@Transient
	public boolean hasSpecification() {
		return CollectionUtils.isNotEmpty(getSpecificationValues());
	}

	@Transient
	public boolean isValid(Promotion promotion) {
		return getGoods() != null ? getGoods().isValid(promotion) : false;
	}

	@PreRemove
	public void preRemove() {
		Set<OrderItem> orderItems = getOrderItems();
		if (orderItems != null) {
			for (OrderItem orderItem : orderItems) {
				orderItem.setProduct(null);
			}
		}
		Set<ShippingItem> shippingItems = getShippingItems();
		if (shippingItems != null) {
			for (ShippingItem shippingItem : getShippingItems()) {
				shippingItem.setProduct(null);
			}
		}
		Set<Promotion> giftPromotions = getGiftPromotions();
		if (giftPromotions != null) {
			for (Promotion giftPromotion : giftPromotions) {
				giftPromotion.getGifts().remove(this);
			}
		}
	}

	@Converter
	public static class SpecificationValueConverter extends BaseAttributeConverter<List<SpecificationValue>> implements AttributeConverter<Object, String> {
	}

}
