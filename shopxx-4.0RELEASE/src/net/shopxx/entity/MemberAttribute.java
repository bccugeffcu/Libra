/*
 * Copyright 2005-2015 shopxx.net. All rights reserved.
 * Support: http://www.shopxx.net
 * License: http://www.shopxx.net/license
 */
package net.shopxx.entity;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.AttributeConverter;
import javax.persistence.Column;
import javax.persistence.Convert;
import javax.persistence.Converter;
import javax.persistence.Entity;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

import net.shopxx.BaseAttributeConverter;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;

@Entity
@Table(name = "xx_member_attribute")
@SequenceGenerator(name = "sequenceGenerator", sequenceName = "seq_member_attribute")
public class MemberAttribute extends OrderEntity<Long> {

	private static final long serialVersionUID = 3819396051409343162L;

	public enum Type {

		name,

		gender,

		birth,

		area,

		address,

		zipCode,

		phone,

		mobile,

		text,

		select,

		checkbox
	}

	private String name;

	private MemberAttribute.Type type;

	private String pattern;

	private Boolean isEnabled;

	private Boolean isRequired;

	private Integer propertyIndex;

	private List<String> options = new ArrayList<String>();

	@NotEmpty
	@Length(max = 200)
	@Column(nullable = false)
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@NotNull(groups = Save.class)
	@Column(nullable = false, updatable = false)
	public MemberAttribute.Type getType() {
		return type;
	}

	public void setType(MemberAttribute.Type type) {
		this.type = type;
	}

	@Length(max = 200)
	public String getPattern() {
		return pattern;
	}

	public void setPattern(String pattern) {
		this.pattern = pattern;
	}

	@NotNull
	@Column(nullable = false)
	public Boolean getIsEnabled() {
		return isEnabled;
	}

	public void setIsEnabled(Boolean isEnabled) {
		this.isEnabled = isEnabled;
	}

	@NotNull
	@Column(nullable = false)
	public Boolean getIsRequired() {
		return isRequired;
	}

	public void setIsRequired(Boolean isRequired) {
		this.isRequired = isRequired;
	}

	@Column(updatable = false)
	public Integer getPropertyIndex() {
		return propertyIndex;
	}

	public void setPropertyIndex(Integer propertyIndex) {
		this.propertyIndex = propertyIndex;
	}

	@Column(length = 4000)
	@Convert(converter = OptionConverter.class)
	public List<String> getOptions() {
		return options;
	}

	public void setOptions(List<String> options) {
		this.options = options;
	}

	@Converter
	public static class OptionConverter extends BaseAttributeConverter<List<String>> implements AttributeConverter<Object, String> {
	}

}
