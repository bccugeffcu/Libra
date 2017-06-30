/*
 * Copyright 2005-2015 shopxx.net. All rights reserved.
 * Support: http://www.shopxx.net
 * License: http://www.shopxx.net/license
 */
package net.shopxx.entity;

import java.math.BigDecimal;
import java.util.Calendar;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name = "xx_statistic")
@SequenceGenerator(name = "sequenceGenerator", sequenceName = "seq_statistic")
public class Statistic extends BaseEntity<Long> {

	private static final long serialVersionUID = 2544631554461147618L;

	public enum Period {

		year,

		month,

		day
	}

	private Integer year;

	private Integer month;

	private Integer day;

	private Long registerMemberCount;

	private Long createOrderCount;

	private Long completeOrderCount;

	private BigDecimal createOrderAmount;

	private BigDecimal completeOrderAmount;

	public Statistic() {
	}

	public Statistic(Integer year, Long registerMemberCount, Long createOrderCount, Long completeOrderCount, BigDecimal createOrderAmount, BigDecimal completeOrderAmount) {
		this.year = year;
		this.registerMemberCount = registerMemberCount;
		this.createOrderCount = createOrderCount;
		this.completeOrderCount = completeOrderCount;
		this.createOrderAmount = createOrderAmount;
		this.completeOrderAmount = completeOrderAmount;
	}

	public Statistic(Integer year, Integer month, Long registerMemberCount, Long createOrderCount, Long completeOrderCount, BigDecimal createOrderAmount, BigDecimal completeOrderAmount) {
		this.year = year;
		this.month = month;
		this.registerMemberCount = registerMemberCount;
		this.createOrderCount = createOrderCount;
		this.completeOrderCount = completeOrderCount;
		this.createOrderAmount = createOrderAmount;
		this.completeOrderAmount = completeOrderAmount;
	}

	public Statistic(Integer year, Integer month, Integer day, Long registerMemberCount, Long createOrderCount, Long completeOrderCount, BigDecimal createOrderAmount, BigDecimal completeOrderAmount) {
		this.year = year;
		this.month = month;
		this.day = day;
		this.registerMemberCount = registerMemberCount;
		this.createOrderCount = createOrderCount;
		this.completeOrderCount = completeOrderCount;
		this.createOrderAmount = createOrderAmount;
		this.completeOrderAmount = completeOrderAmount;
	}

	@Column(nullable = false, updatable = false)
	public Integer getYear() {
		return year;
	}

	public void setYear(Integer year) {
		this.year = year;
	}

	@Column(nullable = false, updatable = false)
	public Integer getMonth() {
		return month;
	}

	public void setMonth(Integer month) {
		this.month = month;
	}

	@Column(nullable = false, updatable = false)
	public Integer getDay() {
		return day;
	}

	public void setDay(Integer day) {
		this.day = day;
	}

	@Column(nullable = false, updatable = false)
	public Long getRegisterMemberCount() {
		return registerMemberCount;
	}

	public void setRegisterMemberCount(Long registerMemberCount) {
		this.registerMemberCount = registerMemberCount;
	}

	@Column(nullable = false, updatable = false)
	public Long getCreateOrderCount() {
		return createOrderCount;
	}

	public void setCreateOrderCount(Long createOrderCount) {
		this.createOrderCount = createOrderCount;
	}

	@Column(nullable = false, updatable = false)
	public Long getCompleteOrderCount() {
		return completeOrderCount;
	}

	public void setCompleteOrderCount(Long completeOrderCount) {
		this.completeOrderCount = completeOrderCount;
	}

	@Column(nullable = false, updatable = false, precision = 21, scale = 6)
	public BigDecimal getCreateOrderAmount() {
		return createOrderAmount;
	}

	public void setCreateOrderAmount(BigDecimal createOrderAmount) {
		this.createOrderAmount = createOrderAmount;
	}

	@Column(nullable = false, updatable = false, precision = 21, scale = 6)
	public BigDecimal getCompleteOrderAmount() {
		return completeOrderAmount;
	}

	public void setCompleteOrderAmount(BigDecimal completeOrderAmount) {
		this.completeOrderAmount = completeOrderAmount;
	}

	@Transient
	public Date getDate() {
		Calendar calendar = Calendar.getInstance();
		if (getYear() != null) {
			calendar.set(Calendar.YEAR, getYear());
		}
		if (getMonth() != null) {
			calendar.set(Calendar.MONTH, getMonth());
		}
		if (getDay() != null) {
			calendar.set(Calendar.DAY_OF_MONTH, getDay());
		}
		calendar.set(Calendar.HOUR_OF_DAY, 0);
		calendar.set(Calendar.MINUTE, 0);
		calendar.set(Calendar.SECOND, 0);
		return calendar.getTime();
	}

}
