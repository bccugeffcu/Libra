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
import javax.validation.constraints.NotNull;

@Entity
@Table(name = "xx_message_config")
@SequenceGenerator(name = "sequenceGenerator", sequenceName = "seq_message_config")
public class MessageConfig extends BaseEntity<Long> {

	private static final long serialVersionUID = -7225390016334424400L;

	public enum Type {

		registerMember,

		createOrder,

		updateOrder,

		cancelOrder,

		reviewOrder,

		paymentOrder,

		refundsOrder,

		shippingOrder,

		returnsOrder,

		receiveOrder,

		completeOrder,

		failOrder
	}

	private MessageConfig.Type type;

	private Boolean isMailEnabled;

	private Boolean isSmsEnabled;

	@Column(nullable = false, updatable = false, unique = true)
	public MessageConfig.Type getType() {
		return type;
	}

	public void setType(MessageConfig.Type type) {
		this.type = type;
	}

	@NotNull
	@Column(nullable = false)
	public Boolean getIsMailEnabled() {
		return isMailEnabled;
	}

	public void setIsMailEnabled(Boolean isMailEnabled) {
		this.isMailEnabled = isMailEnabled;
	}

	@NotNull
	@Column(nullable = false)
	public Boolean getIsSmsEnabled() {
		return isSmsEnabled;
	}

	public void setIsSmsEnabled(Boolean isSmsEnabled) {
		this.isSmsEnabled = isSmsEnabled;
	}

}
