/*
 * Copyright 2005-2015 shopxx.net. All rights reserved.
 * Support: http://www.shopxx.net
 * License: http://www.shopxx.net/license
 */
package net.shopxx.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name = "xx_point_log")
@SequenceGenerator(name = "sequenceGenerator", sequenceName = "seq_point_log")
public class PointLog extends BaseEntity<Long> {

	private static final long serialVersionUID = -654174585999512210L;

	public enum Type {

		reward,

		exchange,

		undoExchange,

		adjustment
	}

	private PointLog.Type type;

	private Long credit;

	private Long debit;

	private Long balance;

	private String operator;

	private String memo;

	private Member member;

	@Column(nullable = false, updatable = false)
	public PointLog.Type getType() {
		return type;
	}

	public void setType(PointLog.Type type) {
		this.type = type;
	}

	@Column(nullable = false, updatable = false)
	public Long getCredit() {
		return credit;
	}

	public void setCredit(Long credit) {
		this.credit = credit;
	}

	@Column(nullable = false, updatable = false)
	public Long getDebit() {
		return debit;
	}

	public void setDebit(Long debit) {
		this.debit = debit;
	}

	@Column(nullable = false, updatable = false)
	public Long getBalance() {
		return balance;
	}

	public void setBalance(Long balance) {
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
