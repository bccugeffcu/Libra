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
import javax.validation.constraints.Digits;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.Length;

@Entity
@Table(name = "xx_refunds")
@SequenceGenerator(name = "sequenceGenerator", sequenceName = "seq_refunds")
public class Refunds extends BaseEntity<Long> {

	private static final long serialVersionUID = 2599415214758331061L;

	public enum Method {

		online,

		offline,

		deposit
	}

	private String sn;

	private Refunds.Method method;

	private String paymentMethod;

	private String bank;

	private String account;

	private BigDecimal amount;

	private String payee;

	private String operator;

	private String memo;

	private Order order;

	@Column(nullable = false, updatable = false, unique = true)
	public String getSn() {
		return sn;
	}

	public void setSn(String sn) {
		this.sn = sn;
	}

	@NotNull
	@Column(nullable = false, updatable = false)
	public Refunds.Method getMethod() {
		return method;
	}

	public void setMethod(Refunds.Method method) {
		this.method = method;
	}

	@Column(updatable = false)
	public String getPaymentMethod() {
		return paymentMethod;
	}

	public void setPaymentMethod(String paymentMethod) {
		this.paymentMethod = paymentMethod;
	}

	@Length(max = 200)
	@Column(updatable = false)
	public String getBank() {
		return bank;
	}

	public void setBank(String bank) {
		this.bank = bank;
	}

	@Length(max = 200)
	@Column(updatable = false)
	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	@NotNull
	@Min(0)
	@Digits(integer = 12, fraction = 3)
	@Column(nullable = false, updatable = false, precision = 21, scale = 6)
	public BigDecimal getAmount() {
		return amount;
	}

	public void setAmount(BigDecimal amount) {
		this.amount = amount;
	}

	@Length(max = 200)
	@Column(updatable = false)
	public String getPayee() {
		return payee;
	}

	public void setPayee(String payee) {
		this.payee = payee;
	}

	@Column(nullable = false, updatable = false)
	public String getOperator() {
		return operator;
	}

	public void setOperator(String operator) {
		this.operator = operator;
	}

	@Length(max = 200)
	@Column(updatable = false)
	public String getMemo() {
		return memo;
	}

	public void setMemo(String memo) {
		this.memo = memo;
	}

	@NotNull
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "orders", nullable = false, updatable = false)
	public Order getOrder() {
		return order;
	}

	public void setOrder(Order order) {
		this.order = order;
	}

	@Transient
	public void setPaymentMethod(PaymentMethod paymentMethod) {
		setPaymentMethod(paymentMethod != null ? paymentMethod.getName() : null);
	}

	@Transient
	public void setOperator(Admin operator) {
		setOperator(operator != null ? operator.getUsername() : null);
	}

}
