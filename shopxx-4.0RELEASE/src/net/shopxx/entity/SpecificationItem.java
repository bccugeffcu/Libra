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
import javax.validation.constraints.NotNull;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang.StringUtils;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;

import com.fasterxml.jackson.annotation.JsonIgnore;

public class SpecificationItem implements Serializable {

	private static final long serialVersionUID = 4105717418134464642L;

	private String name;

	private List<SpecificationItem.Entry> entries = new ArrayList<SpecificationItem.Entry>();

	@NotEmpty
	@Length(max = 200)
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Valid
	@NotEmpty
	public List<SpecificationItem.Entry> getEntries() {
		return entries;
	}

	public void setEntries(List<SpecificationItem.Entry> entries) {
		this.entries = entries;
	}

	@JsonIgnore
	public boolean isSelected() {
		if (CollectionUtils.isNotEmpty(getEntries())) {
			for (SpecificationItem.Entry entry : getEntries()) {
				if (entry.getIsSelected()) {
					return true;
				}
			}
		}
		return false;
	}

	public boolean isValid(SpecificationValue specificationValue) {
		if (specificationValue != null && specificationValue.getId() != null && StringUtils.isNotEmpty(specificationValue.getValue()) && CollectionUtils.isNotEmpty(getEntries())) {
			for (SpecificationItem.Entry entry : getEntries()) {
				if (entry != null && entry.getIsSelected() && specificationValue.getId().equals(entry.getId()) && StringUtils.equals(entry.getValue(), specificationValue.getValue())) {
					return true;
				}
			}
		}
		return false;
	}

	public static class Entry implements Serializable {

		private static final long serialVersionUID = 3848877329498738280L;

		private Integer id;

		private String value;

		private Boolean isSelected;

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

		@NotNull
		public Boolean getIsSelected() {
			return isSelected;
		}

		public void setIsSelected(Boolean isSelected) {
			this.isSelected = isSelected;
		}

	}

}
