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
@Table(name = "xx_order_log")
@SequenceGenerator(name = "sequenceGenerator", sequenceName = "seq_order_log")
public class OrderLog extends BaseEntity<Long> {

	private static final long serialVersionUID = -6041169490027095909L;

	public enum Type {

		create,

		update,

		cancel,

		review,

		payment,

		refunds,

		shipping,

		returns,

		receive,

		complete,

		fail
	}

	private OrderLog.Type type;

	private String operator;

	private String content;

	private Order order;

	public OrderLog() {
	}

	public OrderLog(OrderLog.Type type, String operator) {
		this.type = type;
		this.operator = operator;
	}

	public OrderLog(OrderLog.Type type, String operator, String content) {
		this.type = type;
		this.operator = operator;
		this.content = content;
	}

	@Column(nullable = false, updatable = false)
	public OrderLog.Type getType() {
		return type;
	}

	public void setType(OrderLog.Type type) {
		this.type = type;
	}

	@Column(updatable = false)
	public String getOperator() {
		return operator;
	}

	public void setOperator(String operator) {
		this.operator = operator;
	}

	@Column(updatable = false)
	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "orders", nullable = false, updatable = false)
	public Order getOrder() {
		return order;
	}

	public void setOrder(Order order) {
		this.order = order;
	}

	@Transient
	public void setOperator(Admin operator) {
		setOperator(operator != null ? operator.getUsername() : null);
	}

}
