/*
 * Copyright 2005-2015 shopxx.net. All rights reserved.
 * Support: http://www.shopxx.net
 * License: http://www.shopxx.net/license
 */
package net.shopxx.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.ManyToOne;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;

@Entity
@Table(name = "xx_delivery_center")
@SequenceGenerator(name = "sequenceGenerator", sequenceName = "seq_delivery_center")
public class DeliveryCenter extends BaseEntity<Long> {

	private static final long serialVersionUID = 8937874680581459480L;

	private String name;

	private String contact;

	private String areaName;

	private String address;

	private String zipCode;

	private String phone;

	private String mobile;

	private String memo;

	private Boolean isDefault;

	private Area area;

	@NotEmpty
	@Length(max = 200)
	@Column(nullable = false)
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@NotEmpty
	@Length(max = 200)
	@Column(nullable = false)
	public String getContact() {
		return contact;
	}

	public void setContact(String contact) {
		this.contact = contact;
	}

	@Column(nullable = false)
	public String getAreaName() {
		return areaName;
	}

	public void setAreaName(String areaName) {
		this.areaName = areaName;
	}

	@NotEmpty
	@Length(max = 200)
	@Column(nullable = false)
	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	@Length(max = 200)
	@Pattern(regexp = "^\\d{6}$")
	public String getZipCode() {
		return zipCode;
	}

	public void setZipCode(String zipCode) {
		this.zipCode = zipCode;
	}

	@Length(max = 200)
	@Pattern(regexp = "^\\d{3,4}-?\\d{7,9}$")
	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	@Length(max = 200)
	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	@Length(max = 200)
	public String getMemo() {
		return memo;
	}

	public void setMemo(String memo) {
		this.memo = memo;
	}

	@NotNull
	@Column(nullable = false)
	public Boolean getIsDefault() {
		return isDefault;
	}

	public void setIsDefault(Boolean isDefault) {
		this.isDefault = isDefault;
	}

	@NotNull
	@ManyToOne(fetch = FetchType.LAZY)
	public Area getArea() {
		return area;
	}

	public void setArea(Area area) {
		this.area = area;
	}

	@PrePersist
	public void prePersist() {
		if (getArea() != null) {
			setAreaName(getArea().getFullName());
		}
	}

	@PreUpdate
	public void preUpdate() {
		if (getArea() != null) {
			setAreaName(getArea().getFullName());
		}
	}

}
