/*
 * Copyright 2005-2015 shopxx.net. All rights reserved.
 * Support: http://www.shopxx.net
 * License: http://www.shopxx.net/license
 */
package net.shopxx.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.PreRemove;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

@Entity
@Table(name = "xx_coupon_code")
@SequenceGenerator(name = "sequenceGenerator", sequenceName = "seq_coupon_code")
public class CouponCode extends BaseEntity<Long> {

	private static final long serialVersionUID = -4047831860170030507L;

	private String code;

	private Boolean isUsed;

	private Date usedDate;

	private Coupon coupon;

	private Member member;

	private Order order;

	@Column(nullable = false, updatable = false, unique = true)
	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	@Column(nullable = false)
	public Boolean getIsUsed() {
		return isUsed;
	}

	public void setIsUsed(Boolean isUsed) {
		this.isUsed = isUsed;
	}

	public Date getUsedDate() {
		return usedDate;
	}

	public void setUsedDate(Date usedDate) {
		this.usedDate = usedDate;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(nullable = false, updatable = false)
	public Coupon getCoupon() {
		return coupon;
	}

	public void setCoupon(Coupon coupon) {
		this.coupon = coupon;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	public Member getMember() {
		return member;
	}

	public void setMember(Member member) {
		this.member = member;
	}

	@OneToOne(mappedBy = "couponCode", fetch = FetchType.LAZY)
	@JoinColumn(name = "orders")
	public Order getOrder() {
		return order;
	}

	public void setOrder(Order order) {
		this.order = order;
	}

	@PreRemove
	public void preRemove() {
		if (getOrder() != null) {
			getOrder().setCouponCode(null);
		}
	}

}
