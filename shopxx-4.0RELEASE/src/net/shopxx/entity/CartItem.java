/*
 * Copyright 2005-2015 shopxx.net. All rights reserved.
 * Support: http://www.shopxx.net
 * License: http://www.shopxx.net/license
 */
package net.shopxx.entity;

import java.math.BigDecimal;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Transient;

import net.shopxx.Setting;
import net.shopxx.util.SystemUtils;

@Entity
@Table(name = "xx_cart_item")
@SequenceGenerator(name = "sequenceGenerator", sequenceName = "seq_cart_item")
public class CartItem extends BaseEntity<Long> {

	private static final long serialVersionUID = 2491771861042067709L;

	public static final Integer MAX_QUANTITY = 10000;

	private Integer quantity;

	private Product product;

	private Cart cart;

	@Column(nullable = false)
	public Integer getQuantity() {
		return quantity;
	}

	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(nullable = false, updatable = false)
	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(nullable = false, updatable = false)
	public Cart getCart() {
		return cart;
	}

	public void setCart(Cart cart) {
		this.cart = cart;
	}

	@Transient
	public int getWeight() {
		if (getProduct() != null && getProduct().getWeight() != null && getQuantity() != null) {
			return getProduct().getWeight() * getQuantity();
		} else {
			return 0;
		}
	}

	@Transient
	public long getRewardPoint() {
		if (getProduct() != null && getProduct().getRewardPoint() != null && getQuantity() != null) {
			return getProduct().getRewardPoint() * getQuantity();
		} else {
			return 0L;
		}
	}

	@Transient
	public long getExchangePoint() {
		if (getProduct() != null && getProduct().getExchangePoint() != null && getQuantity() != null) {
			return getProduct().getExchangePoint() * getQuantity();
		} else {
			return 0L;
		}
	}

	@Transient
	public BigDecimal getPrice() {
		if (getProduct() != null && getProduct().getPrice() != null) {
			Setting setting = SystemUtils.getSetting();
			if (getCart() != null && getCart().getMember() != null && getCart().getMember().getMemberRank() != null) {
				MemberRank memberRank = getCart().getMember().getMemberRank();
				if (memberRank.getScale() != null) {
					return setting.setScale(getProduct().getPrice().multiply(new BigDecimal(String.valueOf(memberRank.getScale()))));
				}
			}
			return setting.setScale(getProduct().getPrice());
		} else {
			return BigDecimal.ZERO;
		}
	}

	@Transient
	public BigDecimal getSubtotal() {
		if (getQuantity() != null) {
			return getPrice().multiply(new BigDecimal(getQuantity()));
		} else {
			return BigDecimal.ZERO;
		}
	}

	@Transient
	public boolean getIsMarketable() {
		return getProduct() != null && getProduct().getIsMarketable();
	}

	@Transient
	public boolean getIsDelivery() {
		return getProduct() != null && getProduct().getIsDelivery();
	}

	@Transient
	public boolean getIsLowStock() {
		return getQuantity() != null && getProduct() != null && getQuantity() > getProduct().getAvailableStock();
	}

	@Transient
	public void add(int quantity) {
		if (quantity < 1) {
			return;
		}
		if (getQuantity() != null) {
			setQuantity(getQuantity() + quantity);
		} else {
			setQuantity(quantity);
		}
	}

}
