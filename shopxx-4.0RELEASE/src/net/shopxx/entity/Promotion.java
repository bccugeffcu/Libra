/*
 * Copyright 2005-2015 shopxx.net. All rights reserved.
 * Support: http://www.shopxx.net
 * License: http://www.shopxx.net/license
 */
package net.shopxx.entity;

import groovy.lang.Binding;
import groovy.lang.GroovyShell;

import java.math.BigDecimal;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinTable;
import javax.persistence.Lob;
import javax.persistence.ManyToMany;
import javax.persistence.OrderBy;
import javax.persistence.PreRemove;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.constraints.Digits;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;

import org.apache.commons.lang.StringUtils;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;

@Entity
@Table(name = "xx_promotion")
@SequenceGenerator(name = "sequenceGenerator", sequenceName = "seq_promotion")
public class Promotion extends OrderEntity<Long> {

	private static final long serialVersionUID = 7279011825809204909L;

	private static final String PATH_PREFIX = "/promotion/content";

	private static final String PATH_SUFFIX = ".jhtml";

	private String name;

	private String title;

	private String image;

	private Date beginDate;

	private Date endDate;

	private BigDecimal minimumPrice;

	private BigDecimal maximumPrice;

	private Integer minimumQuantity;

	private Integer maximumQuantity;

	private String priceExpression;

	private String pointExpression;

	private Boolean isFreeShipping;

	private Boolean isCouponAllowed;

	private String introduction;

	private Set<MemberRank> memberRanks = new HashSet<MemberRank>();

	private Set<Coupon> coupons = new HashSet<Coupon>();

	private Set<Product> gifts = new HashSet<Product>();

	private Set<Goods> goods = new HashSet<Goods>();

	private Set<ProductCategory> productCategories = new HashSet<ProductCategory>();

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
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	@Length(max = 200)
	@Pattern(regexp = "^(?i)(http:\\/\\/|https:\\/\\/|\\/).*$")
	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
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

	public String getPointExpression() {
		return pointExpression;
	}

	public void setPointExpression(String pointExpression) {
		this.pointExpression = pointExpression;
	}

	@NotNull
	@Column(nullable = false)
	public Boolean getIsFreeShipping() {
		return isFreeShipping;
	}

	public void setIsFreeShipping(Boolean isFreeShipping) {
		this.isFreeShipping = isFreeShipping;
	}

	@NotNull
	@Column(nullable = false)
	public Boolean getIsCouponAllowed() {
		return isCouponAllowed;
	}

	public void setIsCouponAllowed(Boolean isCouponAllowed) {
		this.isCouponAllowed = isCouponAllowed;
	}

	@Lob
	public String getIntroduction() {
		return introduction;
	}

	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}

	@ManyToMany(fetch = FetchType.LAZY)
	@JoinTable(name = "xx_promotion_member_rank")
	public Set<MemberRank> getMemberRanks() {
		return memberRanks;
	}

	public void setMemberRanks(Set<MemberRank> memberRanks) {
		this.memberRanks = memberRanks;
	}

	@ManyToMany(fetch = FetchType.LAZY)
	@JoinTable(name = "xx_promotion_coupon")
	public Set<Coupon> getCoupons() {
		return coupons;
	}

	public void setCoupons(Set<Coupon> coupons) {
		this.coupons = coupons;
	}

	@ManyToMany(fetch = FetchType.LAZY)
	@JoinTable(name = "xx_promotion_gift")
	public Set<Product> getGifts() {
		return gifts;
	}

	public void setGifts(Set<Product> gifts) {
		this.gifts = gifts;
	}

	@ManyToMany(mappedBy = "promotions", fetch = FetchType.LAZY)
	public Set<Goods> getGoods() {
		return goods;
	}

	public void setGoods(Set<Goods> goods) {
		this.goods = goods;
	}

	@ManyToMany(mappedBy = "promotions", fetch = FetchType.LAZY)
	@OrderBy("order asc")
	public Set<ProductCategory> getProductCategories() {
		return productCategories;
	}

	public void setProductCategories(Set<ProductCategory> productCategories) {
		this.productCategories = productCategories;
	}

	@Transient
	public String getPath() {
		return getId() != null ? PATH_PREFIX + "/" + getId() + PATH_SUFFIX : null;
	}

	@Transient
	public boolean hasBegun() {
		return getBeginDate() == null || !getBeginDate().after(new Date());
	}

	@Transient
	public boolean hasEnded() {
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

	@Transient
	public Long calculatePoint(Long point, Integer quantity) {
		if (point == null || quantity == null || StringUtils.isEmpty(getPointExpression())) {
			return point;
		}
		Long result = 0L;
		try {
			Binding binding = new Binding();
			binding.setVariable("quantity", quantity);
			binding.setVariable("point", point);
			GroovyShell groovyShell = new GroovyShell(binding);
			result = Long.valueOf(groovyShell.evaluate(getPointExpression()).toString());
		} catch (Exception e) {
			return point;
		}
		if (result < point) {
			return point;
		}
		return result > 0L ? result : 0L;
	}

	@PreRemove
	public void preRemove() {
		Set<Goods> goodsList = getGoods();
		if (goodsList != null) {
			for (Goods goods : goodsList) {
				goods.getPromotions().remove(this);
			}
		}
		Set<ProductCategory> productCategories = getProductCategories();
		if (productCategories != null) {
			for (ProductCategory productCategory : productCategories) {
				productCategory.getPromotions().remove(this);
			}
		}
	}

}
