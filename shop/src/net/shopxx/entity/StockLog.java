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
@Table(name = "xx_stock_log")
@SequenceGenerator(name = "sequenceGenerator", sequenceName = "seq_stock_log")
public class StockLog extends BaseEntity<Long> {

	private static final long serialVersionUID = 7611278207105023963L;

	public enum Type {

		stockIn,

		stockOut
	}

	private StockLog.Type type;

	private Integer inQuantity;

	private Integer outQuantity;

	private Integer stock;

	private String operator;

	private String memo;

	private Product product;

	@Column(nullable = false, updatable = false)
	public StockLog.Type getType() {
		return type;
	}

	public void setType(StockLog.Type type) {
		this.type = type;
	}

	@Column(nullable = false, updatable = false)
	public Integer getInQuantity() {
		return inQuantity;
	}

	public void setInQuantity(Integer inQuantity) {
		this.inQuantity = inQuantity;
	}

	@Column(nullable = false, updatable = false)
	public Integer getOutQuantity() {
		return outQuantity;
	}

	public void setOutQuantity(Integer outQuantity) {
		this.outQuantity = outQuantity;
	}

	@Column(nullable = false, updatable = false)
	public Integer getStock() {
		return stock;
	}

	public void setStock(Integer stock) {
		this.stock = stock;
	}

	@Column(nullable = false, updatable = false)
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
	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	@Transient
	public void setOperator(Admin operator) {
		setOperator(operator != null ? operator.getUsername() : null);
	}

}
