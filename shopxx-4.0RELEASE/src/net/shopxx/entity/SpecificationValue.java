/*
 * Copyright 2005-2015 shopxx.net. All rights reserved.
 * Support: http://www.shopxx.net
 * License: http://www.shopxx.net/license
 */
package net.shopxx.entity;

import java.io.Serializable;

import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;

public class SpecificationValue implements Serializable {

	private static final long serialVersionUID = 5758856595148450079L;

	private Integer id;

	private String value;

	@NotNull
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@NotEmpty
	@Length(max = 200)
	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}

}
