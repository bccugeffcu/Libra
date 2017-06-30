/*
 * Copyright 2005-2015 shopxx.net. All rights reserved.
 * Support: http://www.shopxx.net
 * License: http://www.shopxx.net/license
 */
package net.shopxx.entity;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.validation.Valid;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;

public class ParameterValue implements Serializable {

	private static final long serialVersionUID = 5403401900213680549L;

	private String group;

	private List<ParameterValue.Entry> entries = new ArrayList<ParameterValue.Entry>();

	@NotEmpty
	@Length(max = 200)
	public String getGroup() {
		return group;
	}

	public void setGroup(String group) {
		this.group = group;
	}

	@Valid
	@NotEmpty
	public List<ParameterValue.Entry> getEntries() {
		return entries;
	}

	public void setEntries(List<ParameterValue.Entry> entries) {
		this.entries = entries;
	}

	public static class Entry implements Serializable {

		private static final long serialVersionUID = 8599948117179093100L;

		private String name;

		private String value;

		@NotEmpty
		@Length(max = 200)
		public String getName() {
			return name;
		}

		public void setName(String name) {
			this.name = name;
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

}
