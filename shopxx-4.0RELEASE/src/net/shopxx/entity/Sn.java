/*
 * Copyright 2005-2015 shopxx.net. All rights reserved.
 * Support: http://www.shopxx.net
 * License: http://www.shopxx.net/license
 */
package net.shopxx.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

@Entity
@Table(name = "xx_sn")
@SequenceGenerator(name = "sequenceGenerator", sequenceName = "seq_sn")
public class Sn extends BaseEntity<Long> {

	private static final long serialVersionUID = -7104999495324056608L;

	public enum Type {

		goods,

		order,

		paymentLog,

		payment,

		refunds,

		shipping,

		returns
	}

	private Sn.Type type;

	private Long lastValue;

	@Column(nullable = false, updatable = false, unique = true)
	public Sn.Type getType() {
		return type;
	}

	public void setType(Sn.Type type) {
		this.type = type;
	}

	@Column(nullable = false)
	public Long getLastValue() {
		return lastValue;
	}

	public void setLastValue(Long lastValue) {
		this.lastValue = lastValue;
	}

}
