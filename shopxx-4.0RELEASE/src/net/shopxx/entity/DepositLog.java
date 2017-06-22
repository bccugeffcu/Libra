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

@Entity
@Table(name = "xx_deposit_log")
@SequenceGenerator(name = "sequenceGenerator", sequenceName = "seq_deposit_log")
public class DepositLog extends BaseEntity<Long> {

	private static final long serialVersionUID = -3264422561139300513L;

	public enum Type {

		recharge,

		adjustment,

		payment,

		refunds
	}

	private DepositLog.Type type;

	private BigDecimal credit;

	private BigDecimal debit;

	private BigDecimal balance;

	private String operator;

	private String memo;

	private Member member;

	@Column(nullable = false, updatable = false)
	public DepositLog.Type getType() {
		return type;
	}

	public void setType(DepositLog.Type type) {
		this.type = type;
	}

	@Column(nullable = false, updatable = false, precision = 21, scale = 6)
	public BigDecimal getCredit() {
		return credit;
	}

	public void setCredit(BigDecimal credit) {
		this.credit = credit;
	}

	@Column(nullable = false, updatable = false, precision = 21, scale = 6)
	public BigDecimal getDebit() {
		return debit;
	}

	public void setDebit(BigDecimal debit) {
		this.debit = debit;
	}

	@Column(nullable = false, updatable = false, precision = 21, scale = 6)
	public BigDecimal getBalance() {
		return balance;
	}

	public void setBalance(BigDecimal balance) {
		this.balance = balance;
	}

	@Column(updatable = false)
	public String getOperator() {
		return operator;
	}

	public void setOperator(String operator) {
		this.operator = operator;
	}

	@Column(updatable = false)
	public String getMemo() {
		return memo;
	}

	public void setMemo(String memo) {
		this.memo = memo;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(nullable = false, updatable = false)
	public Member getMember() {
		return member;
	}

	public void setMember(Member member) {
		this.member = member;
	}

	@Transient
	public void setOperator(Admin operator) {
		setOperator(operator != null ? operator.getUsername() : null);
	}

}
