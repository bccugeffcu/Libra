/*
 * Copyright 2005-2015 shopxx.net. All rights reserved.
 * Support: http://www.shopxx.net
 * License: http://www.shopxx.net/license
 */
package net.shopxx.entity;

import groovy.lang.Binding;
import groovy.lang.GroovyShell;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Lob;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.PreRemove;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.constraints.Digits;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;

import org.apache.commons.lang.StringUtils;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;

@Entity
@Table(name = "xx_coupon")
@SequenceGenerator(name = "sequenceGenerator", sequenceName = "seq_coupon")
public class Coupon extends BaseEntity<Long> {

	private static final long serialVersionUID = -7414017412455908985L;

	private String name;

	private String prefix;

	private Date beginDate;

	private Date endDate;

	private BigDecimal minimumPrice;

	private BigDecimal maximumPrice;

	private Integer minimumQuantity;

	private Integer maximumQuantity;

	private String priceExpression;

	private Boolean isEnabled;

	private Boolean isExchange;

	private Long point;

	private String introduction;

	private Set<CouponCode> couponCodes = new HashSet<CouponCode>();

	private Set<Promotion> promotions = new HashSet<Promotion>();

	private List<Order> orders = new ArrayList<Order>();

	@NotEmpty
	@Length(max = 200)
	@Column(nullable = false)
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@NotEmpty
	@Length(max = 200)
	@Column(nullable = false)
	public String getPrefix() {
		return prefix;
	}

	public void setPrefix(String prefix) {
		this.prefix = prefix;
	}

	public Date getBeginDate() {
		return beginDate;
	}

	public void setBeginDate(Date beginDate) {
		this.beginDate = beginDate;
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	@Min(0)
	@Digits(integer = 12, fraction = 3)
	@Column(precision = 21, scale = 6)
	public BigDecimal getMinimumPrice() {
		return minimumPrice;
	}

	public void setMinimumPrice(BigDecimal minimumPrice) {
		this.minimumPrice = minimumPrice;
	}

	@Min(0)
	@Digits(integer = 12, fraction = 3)
	@Column(precision = 21, scale = 6)
	public BigDecimal getMaximumPrice() {
		return maximumPrice;
	}

	public void setMaximumPrice(BigDecimal maximumPrice) {
		this.maximumPrice = maximumPrice;
	}

	@Min(0)
	public Integer getMinimumQuantity() {
		return minimumQuantity;
	}

	public void setMinimumQuantity(Integer minimumQuantity) {
		this.minimumQuantity = minimumQuantity;
	}

	@Min(0)
	public Integer getMaximumQuantity() {
		return maximumQuantity;
	}

	public void setMaximumQuantity(Integer maximumQuantity) {
		this.maximumQuantity = maximumQuantity;
	}

	public String getPriceExpression() {
		return priceExpression;
	}

	public void setPriceExpression(String priceExpression) {
		this.priceExpression = priceExpression;
	}

	@NotNull
	@Column(nullable = false)
	public Boolean getIsEnabled() {
		return isEnabled;
	}

	public void setIsEnabled(Boolean isEnabled) {
		this.isEnabled = isEnabled;
	}

	@NotNull
	@Column(nullable = false)
	public Boolean getIsExchange() {
		return isExchange;
	}

	public void setIsExchange(Boolean isExchange) {
		this.isExchange = isExchange;
	}

	@Min(0)
	public Long getPoint() {
		return point;
	}

	public void setPoint(Long point) {
		this.point = point;
	}

	@Lob
	public String getIntroduction() {
		return introduction;
	}

	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}

	@OneToMany(mappedBy = "coupon", fetch = FetchType.LAZY, cascade = CascadeType.REMOVE)
	public Set<CouponCode> getCouponCodes() {
		return couponCodes;
	}

	public void setCouponCodes(Set<CouponCode> couponCodes) {
		this.couponCodes = couponCodes;
	}

	@ManyToMany(mappedBy = "coupons", fetch = FetchType.LAZY)
	public Set<Promotion> getPromotions() {
		return promotions;
	}

	public void setPromotions(Set<Promotion> promotions) {
		this.promotions = promotions;
	}

	@ManyToMany(mappedBy = "coupons", fetch = FetchType.LAZY)
	public List<Order> getOrders() {
		return orders;
	}

	public void setOrders(List<Order> orders) {
		this.orders = orders;
	}

	@Transient
	public boolean hasBegun() {
		return getBeginDate() == null || !getBeginDate().after(new Date());
	}

	@Transient
	public boolean hasExpired() {
		return getEndDate() != null && !getEndDate().after(new Date());
	}

	@Transient
	public BigDecimal calculatePrice(BigDecimal price, Integer quantity) {
		if (price == null || quantity == null || StringUtils.isEmpty(getPriceExpression())) {
			return price;
		}
		BigDecimal result = BigDecimal.ZERO;
		try {
			Binding binding = new Binding();
			binding.setVariable("quantity", quantity);
			binding.setVariable("price", price);
			GroovyShell groovyShell = new GroovyShell(binding);
			result = new BigDecimal(groovyShell.evaluate(getPriceExpression()).toString());
		} catch (Exception e) {
			return price;
		}
		if (result.compareTo(price) > 0) {
			return price;
		}
		return result.compareTo(BigDecimal.ZERO) > 0 ? result : BigDecimal.ZERO;
	}

	@PreRemove
	public void preRemove() {
		Set<Promotion> promotions = getPromotions();
		if (promotions != null) {
			for (Promotion promotion : promotions) {
				promotion.getCoupons().remove(this);
			}
		}
		List<Order> orders = getOrders();
		if (orders != null) {
			for (Order order : orders) {
				order.getCoupons().remove(this);
			}
		}
	}

}
